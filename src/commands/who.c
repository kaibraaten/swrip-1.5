#include <string.h>
#include "mud.h"
#include "character.h"
#include "clan.h"

/*
 * New do_who with WHO REQUEST, clan, race and homepage support.  -Thoric
 *
 * Latest version of do_who eliminates redundant code by using linked lists.
 * Shows imms separately, indicates guest and retired immortals.
 * Narn, Oct/96

 * Changed it so that only immortals can access the who clan list for
 * a clan other than your own, as well as who level information.

 * *wanted for murder* flags will no only show up for immortals

 * Darrik Vequir, Feb/00

 * Who will now show forcers for immortals - DV Sep/00

 * Races will no longer show up for mortals - DV Oct/00

 */
void do_who( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH] = {'\0'};
  char clan_name[MAX_INPUT_LENGTH];
  char invis_str[MAX_INPUT_LENGTH];
  char char_name[MAX_INPUT_LENGTH];
  char extra_title[MAX_STRING_LENGTH];
  char race_text[MAX_INPUT_LENGTH];
  Descriptor *d;
  int iRace;
  int iLevelLower;
  int iLevelUpper;
  int nNumber;
  int nMatch;
  bool rgfRace[MAX_RACE];
  bool fRaceRestrict;
  bool fImmortalOnly;
  bool fShowHomepage;
  bool fClanMatch;
  bool NullCh = false;
  Clan *pClan;
  FILE *whoout;
  PCData *pcdata;
  WhoData *cur_who = NULL;
  WhoData *next_who = NULL;
  WhoData *first_mortal = NULL;
  WhoData *first_newbie = NULL;
  WhoData *first_imm = NULL;

  /*
   * Set default arguments.
   */

  iLevelLower    = 0;
  iLevelUpper    = MAX_LEVEL;

  fRaceRestrict  = false;
  fImmortalOnly  = false;
  fShowHomepage  = false;
  fClanMatch = false;

  for ( iRace = 0; iRace < MAX_RACE; iRace++ )
    rgfRace[iRace] = false;

  if ( !ch )
    {
      NullCh = true;
      AllocateMemory( ch, Character, 1 );
      ch->TopLevel = 1;
      ch->Trust = 0;
      AllocateMemory( pcdata, PCData, 1 );
      ch->PCData = pcdata;
      ch->InRoom = GetRoom( ROOM_VNUM_LIMBO );
    }

  /*
   * Parse arguments.
   */
  nNumber = 0;

  for ( ;; )
    {
      char arg[MAX_STRING_LENGTH];
      argument = OneArgument( argument, arg );
      if ( IsNullOrEmpty( arg ) )
        break;

      if ( IsNumber( arg ) )
        {
          if (ch->TopLevel >= LEVEL_IMMORTAL)
            {
              switch ( ++nNumber )
                {
                case 1: iLevelLower = atoi( arg ); break;
                case 2: iLevelUpper = atoi( arg ); break;
                default:
                  SendToCharacter( "Only two level numbers allowed.\r\n", ch );
                  return;
                }
            }
          else
            {
              SendToCharacter( "This can only be used by immortals.\r\n", ch );
              return;
            }
        }
      else
        {
          /* activate/deactivate whoCloak Darrik Vequir */
          if ( !StrCmp( arg, "on" ) && ch->PCData )
            {
              if (!ch->PCData->whoCloak)
                {
                  SendToCharacter( "Who Cloaking is on.\r\n", ch );
                  ch->PCData->whoCloak = true;
                  return;
                }
              else
                {
                  SendToCharacter( "Who Cloaking is already on.\r\n", ch);
                  return;
		}
            }
          if ( !StrCmp( arg, "off" ) && ch->PCData )
            {
              if (ch->PCData->whoCloak)
                { SendToCharacter( "Who Cloaking is off.\r\n", ch );
                  ch->PCData->whoCloak = false;
                  return;
                }
              else
                {
                  SendToCharacter( "Who Cloaking is already off.\r\n", ch);
                  return;
                }
            }

          if ( strlen(arg) < 3 )
            {
              SendToCharacter( "Be a little more specific please.\r\n", ch );
              return;
            }

          /*
           * Look for classes to turn on.
           */

          if ( !StrCmp( arg, "imm" ) || !StrCmp( arg, "gods" ) )
            fImmortalOnly = true;
          else
            {
              if ( !StrCmp( arg, "www" ) )
                fShowHomepage = true;
              else               /* SB who clan (order), guild */
                {
                  if (!StrCmp( arg, "clan" ) && IsClanned( ch ) )
                    strcpy(arg, ch->PCData->ClanInfo.Clan->Name);

                  if ( (pClan = GetClan (arg)) && (fClanMatch != true))
                    {
                      if ((ch->TopLevel >= LEVEL_IMMORTAL)
			  || (IsClanned( ch )
			      && !StrCmp(ch->PCData->ClanInfo.Clan->Name, pClan->Name)))
                        {
                          fClanMatch = true;
                        }
                      else
                        {
			  SendToCharacter("&ROnly immortal's can do that to another clan!&w\r\n", ch);
                          return;
                        }
                    }
                  else
                    {
                      for ( iRace = 0; iRace < MAX_RACE; iRace++ )
                        {
                          if ( IsGreater(ch) && (!StrCmp( arg, RaceTable[iRace].race_name ) ) )
                            {
                              rgfRace[iRace] = true;
                              break;
                            }
                        }
                      if ( iRace != MAX_RACE )
                        fRaceRestrict = true;
                      if ( iRace == MAX_RACE && fClanMatch == false )
                        {
                          SendToCharacter( "Only immortals can do that.\r\n", ch );
                          return;
                        }
                    }
                }
            }
        }
    }
  /*
   * Now find matching chars.
   */
  nMatch = 0;

  if ( ch && !NullCh)
    SetPagerColor( AT_GREEN, ch );
  else
    {
      if ( fShowHomepage )
        whoout = fopen( WEBWHO_FILE, "w" );
      else
        whoout = fopen( WHO_FILE, "w" );
    }

  /* start from last to first to get it in the proper order */
  for ( d = last_descriptor; d; d = d->prev )
    {
      Character *wch;
      char const *race;
      char force_char = ' ';

      if ( (d->connection_state != CON_PLAYING && d->connection_state != CON_EDITING)
           || ( !CanSeeCharacter( ch, d->character ) && IsImmortal( d->character ) )
           || d->original)
        continue;
      wch   = d->original ? d->original : d->character;
      if ( wch->TopLevel < iLevelLower
           ||   wch->TopLevel > iLevelUpper
           || ( fImmortalOnly  && wch->TopLevel < LEVEL_IMMORTAL )
           || ( fRaceRestrict && !rgfRace[wch->Race] )
           || ( fClanMatch && ( pClan != wch->PCData->ClanInfo.Clan ))  /* SB */ )
        continue;
      nMatch++;
      /* added optional invisibility on the who list to players who want it.
         Darrik Vequir */

      if ( (wch->PCData->whoCloak == true) && (ch->TopLevel < LEVEL_GREATER))
        continue;

      if ( fShowHomepage
           && !IsNullOrEmpty( wch->PCData->homepage ) )
        sprintf( char_name, "<A HREF=\"%s\">%s</A>",
                 ShowTilde( wch->PCData->homepage ), wch->Name );
      else
        strcpy( char_name, "") ;

      if ( IsGreater(ch) )
        sprintf( race_text, "(%s) ", RaceTable[wch->Race].race_name);
      else
        strcpy( race_text, "" );

      race = race_text;

      if (wch->Stats.PermFrc > 0 && (ch->TopLevel >= LEVEL_GREATER) && !IsImmortal(wch))
        {
          if(IsJedi( wch ))
            force_char = '*';
          else
            force_char = '+';
        }

      switch ( wch->TopLevel )
	{
        default: break;
        case 200: race = "The Ghost in the Machine";    break;
        case MAX_LEVEL -  0: race = "Implementor";      break;
        case MAX_LEVEL -  1: race = "Head Administrator";       break;
        case MAX_LEVEL -  2: race = "Administrator";    break;
        case MAX_LEVEL -  3: race = "Builder";  break;
        case MAX_LEVEL -  4: race = "Builder";  break;
        }

      if ( !NiftyIsName(wch->Name, wch->PCData->title) && ch->TopLevel > wch->TopLevel )
        sprintf( extra_title , " [%s]" , wch->Name );
      else
        strcpy(extra_title, "");

      if ( IsRetiredImmortal( wch ) )
        race = "Retired";
      else if ( !IsNullOrEmpty( wch->PCData->rank ) )
        race = wch->PCData->rank;

      if ( IsClanned( wch )
	   && ( (IsClanned( ch )
		 && ch->PCData->ClanInfo.Clan == wch->PCData->ClanInfo.Clan )
		|| IsGreater( ch ) ) )
        {
          Clan *pclan = wch->PCData->ClanInfo.Clan;

          strcpy( clan_name, " (" );

          if ( !StrCmp( wch->Name, pclan->Leadership.Leader ) )
            strcat( clan_name, "Leader, " );
          if ( !StrCmp( wch->Name, pclan->Leadership.Number1 ) )
            strcat( clan_name, "First, " );
          if ( !StrCmp( wch->Name, pclan->Leadership.Number2 ) )
            strcat( clan_name, "Second, " );

          strcat( clan_name, pclan->Name );
          strcat( clan_name, ")" );
        }
      else
        clan_name[0] = '\0';


      if ( IsBitSet(wch->Flags, PLR_WIZINVIS) )
	sprintf( invis_str, "(%d) ", wch->PCData->wizinvis );
      else
        invis_str[0] = '\0';

      sprintf( buf, "%c%s %s%s%s%s %s%s%s%s\r\n",
               force_char,
               race,
               invis_str,
               IsBitSet(wch->Flags, PLR_AFK) ? "[AFK] " : "",
               char_name,
               wch->PCData->title,
               extra_title, wch->PCData->whoCloak ? "<WC>" : "",
               clan_name,
               IsBitSet(wch->Flags, PLR_KILLER) && (ch->TopLevel >= LEVEL_IMMORTAL) ? "&R [Wanted for Murder]&W" : "&W" );


      /*
       * This is where the old code would display the found player to the ch.
       * What we do instead is put the found data into a linked list
       */

      /* First make the structure. */
      AllocateMemory( cur_who, WhoData, 1 );
      cur_who->text = CopyString( buf );
      if ( IsImmortal( wch ) )
        cur_who->type = WT_IMM;
      else if ( GetTrustLevel( wch ) <= 5 )
        cur_who->type = WT_NEWBIE;
      else
        cur_who->type = WT_MORTAL;

      /* Then put it into the appropriate list. */
      switch ( cur_who->type )
        {
        case WT_MORTAL:
          cur_who->next = first_mortal;
          first_mortal = cur_who;
          break;
        case WT_IMM:
          cur_who->next = first_imm;
          first_imm = cur_who;
          break;
        case WT_NEWBIE:
          cur_who->next = first_newbie;
          first_newbie = cur_who;
	  break;

        }
    }


  /* Ok, now we have three separate linked lists and what remains is to
   * display the information and clean up.
   */

  /* Deadly list removed for swr ... now only 2 lists */

  if ( first_newbie )
    {
      if ( NullCh )
        fprintf( whoout,"\r\n----------------------------------[ New Citizens ]----------------------------\r\n\r\n" );
      else
        SendToPager( "\r\n&G----------------------------------[ New Citizens ]----------------------------&W\r\n\r\n", ch );
    }

  for ( cur_who = first_newbie; cur_who; cur_who = next_who )
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who->text );
      else
        SendToPager( cur_who->text, ch );
      next_who = cur_who->next;
      FreeMemory( cur_who->text );
      FreeMemory( cur_who );
    }


  if ( first_mortal )
    {
      if ( NullCh )
        fprintf( whoout,"\r\n--------------------------------[ Galactic Citizens ]-------------------------\r\n\r\n" );
      else
        SendToPager( "\r\n&G--------------------------------[ Galactic Citizens ]-------------------------&W\r\n\r\n", ch );
    }

  for ( cur_who = first_mortal; cur_who; cur_who = next_who )
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who->text );
      else
        SendToPager( cur_who->text, ch );
      next_who = cur_who->next;
      FreeMemory( cur_who->text );
      FreeMemory( cur_who );
    }

  if ( first_imm )
    {
      if ( NullCh )
        fprintf( whoout, "\r\n-------------------------------[ Omnipresent Beings ]-------------------------\r\n\r\n" );
      else
        SendToPager(  "\r\n&G-------------------------------[ Omnipresent Beings ]--------------------------&W\r\n\r\n", ch );
    }

  for ( cur_who = first_imm; cur_who; cur_who = next_who )
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who->text );
      else
        SendToPager( cur_who->text, ch );
      next_who = cur_who->next;
      FreeMemory( cur_who->text );
      FreeMemory( cur_who );
    }

  if ( NullCh )
    {
      fprintf( whoout, "%d player%s.\r\n", nMatch, nMatch == 1 ? "" : "s" );
      fclose( whoout );
      return;
    }

  SetCharacterColor( AT_YELLOW, ch );
  Echo( ch, "%d player%s.\r\n", nMatch, nMatch == 1 ? "" : "s" );
}
