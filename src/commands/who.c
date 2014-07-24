#include <string.h>
#include "mud.h"
#include "character.h"

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
  char buf[MAX_STRING_LENGTH];
  char clan_name[MAX_INPUT_LENGTH];
  char invis_str[MAX_INPUT_LENGTH];
  char char_name[MAX_INPUT_LENGTH];
  char extra_title[MAX_STRING_LENGTH];
  char race_text[MAX_INPUT_LENGTH];
  DESCRIPTOR_DATA *d;
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
  bool NullCh = FALSE;
  CLAN_DATA *pClan;
  FILE *whoout;
  PC_DATA *pcdata;
  WHO_DATA *cur_who = NULL;
  WHO_DATA *next_who = NULL;
  WHO_DATA *first_mortal = NULL;
  WHO_DATA *first_newbie = NULL;
  WHO_DATA *first_imm = NULL;

  /*
   * Set default arguments.
   */

  iLevelLower    = 0;
  iLevelUpper    = MAX_LEVEL;

  fRaceRestrict  = FALSE;
  fImmortalOnly  = FALSE;
  fShowHomepage  = FALSE;
  fClanMatch = FALSE;

  for ( iRace = 0; iRace < MAX_RACE; iRace++ )
    rgfRace[iRace] = FALSE;

  if ( !ch )
    {
      NullCh = TRUE;
      CREATE( ch, Character, 1 );
      ch->top_level = 1;
      ch->trust = 0;
      CREATE( pcdata, PC_DATA, 1 );
      ch->pcdata = pcdata;
      ch->in_room = get_room_index( ROOM_VNUM_LIMBO );
    }

  /*
   * Parse arguments.
   */
  nNumber = 0;

  for ( ;; )
    {
      char arg[MAX_STRING_LENGTH];
      argument = one_argument( argument, arg );
      if ( arg[0] == '\0' )
        break;

      if ( is_number( arg ) )
        {
          if (ch->top_level >= LEVEL_IMMORTAL)
            {
              switch ( ++nNumber )
                {
                case 1: iLevelLower = atoi( arg ); break;
                case 2: iLevelUpper = atoi( arg ); break;
                default:
                  send_to_char( "Only two level numbers allowed.\r\n", ch );
                  return;
                }
            }
          else
            {
              send_to_char( "This can only be used by immortals.\r\n", ch );
              return;
            }
        }
      else
        {
          /* activate/deactivate whoCloak Darrik Vequir */
          if ( !str_cmp( arg, "on" ) && ch->pcdata )
            {
              if (!ch->pcdata->whoCloak)
                {
                  send_to_char( "Who Cloaking is on.\r\n", ch );
                  ch->pcdata->whoCloak = TRUE;
                  return;
                }
              else
                {
                  send_to_char( "Who Cloaking is already on.\r\n", ch);
                  return;
		}
            }
          if ( !str_cmp( arg, "off" ) && ch->pcdata )
            {
              if (ch->pcdata->whoCloak)
                { send_to_char( "Who Cloaking is off.\r\n", ch );
                  ch->pcdata->whoCloak = FALSE;
                  return;
                }
              else
                {
                  send_to_char( "Who Cloaking is already off.\r\n", ch);
                  return;
                }
            }

          if ( strlen(arg) < 3 )
            {
              send_to_char( "Be a little more specific please.\r\n", ch );
              return;
            }

          /*
           * Look for classes to turn on.
           */

          if ( !str_cmp( arg, "imm" ) || !str_cmp( arg, "gods" ) )
            fImmortalOnly = TRUE;
          else
            {
              if ( !str_cmp( arg, "www" ) )
                fShowHomepage = TRUE;
              else               /* SB who clan (order), guild */
                {
                  if (!str_cmp( arg, "clan" ) && ch->pcdata && ch->pcdata->clan)
                    strcpy(arg, ch->pcdata->clan->name);
                  if ( (pClan = get_clan (arg)) && (fClanMatch != TRUE))
                    {
                      if ((ch->top_level >= LEVEL_IMMORTAL)
			  || (ch->pcdata && ch->pcdata->clan
			      && !str_cmp(ch->pcdata->clan->name,pClan->name)))
                        {
                          fClanMatch = TRUE;
                        }
                      else
                        {
			  send_to_char("&ROnly immortal's can do that to another clan!&w\r\n", ch);
                          return;
                        }
                    }
                  else
                    {
                      for ( iRace = 0; iRace < MAX_RACE; iRace++ )
                        {
                          if ( is_god(ch) && (!str_cmp( arg, race_table[iRace].race_name ) ) )
                            {
                              rgfRace[iRace] = TRUE;
                              break;
                            }
                        }
                      if ( iRace != MAX_RACE )
                        fRaceRestrict = TRUE;
                      if ( iRace == MAX_RACE && fClanMatch == FALSE )
                        {
                          send_to_char( "Only immortals can do that.\r\n", ch );
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
  buf[0] = '\0';
  if ( ch && !NullCh)
    set_pager_color( AT_GREEN, ch );
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
           || ( !can_see( ch, d->character ) && is_immortal( d->character ) )
           || d->original)
        continue;
      wch   = d->original ? d->original : d->character;
      if ( wch->top_level < iLevelLower
           ||   wch->top_level > iLevelUpper
           || ( fImmortalOnly  && wch->top_level < LEVEL_IMMORTAL )
           || ( fRaceRestrict && !rgfRace[wch->race] )
           || ( fClanMatch && ( pClan != wch->pcdata->clan ))  /* SB */ )
        continue;
      nMatch++;
      /* added optional invisibility on the who list to players who want it.
         Darrik Vequir */

      if ( (wch->pcdata->whoCloak == TRUE) && (ch->top_level < LEVEL_GOD))
        continue;

      if ( fShowHomepage
           &&   wch->pcdata->homepage
           &&   wch->pcdata->homepage[0] != '\0' )
        sprintf( char_name, "<A HREF=\"%s\">%s</A>",
                 show_tilde( wch->pcdata->homepage ), wch->name );
      else
        strcpy( char_name, "") ;

      if ( is_god(ch) )
        sprintf( race_text, "(%s) ", race_table[wch->race].race_name);
      else
        strcpy( race_text, "" );

      race = race_text;

      if (wch->stats.perm_frc > 0 && (ch->top_level >= LEVEL_GOD) && !is_immortal(wch))
        {
          if(is_jedi( wch ))
            force_char = '*';
          else
            force_char = '+';
        }

      switch ( wch->top_level )
	{
        default: break;
        case 200: race = "The Ghost in the Machine";    break;
        case MAX_LEVEL -  0: race = "Implementor";      break;
        case MAX_LEVEL -  1: race = "Head Administrator";       break;
        case MAX_LEVEL -  2: race = "Administrator";    break;
        case MAX_LEVEL -  3: race = "Builder";  break;
        case MAX_LEVEL -  4: race = "Builder";  break;
        }

      if ( !nifty_is_name(wch->name, wch->pcdata->title) && ch->top_level > wch->top_level )
        sprintf( extra_title , " [%s]" , wch->name );
      else
        strcpy(extra_title, "");

      if ( is_retired_immortal( wch ) )
        race = "Retired";
      else if ( wch->pcdata->rank && wch->pcdata->rank[0] != '\0' )
        race = wch->pcdata->rank;

      if ( wch->pcdata->clan && ( (!is_npc(ch) &&  ch->pcdata->clan
                                   && ch->pcdata->clan == wch->pcdata->clan )
                                  || is_god( ch ) ) )
        {
          CLAN_DATA *pclan = wch->pcdata->clan;

          strcpy( clan_name, " (" );

          if ( !str_cmp( wch->name, pclan->leadership.leader ) )
            strcat( clan_name, "Leader, " );
          if ( !str_cmp( wch->name, pclan->leadership.number1 ) )
            strcat( clan_name, "First, " );
          if ( !str_cmp( wch->name, pclan->leadership.number2 ) )
            strcat( clan_name, "Second, " );

          strcat( clan_name, pclan->name );
          strcat( clan_name, ")" );
        }
      else
        clan_name[0] = '\0';


      if ( IS_SET(wch->act, PLR_WIZINVIS) )
	sprintf( invis_str, "(%d) ", wch->pcdata->wizinvis );
      else
        invis_str[0] = '\0';

      sprintf( buf, "%c%s %s%s%s%s %s%s%s%s\r\n",
               force_char,
               race,
               invis_str,
               IS_SET(wch->act, PLR_AFK) ? "[AFK] " : "",
               char_name,
               wch->pcdata->title,
               extra_title, wch->pcdata->whoCloak ? "<WC>" : "",
               clan_name,
               IS_SET(wch->act, PLR_KILLER) && (ch->top_level >= LEVEL_IMMORTAL) ? "&R [Wanted for Murder]&W" : "&W" );


      /*
       * This is where the old code would display the found player to the ch.
       * What we do instead is put the found data into a linked list
       */

      /* First make the structure. */
      CREATE( cur_who, WHO_DATA, 1 );
      cur_who->text = str_dup( buf );
      if ( is_immortal( wch ) )
        cur_who->type = WT_IMM;
      else if ( get_trust( wch ) <= 5 )
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
        send_to_pager( "\r\n&G----------------------------------[ New Citizens ]----------------------------&W\r\n\r\n", ch );
    }

  for ( cur_who = first_newbie; cur_who; cur_who = next_who )
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who->text );
      else
        send_to_pager( cur_who->text, ch );
      next_who = cur_who->next;
      DISPOSE( cur_who->text );
      DISPOSE( cur_who );
    }


  if ( first_mortal )
    {
      if ( NullCh )
        fprintf( whoout,"\r\n--------------------------------[ Galactic Citizens ]-------------------------\r\n\r\n" );
      else
        send_to_pager( "\r\n&G--------------------------------[ Galactic Citizens ]-------------------------&W\r\n\r\n", ch );
    }

  for ( cur_who = first_mortal; cur_who; cur_who = next_who )
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who->text );
      else
        send_to_pager( cur_who->text, ch );
      next_who = cur_who->next;
      DISPOSE( cur_who->text );
      DISPOSE( cur_who );
    }

  if ( first_imm )
    {
      if ( NullCh )
        fprintf( whoout, "\r\n-------------------------------[ Omnipresent Beings ]-------------------------\r\n\r\n" );
      else
        send_to_pager(  "\r\n&G-------------------------------[ Omnipresent Beings ]--------------------------&W\r\n\r\n", ch );
    }

  for ( cur_who = first_imm; cur_who; cur_who = next_who )
    {
      if ( NullCh )
        fprintf( whoout, "%s", cur_who->text );
      else
        send_to_pager( cur_who->text, ch );
      next_who = cur_who->next;
      DISPOSE( cur_who->text );
      DISPOSE( cur_who );
    }

  if ( NullCh )
    {
      fprintf( whoout, "%d player%s.\r\n", nMatch, nMatch == 1 ? "" : "s" );
      fclose( whoout );
      return;
    }

  set_char_color( AT_YELLOW, ch );
  ch_printf( ch, "%d player%s.\r\n", nMatch, nMatch == 1 ? "" : "s" );
}
