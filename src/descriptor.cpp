#include <cstring>
#include "descriptor.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "room.hpp"
#include "pcdata.hpp"
#include "systemdata.hpp"
#include "repos/descriptorrepository.hpp"

/*
 * Socket and TCP/IP stuff.
 */
#include <arpa/telnet.h>

static const char go_ahead_str[] = { (const char)IAC, (const char)GA, '\0' };

struct Descriptor::Impl
{
  char InBuffer[MAX_INBUF_SIZE] = {'\0'};
  char InLast[MAX_INPUT_LENGTH] = {'\0'};
  int Repeat = 0;
};

Descriptor::Descriptor(socket_t desc)
  : pImpl(new Impl())
{
  Socket = desc;
  ConnectionState = CON_GET_NAME;
  OutSize = 2000;
  PreviousColor = 0x07;

  AllocateMemory( OutBuffer, char, OutSize );
}

Descriptor::~Descriptor()
{
  FreeMemory(OutBuffer);
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
          Log->Bug("Buffer overflow. Closing (%s).",
                   Character ? Character->Name.c_str() : "???" );
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

bool Descriptor::CheckReconnect( const std::string &name, bool fConn )
{
  for ( class Character *ch = FirstCharacter; ch; ch = ch->Next )
    {
      if ( !IsNpc(ch)
           && ( !fConn || !ch->Desc )
           && !ch->Name.empty()
           && !StrCmp( name, ch->Name ) )
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
              Character->PCData->Password = ch->PCData->Password;
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
              sprintf( log_buf, "%s@%s reconnected.",
                       ch->Name.c_str(), Remote.Hostname.c_str() );
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
  for ( Descriptor *dold : Descriptors->Entities() )
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
                   dold->Original ? dold->Original->Name.c_str() : dold->Character->Name.c_str(),
                   Character->Name.c_str() );
          Log->LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );
          FreeCharacter( Character );
          Character = nullptr;
          return true;
        }
    }

  return false;
}

unsigned char Descriptor::CheckPlaying( const std::string &name, bool kick )
{
  for ( Descriptor *dold : Descriptors->Entities() )
    {
      if ( dold != this
           && ( dold->Character || dold->Original )
           && !StrCmp( name, dold->Original
                       ? dold->Original->Name : dold->Character->Name ) )
        {
          const int cstate = dold->ConnectionState;
          class Character *ch = dold->Original ? dold->Original : dold->Character;
          
          if ( ch->Name.empty()
               || ( cstate != CON_PLAYING && cstate != CON_EDITING ) )
            {
              WriteToBuffer( "Already connected - try again.\r\n", 0 );
              sprintf( log_buf, "%s already connected.", ch->Name.c_str() );
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
                   ch->Name.c_str(), Remote.Hostname.c_str() );
          Log->LogStringPlus( log_buf, LOG_COMM, umax( SysData.LevelOfLogChannel, ch->TopLevel ) );

          ConnectionState = cstate;
          return true;
        }
    }

  return false;
}

bool Descriptor::FlushBuffer(bool fPrompt)
{
  char buf[MAX_INPUT_LENGTH] = {'\0'};
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
          char snoopbuf[MAX_INPUT_LENGTH] = {'\0'};
          buf[512] = '\0';

          if ( Character && !Character->Name.empty() )
            {
              if (Original && !Original->Name.empty())
                sprintf( snoopbuf, "%s (%s)", Character->Name.c_str(), Original->Name.c_str() );
              else
                sprintf( snoopbuf, "%s", Character->Name.c_str());

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
        DisplayPrompt(this);

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
      if ( Character && !Character->Name.empty() )
        {
          /* Show original snooped names. -- Altrag */
          if ( Original && !Original->Name.empty() )
            sprintf( buf, "%s (%s)", Character->Name.c_str(), Original->Name.c_str() );
          else
            sprintf( buf, "%s", Character->Name.c_str());

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
      Log->Info( "%s input overflow!", Remote.Hostname.c_str() );
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
