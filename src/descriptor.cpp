#include <cstring>
#include "descriptor.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "room.hpp"
#include "pcdata.hpp"

static int GetColorIndex(char clr)
{
  static const char colors[] = "xrgObpcwzRGYBPCW";
  int r;

  for ( r = 0; r < 16; r++ )
    if ( clr == colors[r] )
      return r;
  return -1;
}

/*
 * Socket and TCP/IP stuff.
 */
#include <arpa/telnet.h>

static const char go_ahead_str[] = { (const char)IAC, (const char)GA, '\0' };

struct Descriptor::Impl
{
  char InBuffer[MAX_INBUF_SIZE];
  char InLast[MAX_INPUT_LENGTH];
  int Repeat = 0;
  unsigned char PreviousColor = 0;
};

Descriptor::Descriptor(socket_t desc)
  : pImpl(new Impl())
{
  Socket = desc;
  ConnectionState = CON_GET_NAME;
  OutSize = 2000;
  pImpl->PreviousColor = 0x07;

  AllocateMemory( OutBuffer, char, OutSize );
}

Descriptor::~Descriptor()
{
  delete pImpl;
}

void Descriptor::WriteToBuffer(const std::string &txt, size_t length)
{
  /*
   * Find length in case caller didn't.
   */
  if ( length <= 0 )
    {
      length = txt.size();
    }
  
  /*
   * Initial \r\n if needed.
   */
  if ( OutTop == 0 && !fCommand )
    {
      OutBuffer[0]      = '\n';
      OutBuffer[1]      = '\r';
      OutTop = 2;
    }

  /*
   * Expand the buffer as needed.
   */
  while ( OutTop + length >= OutSize )
    {
      if (OutSize > SHRT_MAX)
        {
          /* empty buffer */
          OutTop = 0;
          Log->Bug("Buffer overflow. Closing (%s).", Character ? Character->Name : "???" );
          CloseDescriptor(this, true);
          return;
        }

      OutSize *= 2;
      ReAllocateMemory( OutBuffer, char, OutSize );
    }

  /*
   * Copy.
   */
  strncpy( OutBuffer + OutTop, txt.c_str(), length );
  OutTop += length;
  OutBuffer[OutTop] = '\0';
}

int Descriptor::MakeColorSequence(const std::string &c, char *buf)
{
  const char *col = c.c_str();
  int ln = 0;
  const char *ctype = col;
  unsigned char cl = 0;
  class Character *och = Original ? Original : Character;
  const bool ansi = !IsNpc(och) && IsBitSet(och->Flags, PLR_ANSI);

  col++;

  if (IsNullOrEmpty(col))
    {
      ln = -1;
    }
  else if ( *ctype != '&' && *ctype != '^' )
    {
      Log->Bug("%s: command '%c' not '&' or '^'.", __FUNCTION__, *ctype);
      ln = -1;
    }
  else if ( *col == *ctype )
    {
      buf[0] = *col;
      buf[1] = '\0';
      ln = 1;
    }
  else if ( !ansi )
    {
      ln = 0;
    }
  else
    {
      cl = pImpl->PreviousColor;

      switch(*ctype)
        {
        default:
          Log->Bug( "%s: bad command char '%c'.", __FUNCTION__, *ctype );
          ln = -1;
          break;

        case '&':
          if ( *col == '-' )
            {
              buf[0] = '~';
              buf[1] = '\0';
              ln = 1;
              /*break;*/
            }

          break;

        case '^':
          {
            const int newcol = GetColorIndex(*col);

            if ( newcol < 0 )
              {
                ln = 0;
                break;
              }
            else if ( *ctype == '&' )
              {
                cl = (cl & 0xF0) | newcol;
              }
            else
              {
                cl = (cl & 0x0F) | (newcol << 4);
              }
          }

          if ( cl == pImpl->PreviousColor )
            {
              ln = 0;
              break;
            }

          strcpy(buf, "\033[");

          if ( (cl & 0x88) != (pImpl->PreviousColor & 0x88) )
            {
              strcat(buf, "m\033[");

              if ( cl & 0x08 )
                {
                  strcat(buf, "1;");
                }

              if ( cl & 0x80 )
                {
                  strcat(buf, "5;");
                }

              pImpl->PreviousColor = 0x07 | (cl & 0x88);
              ln = strlen(buf);
            }
          else
            {
              ln = 2;
            }

          if ( (cl & 0x07) != (pImpl->PreviousColor & 0x07) )
            {
              sprintf(buf + ln, "3%d;", cl & 0x07);
              ln += 3;
            }

          if ( (cl & 0x70) != (pImpl->PreviousColor & 0x70) )
            {
              sprintf(buf+ln, "4%d;", (cl & 0x70) >> 4);
              ln += 3;
            }

          if ( buf[ln-1] == ';' )
            {
              buf[ln-1] = 'm';
            }
          else
            {
              buf[ln++] = 'm';
              buf[ln] = '\0';
            }

          pImpl->PreviousColor = cl;
        }
    }

  if ( ln <= 0 )
    {
      *buf = '\0';
    }

  return ln;
}

bool Descriptor::CheckReconnect( const std::string &name, bool fConn )
{
  for ( class Character *ch = FirstCharacter; ch; ch = ch->Next )
    {
      if ( !IsNpc(ch)
           && ( !fConn || !ch->Desc )
           &&    ch->Name
           &&   !StrCmp( name, ch->Name ) )
        {
          if ( fConn && ch->Switched )
            {
              WriteToBuffer( "Already playing.\r\nName: ", 0 );
              ConnectionState = CON_GET_NAME;

              if ( Character != nullptr )
                {
                  /* clear descriptor pointer to get rid of bug message in log */
                  Character->Desc = nullptr;
                  FreeCharacter( Character );
                  Character = nullptr;
                }
              
              return BERR;
            }
          
          if ( fConn == false )
            {
              FreeMemory( Character->PCData->Password );
              Character->PCData->Password = CopyString( ch->PCData->Password );
            }
          else
            {
              /* clear descriptor pointer to get rid of bug message in log */
              Character->Desc = nullptr;
              FreeCharacter( Character );
              Character = ch;
              ch->Desc = this;
              ch->IdleTimer = 0;
              ch->Echo( "Reconnecting.\r\n" );
              Act( AT_ACTION, "$n has reconnected.", ch, nullptr, nullptr, TO_ROOM );
              sprintf( log_buf, "%s@%s reconnected.", ch->Name, Remote.Hostname );
              Log->LogStringPlus( log_buf, LOG_COMM, umax( SysData.LevelOfLogChannel, ch->TopLevel ) );
              ConnectionState = CON_PLAYING;
            }

          return true;
        }
    }

  return false;
}

bool Descriptor::CheckMultiplaying( const std::string &name )
{
  for ( Descriptor *dold = FirstDescriptor; dold; dold = dold->Next )
    {
      if ( dold != this
           && ( dold->Character || dold->Original )
           &&   StrCmp( name, dold->Original
                         ? dold->Original->Name : dold->Character->Name )
           && !StrCmp(dold->Remote.Hostname , this->Remote.Hostname ) )
        {
          if ( Character->TopLevel >= LEVEL_CREATOR
               || ( dold->Original ? dold->Original : dold->Character )->TopLevel >= LEVEL_CREATOR )
            {
              return false;
            }
          
          WriteToBuffer( "Sorry multi-playing is not allowed... have your other character quit first.\r\n" );
          sprintf( log_buf, "%s attempting to multiplay with %s.",
                   dold->Original ? dold->Original->Name : dold->Character->Name,
                   Character->Name );
          Log->LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );
          Character = nullptr;
          FreeCharacter( Character );
          return true;
        }
    }

  return false;
}

unsigned char Descriptor::CheckPlaying( const std::string &name, bool kick )
{
  for ( Descriptor *dold = FirstDescriptor; dold; dold = dold->Next )
    {
      if ( dold != this
           && ( dold->Character || dold->Original )
           && !StrCmp( name, dold->Original
                       ? dold->Original->Name : dold->Character->Name ) )
        {
          const int cstate = dold->ConnectionState;
          class Character *ch = dold->Original ? dold->Original : dold->Character;
          
          if ( !ch->Name
               || ( cstate != CON_PLAYING && cstate != CON_EDITING ) )
            {
              WriteToBuffer( "Already connected - try again.\r\n", 0 );
              sprintf( log_buf, "%s already connected.", ch->Name );
              Log->LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );
              return BERR;
            }

          if ( !kick )
            {
              return true;
            }
          
          WriteToBuffer( "Already playing... Kicking off old connection.\r\n", 0 );
          dold->WriteToBuffer( "Kicking off old connection... bye!\r\n", 0 );
          CloseDescriptor( dold, false );
          /* clear descriptor pointer to get rid of bug message in log */
          Character->Desc = nullptr;
          FreeCharacter( Character );
          Character = ch;
          ch->Desc = this;
          ch->IdleTimer = 0;

          if ( ch->Switched )
            {
              do_return( ch->Switched, "" );
            }
          
          ch->Switched = nullptr;
          ch->Echo( "Reconnecting.\r\n" );
          Act( AT_ACTION, "$n has reconnected, kicking off old link.",
               ch, nullptr, nullptr, TO_ROOM );
          sprintf( log_buf, "%s@%s reconnected, kicking off old link.",
                   ch->Name, Remote.Hostname );
          Log->LogStringPlus( log_buf, LOG_COMM, umax( SysData.LevelOfLogChannel, ch->TopLevel ) );

          ConnectionState = cstate;
          return true;
        }
    }

  return false;
}

void Descriptor::DisplayPrompt()
{
  const class Character *ch = Character;
  const class Character *och = Original ? Original : Character;
  const bool ansi = (!IsNpc(och) && IsBitSet(och->Flags, PLR_ANSI));
  const char *prompt = nullptr;
  char buf[MAX_STRING_LENGTH];
  char *pbuf = buf;
  int the_stat = 0;

  if ( !ch )
    {
      Log->Bug( "%s: NULL ch", __FUNCTION__ );
      return;
    }

  if ( !IsNpc(ch) && ch->SubState != SUB_NONE && !IsNullOrEmpty( ch->PCData->SubPrompt ) )
    prompt = ch->PCData->SubPrompt;
  else if ( IsNpc(ch) || IsNullOrEmpty( ch->PCData->Prompt ) )
    prompt = DefaultPrompt(ch);
  else
    prompt = ch->PCData->Prompt;

  if ( ansi )
    {
      strcpy(pbuf, "\033[m");
      pImpl->PreviousColor = 0x07;
      pbuf += 3;
    }

  for ( ; *prompt; prompt++ )
    {
      /*
       * '&' = foreground color/intensity bit
       * '^' = background color/blink bit
       * '%' = prompt commands
       * Note: foreground changes will revert background to 0 (black)
       */
      if ( *prompt != '&' && *prompt != '^' && *prompt != '%' )
        {
          *(pbuf++) = *prompt;
          continue;
          }

      ++prompt;

      if ( !*prompt )
        break;

      if ( *prompt == *(prompt-1) )
        {
          *(pbuf++) = *prompt;
          continue;
        }

      switch(*(prompt-1))
        {
        default:
          Log->Bug( "Display_prompt: bad command char '%c'.", *(prompt-1) );
          break;

        case '&':
        case '^':
          the_stat = MakeColorSequence(&prompt[-1], pbuf);
          if ( the_stat < 0 )
            --prompt;
          else if ( the_stat > 0 )
            pbuf += the_stat;
          break;

          case '%':
          *pbuf = '\0';
          the_stat = 0x80000000;

          switch(*prompt)
            {
            case '%':
              *pbuf++ = '%';
              *pbuf = '\0';
              break;

            case 'a':
              if ( ch->TopLevel >= 10 )
                the_stat = ch->Alignment;
              else if ( IsGood(ch) )
                strcpy(pbuf, "good");
              else if ( IsEvil(ch) )
                strcpy(pbuf, "evil");
              else
                strcpy(pbuf, "neutral");
              break;

            case 'h':
              the_stat = ch->Hit;
              break;

              case 'H':
              the_stat = ch->MaxHit;
              break;

            case 'm':
              if ( IsImmortal(ch) || IsJedi( ch ) )
                the_stat = ch->Mana;
              else
                the_stat = 0;
              break;

            case 'M':
              if ( IsImmortal(ch) || IsJedi( ch ) )
                the_stat = ch->MaxMana;
              else
                the_stat = 0;
              break;

            case 'p':
              if ( ch->Position == POS_RESTING )
                strcpy(pbuf, "resting");
              else if ( ch->Position == POS_SLEEPING )
                strcpy(pbuf, "sleeping");
              else if ( ch->Position == POS_SITTING )
                strcpy(pbuf, "sitting");
              break;

              case 'u':
              the_stat = num_descriptors;
              break;

            case 'U':
              the_stat = SysData.MaxPlayersThisBoot;
              break;

            case 'v':
              the_stat = ch->Move;
              break;

            case 'V':
              the_stat = ch->MaxMove;
              break;

            case 'g':
              the_stat = ch->Gold;
              break;

            case 'r':
              if ( IsImmortal(och) )
                the_stat = ch->InRoom->Vnum;
              break;

            case 'R':
              if ( IsBitSet(och->Flags, PLR_ROOMVNUM) )
                sprintf(pbuf, "<#%ld> ", ch->InRoom->Vnum);
              break;

            case 'i':
              if ( (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_WIZINVIS)) ||
                   (IsNpc(ch) && IsBitSet(ch->Flags, ACT_MOBINVIS)) )
                sprintf(pbuf, "(Invis %d) ", (IsNpc(ch) ? ch->MobInvis : ch->PCData->WizInvis));
              else if ( IsAffectedBy(ch, AFF_INVISIBLE) )
                sprintf(pbuf, "(Invis) " );
              break;

            case 'I':
              the_stat = (IsNpc(ch) ? (IsBitSet(ch->Flags, ACT_MOBINVIS) ? ch->MobInvis : 0)
                      : (IsBitSet(ch->Flags, PLR_WIZINVIS) ? ch->PCData->WizInvis : 0));
              break;
            }

          if ( (unsigned int)the_stat != 0x80000000 )
            sprintf(pbuf, "%d", the_stat);

          pbuf += strlen(pbuf);
          break;
        }
    }

  *pbuf = '\0';
  WriteToBuffer( buf, (pbuf - buf));
}

bool Descriptor::FlushBuffer(bool fPrompt)
{
  char buf[MAX_INPUT_LENGTH];
  class Character *ch = Original ? Original : Character;

  if( ch && ch->Fighting && ch->Fighting->Who )
    ShowCharacterCondition( ch, ch->Fighting->Who );

  /*
   * If buffer has more than 4K inside, spit out .5K at a time   -Thoric
   */
  if ( !mud_down && OutTop > 4096 )
    {
      memcpy( buf, OutBuffer, 512 );
      memmove( OutBuffer, OutBuffer + 512, OutTop - 512 );
      OutTop -= 512;

      if ( SnoopBy )
        {
          char snoopbuf[MAX_INPUT_LENGTH];
          buf[512] = '\0';

          if ( Character && Character->Name )
            {
              if (Original && Original->Name)
                sprintf( snoopbuf, "%s (%s)", Character->Name, Original->Name );
              else
                sprintf( snoopbuf, "%s", Character->Name);

              SnoopBy->WriteToBuffer( snoopbuf );
            }

          SnoopBy->WriteToBuffer( "% ", 2 );
          SnoopBy->WriteToBuffer( buf );
        }

      if ( !WriteToDescriptor( Socket, buf, 512 ) )
        {
          OutTop = 0;
          return false;
        }

      return true;
    }


  /*
   * Bust a prompt.
   */
  if ( fPrompt && !mud_down && ConnectionState == CON_PLAYING )
    {
      ch = Original ? Original : Character;

      if ( IsBitSet(ch->Flags, PLR_BLANK) )
        WriteToBuffer( "\r\n", 2 );

      if ( IsBitSet(ch->Flags, PLR_PROMPT) )
        DisplayPrompt();

      if ( IsBitSet(ch->Flags, PLR_TELNET_GA) )
        WriteToBuffer( go_ahead_str, 0 );
    }

  /*
   * Short-circuit if nothing to write.
   */
  if ( OutTop == 0 )
    return true;

  /*
   * Snoop-o-rama.
   */
  if ( SnoopBy )
    {
      /* without check, 'force mortal quit' while snooped caused crash, -h */
      if ( Character && Character->Name )
        {
          /* Show original snooped names. -- Altrag */
          if ( Original && Original->Name )
            sprintf( buf, "%s (%s)", Character->Name, Original->Name );
          else
            sprintf( buf, "%s", Character->Name);

          SnoopBy->WriteToBuffer( buf );
        }

      SnoopBy->WriteToBuffer( "% ", 2 );
      SnoopBy->WriteToBuffer( OutBuffer, OutTop );
    }

  /*
   * OS-dependent output.
   */
  OutTop = 0;
  
  if ( !WriteToDescriptor( Socket, OutBuffer, OutTop ) )
    {
      return false;
    }
  else
    {
      return true;
    }
}

bool Descriptor::Read()
{
  size_t iStart = 0;

  if ( !IsNullOrEmpty( InComm ) )
    return true;

  iStart = strlen(pImpl->InBuffer);

  if ( iStart >= sizeof(pImpl->InBuffer) - 10 )
    {
      sprintf( log_buf, "%s input overflow!", Remote.Hostname );
      Log->Info( log_buf );
      WriteToDescriptor( Socket,
                         "\r\n*** PUT A LID ON IT!!! ***\r\n", 0 );
      return false;
    }

  for ( ; ; )
    {
      ssize_t nRead = recv( Socket, pImpl->InBuffer + iStart,
                            sizeof( pImpl->InBuffer ) - 10 - iStart, 0 );

      if ( nRead == 0 )
        {
          Log->LogStringPlus( "EOF encountered on read.", LOG_COMM, SysData.LevelOfLogChannel );
          return false;
        }

      if( nRead == SOCKET_ERROR )
        {
          if( GETERROR == EWOULDBLOCK || GETERROR == EAGAIN )
            {
              break;
            }
          else
            {
              Log->LogStringPlus( strerror( GETERROR ), LOG_COMM, SysData.LevelOfLogChannel );
              return false;
            }
        }

      iStart += nRead;

      if ( pImpl->InBuffer[iStart-1] == '\n' || pImpl->InBuffer[iStart-1] == '\r' )
        {
          break;
        }
    }

  pImpl->InBuffer[iStart] = '\0';
  return true;
}

void Descriptor::ReadFromBuffer()
{
  /*
   * Hold horses if pending command already.
   */
  if ( !IsNullOrEmpty( InComm ) )
    return;

  /*
   * Look for at least one new line.
*/
  for ( int i = 0; pImpl->InBuffer[i] != '\n' && pImpl->InBuffer[i] != '\r' && i<MAX_INBUF_SIZE;
        i++ )
    {
      if ( pImpl->InBuffer[i] == '\0' )
        return;
    }

  /*
   * Canonical input processing.
   */
  int i = 0;
  int k = 0;
  
  for ( i = 0, k = 0; pImpl->InBuffer[i] != '\n' && pImpl->InBuffer[i] != '\r'; i++ )
    {
      if ( k >= 254 )
        {
          WriteToDescriptor( Socket, "Line too long.\r\n", 0 );

          pImpl->InBuffer[i]   = '\n';
          pImpl->InBuffer[i+1] = '\0';
          break;
        }

      if ( pImpl->InBuffer[i] == '\b' && k > 0 )
        --k;
      else if ( isascii(pImpl->InBuffer[i]) && isprint(pImpl->InBuffer[i]) )
        InComm[k++] = pImpl->InBuffer[i];
    }

  /*
   * Finish off the line.
   */
  if ( k == 0 )
    InComm[k++] = ' ';

  InComm[k] = '\0';

  /*
   * Deal with bozos with #repeat 1000 ...
   */
  if ( k > 1 || InComm[0] == '!' )
    {
      if ( InComm[0] != '!' && StrCmp( InComm, pImpl->InLast ) )
        {
          pImpl->Repeat = 0;
        }
      else
        {
          if ( ++pImpl->Repeat >= 100 )
            {
              WriteToDescriptor( Socket,
                                 "\r\n*** PUT A LID ON IT!!! ***\r\n", 0 );
            }
        }
    }

  /*
   * Do '!' substitution.
   */
  if ( InComm[0] == '!' )
    strcpy( InComm, pImpl->InLast );
  else
    strcpy( pImpl->InLast, InComm );

  /*
   * Shift the input buffer.
   */
  while ( pImpl->InBuffer[i] == '\n' || pImpl->InBuffer[i] == '\r' )
    i++;

  for ( int j = 0; ( pImpl->InBuffer[j] = pImpl->InBuffer[i+j] ) != '\0'; j++ )
    ;
}

///////////////////////////////////////////////////
// NullDescriptor
NullDescriptor::NullDescriptor()
  : Descriptor(INVALID_SOCKET)
{

}

void NullDescriptor::WriteToBuffer(const std::string &txt, size_t len)
{

}

int NullDescriptor::MakeColorSequence(const std::string &col, char *buf)
{
  return 0;
}

bool NullDescriptor::CheckReconnect(const std::string &name, bool fConn )
{
  return false;
}

unsigned char NullDescriptor::CheckPlaying(const std::string &name, bool kick )
{
  return 0;
}

bool NullDescriptor::CheckMultiplaying(const std::string &name )
{
  return false;
}

void NullDescriptor::DisplayPrompt()
{

}

bool NullDescriptor::FlushBuffer(bool fPrompt)
{
  return true;
}

void NullDescriptor::ReadFromBuffer()
{

}

bool NullDescriptor::Read()
{
  return true;
}
