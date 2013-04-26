/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                           Special clan module                            *
 ****************************************************************************/

#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"

#define MAX_NEST        100
static  OBJ_DATA *      rgObjNest       [MAX_NEST];

CLAN_DATA * first_clan = NULL;
CLAN_DATA * last_clan = NULL;

MEMBER_LIST * first_member_list = NULL;
MEMBER_LIST * last_member_list = NULL;


/* local routines */
void fread_clan( CLAN_DATA *clan, FILE *fp );
bool load_clan_file( const char *clanfile );
void write_clan_list( void );
void save_member_list( MEMBER_LIST *members_list );
void show_members( CHAR_DATA *ch, char *argument, char *format );

/*
 * Get pointer to clan structure from clan name.
 */
CLAN_DATA *get_clan( char *name )
{
  CLAN_DATA *clan;

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( !str_cmp( name, clan->name ) )
	{
	  return clan;
	}
    }

  return NULL;
}

void write_clan_list( )
{
  CLAN_DATA *tclan;
  FILE *fpout;
  char filename[256];

  sprintf( filename, "%s%s", CLAN_DIR, CLAN_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      bug( "FATAL: cannot open clan.lst for writing!\r\n", 0 );
      return;
    }

  for ( tclan = first_clan; tclan; tclan = tclan->next )
    {
      fprintf( fpout, "%s\n", tclan->filename );
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

/*
 * Save a clan's data to its data file
 */
void save_clan( CLAN_DATA *clan )
{
  FILE *fp;
  char filename[256];
  char buf[MAX_STRING_LENGTH];

  if ( !clan )
    {
      bug( "save_clan: null clan pointer!", 0 );
      return;
    }

  if ( !clan->filename || clan->filename[0] == '\0' )
    {
      sprintf( buf, "save_clan: %s has no filename", clan->name );
      bug( buf, 0 );
      return;
    }

  sprintf( filename, "%s%s", CLAN_DIR, clan->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "save_clan: fopen", 0 );
      perror( filename );
    }
  else
    {
      fprintf( fp, "#CLAN\n" );
      fprintf( fp, "Name         %s~\n", clan->name              );
      fprintf( fp, "Filename     %s~\n", clan->filename          );
      fprintf( fp, "Description  %s~\n", clan->description       );
      fprintf( fp, "Leader       %s~\n", clan->leader            );
      fprintf( fp, "NumberOne    %s~\n", clan->number1           );
      fprintf( fp, "NumberTwo    %s~\n", clan->number2           );
      fprintf( fp, "PKills       %d\n",  clan->pkills            );
      fprintf( fp, "PDeaths      %d\n",  clan->pdeaths           );
      fprintf( fp, "MKills       %d\n",  clan->mkills            );
      fprintf( fp, "MDeaths      %d\n",  clan->mdeaths           );
      fprintf( fp, "Type         %d\n",  clan->clan_type         );
      fprintf( fp, "Members      %d\n",  clan->members           );
      fprintf( fp, "Board        %d\n",  clan->board             );
      fprintf( fp, "Storeroom    %d\n",  clan->storeroom         );
      fprintf( fp, "GuardOne     %d\n",  clan->guard1            );
      fprintf( fp, "GuardTwo     %d\n",  clan->guard2            );
      fprintf( fp, "PatrolOne    %d\n",  clan->patrol1           );
      fprintf( fp, "PatrolTwo    %d\n",  clan->patrol2           );
      fprintf( fp, "TrooperOne   %d\n",  clan->trooper1          );
      fprintf( fp, "TrooperTwo   %d\n",  clan->trooper2          );
      fprintf( fp, "Funds        %ld\n", clan->funds             );
      fprintf( fp, "Enlist1      %d\n",  clan->enlistroom1       );
      fprintf( fp, "Enlist2      %d\n",  clan->enlistroom2       );
      fprintf( fp, "Jail         %d\n",  clan->jail              );

      if ( clan->mainclan )
	{
	  fprintf( fp, "MainClan     %s~\n",      clan->mainclan->name    );
	}

      fprintf( fp, "End\n\n" );
      fprintf( fp, "#END\n" );
    }

  fclose( fp );
}

/*
 * Read in actual clan data.
 */
void fread_clan( CLAN_DATA *clan, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : fread_word( fp );
      bool fMatch = FALSE;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = TRUE;
          fread_to_eol( fp );
          break;

        case 'B':
          KEY( "Board", clan->board, fread_number( fp ) );
          break;

        case 'D':
          KEY( "Description", clan->description, fread_string( fp ) );
          break;

        case 'E':
          KEY( "Enlist1", clan->enlistroom1, fread_number( fp ) );
          KEY( "Enlist2", clan->enlistroom2, fread_number( fp ) );

          if ( !str_cmp( word, "End" ) )
            {
              if (!clan->name)
		{
		  clan->name = STRALLOC( "" );
		}

              if (!clan->leader)
		{
		  clan->leader = STRALLOC( "" );
		}

              if (!clan->description)
		{
		  clan->description = STRALLOC( "" );
		}

              if (!clan->number1)
		{
		  clan->number1 = STRALLOC( "" );
		}


              if (!clan->number2)
		{
		  clan->number2 = STRALLOC( "" );
		}

              if (!clan->tmpstr)
		{
		  clan->tmpstr = STRALLOC( "" );
		}

              return;
            }
          break;

        case 'F':
          KEY( "Funds",    clan->funds,    fread_number( fp ) );
          KEY( "Filename", clan->filename, fread_string_nohash( fp ) );
          break;

        case 'G':
          KEY( "GuardOne", clan->guard1, fread_number( fp ) );
          KEY( "GuardTwo", clan->guard2, fread_number( fp ) );
          break;

        case 'J':
          KEY( "Jail", clan->jail, fread_number( fp ) );
          break;

        case 'L':
          KEY( "Leader", clan->leader, fread_string( fp ) );
          break;

        case 'M':
          KEY( "MDeaths",  clan->mdeaths, fread_number( fp ) );
          KEY( "Members",  clan->members, fread_number( fp ) );
          KEY( "MKills",   clan->mkills,  fread_number( fp ) );
          KEY( "MainClan", clan->tmpstr,  fread_string( fp ) );
          break;

        case 'N':
          KEY( "Name",      clan->name,    fread_string( fp ) );
          KEY( "NumberOne", clan->number1, fread_string( fp ) );
          KEY( "NumberTwo", clan->number2, fread_string( fp ) );
          break;

        case 'P':
          KEY( "PDeaths",   clan->pdeaths, fread_number( fp ) );
          KEY( "PKills",    clan->pkills,  fread_number( fp ) );
          KEY( "PatrolOne", clan->patrol1, fread_number( fp ) );
          KEY( "PatrolTwo", clan->patrol2, fread_number( fp ) );
          break;

        case 'S':
          KEY( "Storeroom", clan->storeroom, fread_number( fp ) );
          break;

        case 'T':
          KEY( "Type", clan->clan_type, fread_number( fp ) );
          KEY( "TrooperOne", clan->trooper1, fread_number( fp ) );
          KEY( "TrooperTwo", clan->trooper2, fread_number( fp ) );
          break;
        }

      if ( !fMatch )
        {
          bug( "Fread_clan: no match: %s", word );
        }
    }
}

/*
 * Load a clan file
 */

bool load_clan_file( const char *clanfile )
{
  char filename[256];
  CLAN_DATA *clan;
  FILE *fp;
  bool found = FALSE;

  CREATE( clan, CLAN_DATA, 1 );
  clan->next_subclan = NULL;
  clan->prev_subclan = NULL;
  clan->last_subclan = NULL;
  clan->first_subclan = NULL;
  clan->mainclan     = NULL;

  sprintf( filename, "%s%s", CLAN_DIR, clanfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {

      found = TRUE;

      for ( ; ; )
        {
	  const char *word;
          char letter = fread_letter( fp );

          if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "Load_clan_file: # not found." );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "CLAN"   ) )
            {
              fread_clan( clan, fp );
              break;
            }
          else if ( !str_cmp( word, "END"  ) )
	    {
              break;
	    }
	  else
	    {
	      bug( "Load_clan_file: bad section: %s.", word );
	      break;
	    }
        }

      fclose( fp );
    }

  if ( found )
    {
      ROOM_INDEX_DATA *storeroom = NULL;

      LINK( clan, first_clan, last_clan, next, prev );

      if( !load_member_list( clan->filename ) )
        {
          MEMBER_LIST *members_list = NULL;

          log_string( "No memberlist found, creating new list" );
          CREATE( members_list, MEMBER_LIST, 1 );
          members_list->name = STRALLOC( clan->name );
          LINK( members_list, first_member_list, last_member_list, next, prev );
          save_member_list( members_list );
        }

      if ( clan->storeroom == 0
           || (storeroom = get_room_index( clan->storeroom )) == NULL )
        {
          log_string( "Storeroom not found" );
          return found;
        }

      sprintf( filename, "%s%s.vault", CLAN_DIR, clan->filename );

      if ( ( fp = fopen( filename, "r" ) ) != NULL )
        {
          int iNest = 0;
          OBJ_DATA *tobj = NULL, *tobj_next = NULL;

          log_string( "Loading clan storage room" );
          rset_supermob(storeroom);

          for ( iNest = 0; iNest < MAX_NEST; iNest++ )
	    {
	      rgObjNest[iNest] = NULL;
	    }

          found = TRUE;

          for ( ; ; )
            {
	      const char *word = NULL;
              char letter = fread_letter( fp );

              if ( letter == '*' )
                {
                  fread_to_eol( fp );
                  continue;
                }

              if ( letter != '#' )
                {
                  bug( "Load_clan_vault: # not found.", 0 );
                  bug( clan->name, 0 );
                  break;
                }

              word = fread_word( fp );

              if ( !str_cmp( word, "OBJECT" ) )
		{
		  fread_obj  ( supermob, fp, OS_CARRY );
		}
              else if ( !str_cmp( word, "END"    ) )
		{
                  break;
		}
	      else
		{
		  bug( "Load_clan_vault: bad section." );
		  bug( clan->name );
		  break;
		}
            }

          fclose( fp );

          for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
            {
              tobj_next = tobj->next_content;
              obj_from_char( tobj );
              obj_to_room( tobj, storeroom );
            }

          release_supermob();
        }
      else
	{
	  log_string( "Cannot open clan vault" );
	}
    }
  else
    {
      DISPOSE( clan );
    }

  return found;
}

/*
 * Load in all the clan files.
 */
void load_clans( )
{
  FILE *fpList = NULL;
  char clanlist[256];
  CLAN_DATA *clan = NULL;

  log_string( "Loading clans..." );
  sprintf( clanlist, "%s%s", CLAN_DIR, CLAN_LIST );

  if ( ( fpList = fopen( clanlist, "r" ) ) == NULL )
    {
      perror( clanlist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : fread_word( fpList );
      log_string( filename );

      if ( filename[0] == '$' )
	{
	  break;
	}

      if ( !load_clan_file( filename ) )
        {
          bug( "Cannot load clan file: %s", filename );
        }
    }

  fclose( fpList );
  log_string( " Done clans\r\nSorting clans...." );

  for ( clan=first_clan; clan; clan = clan->next )
    {
      CLAN_DATA *bosclan = NULL;

      if ( !clan->tmpstr || clan->tmpstr[0] == '\0' )
        continue;

      bosclan = get_clan ( clan->tmpstr );

      if ( !bosclan )
        continue;

      LINK( clan , bosclan->first_subclan , bosclan->last_subclan , next_subclan, prev_subclan );
      clan->mainclan = bosclan;
    }

  log_string(" Done sorting" );
}

void do_induct( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  CLAN_DATA *clan;

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        && is_name("induct", ch->pcdata->bestowments))
       || !str_cmp( ch->name, clan->leader  )
       || !str_cmp( ch->name, clan->number1 )
       || !str_cmp( ch->name, clan->number2 ) )
    {
      ;
    }
  else
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Induct whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPCs.\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan )
    {
      if ( victim->pcdata->clan->clan_type == CLAN_CRIME )
        {
          if ( victim->pcdata->clan == clan )
	    {
	      send_to_char( "This player already belongs to your crime family!\r\n", ch );
	    }
          else
	    {
	      send_to_char( "This player already belongs to an organization!\r\n", ch );
	    }

          return;
        }
      else if ( victim->pcdata->clan->clan_type == CLAN_GUILD )
        {
          if ( victim->pcdata->clan == clan )
	    {
	      send_to_char( "This player already belongs to your guild!\r\n", ch );
	    }
          else
	    {
	      send_to_char( "This player already belongs to an organization!\r\n", ch );
	    }

          return;
        }
      else
        {
          if ( victim->pcdata->clan == clan )
	    {
	      send_to_char( "This player already belongs to your organization!\r\n", ch );
	    }
          else
	    {
	      send_to_char( "This player already belongs to an organization!\r\n", ch );
	    }

          return;
        }
    }

  clan->members++;

  victim->pcdata->clan = clan;
  STRFREE(victim->pcdata->clan_name);
  victim->pcdata->clan_name = QUICKLINK( clan->name );
  update_member( victim );
  act( AT_MAGIC, "You induct $N into $t", ch, clan->name, victim, TO_CHAR );
  act( AT_MAGIC, "$n inducts $N into $t", ch, clan->name, victim, TO_NOTVICT );
  act( AT_MAGIC, "$n inducts you into $t", ch, clan->name, victim, TO_VICT );
  save_char_obj( victim );
}

void do_outcast( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  CLAN_DATA *clan;

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        && is_name("outcast", ch->pcdata->bestowments))
       || !str_cmp( ch->name, clan->leader  )
       || !str_cmp( ch->name, clan->number1 )
       || !str_cmp( ch->name, clan->number2 ) )
    {
      ;
    }
  else
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Outcast whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Kick yourself out of your own clan?\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan != ch->pcdata->clan )
    {
      send_to_char( "This player does not belong to your clan!\r\n", ch );
      return;
    }


  if ( victim->speaking & LANG_CLAN )
    {
      victim->speaking = LANG_COMMON;
    }

  REMOVE_BIT( victim->speaks, LANG_CLAN );
  --clan->members;

  if ( !str_cmp( victim->name, ch->pcdata->clan->number1 ) )
    {
      STRFREE( ch->pcdata->clan->number1 );
      ch->pcdata->clan->number1 = STRALLOC( "" );
    }

  if ( !str_cmp( victim->name, ch->pcdata->clan->number2 ) )
    {
      STRFREE( ch->pcdata->clan->number2 );
      ch->pcdata->clan->number2 = STRALLOC( "" );
    }

  victim->pcdata->clan = NULL;
  remove_member( victim );
  STRFREE(victim->pcdata->clan_name);
  victim->pcdata->clan_name = STRALLOC( "" );
  act( AT_MAGIC, "You outcast $N from $t", ch, clan->name, victim, TO_CHAR );
  act( AT_MAGIC, "$n outcasts $N from $t", ch, clan->name, victim, TO_ROOM );
  act( AT_MAGIC, "$n outcasts you from $t", ch, clan->name, victim, TO_VICT );

  DISPOSE( victim->pcdata->bestowments );
  victim->pcdata->bestowments = str_dup("");

  save_char_obj( victim );      /* clan gets saved when pfile is saved */
}

void do_setclan( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CLAN_DATA *clan;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Usage: setclan <clan> <field> <leader|number1|number2> <player>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( " leader number1 number2 subclan enlist1\r\n", ch );
      send_to_char( " enlist2 members board recall storage\r\n", ch );
      send_to_char( " funds trooper1 trooper2 jail", ch );
      send_to_char( " guard1 guard2 patrol1 patrol2\r\n", ch );

      if ( get_trust( ch ) >= LEVEL_SUB_IMPLEM )
        {
          send_to_char( " name filename desc\r\n", ch );
        }

      return;
    }

  clan = get_clan( arg1 );

  if ( !clan )
    {
      send_to_char( "No such clan.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "enlistroom1" ) )
    {
      clan->enlistroom1 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "enlistroom2" ) )
    {
      clan->enlistroom2 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "leader" ) )
    {
      STRFREE( clan->leader );
      clan->leader = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "subclan" ) )
    {
      CLAN_DATA *subclan = get_clan( argument );

      if ( !subclan )
        {
          send_to_char( "Subclan is not a clan.\r\n", ch );
          return;
        }

      if ( subclan->clan_type == CLAN_SUBCLAN || subclan->mainclan )
        {
          send_to_char( "Subclan is already part of another organization.\r\n", ch );
          return;
        }

      if ( subclan->first_subclan )
        {
          send_to_char( "Subclan has subclans of its own that need removing first.\r\n", ch );
          return;
        }

      subclan->clan_type = CLAN_SUBCLAN;
      subclan->mainclan = clan;
      LINK(subclan, clan->first_subclan, clan->last_subclan, next_subclan, prev_subclan );
      save_clan( clan );
      save_clan( subclan );
      return;
    }

  if ( !str_cmp( arg2, "number1" ) )
    {
      STRFREE( clan->number1 );
      clan->number1 = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "number2" ) )
    {
      STRFREE( clan->number2 );
      clan->number2 = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "board" ) )
    {
      clan->board = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "members" ) )
    {
      clan->members = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "funds" ) )
    {
      clan->funds = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "storage" ) )
    {
      clan->storeroom = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "guard1" ) )
    {
      clan->guard1 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "jail" ) )
    {
      clan->jail = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "guard2" ) )
    {
      clan->guard2 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "trooper1" ) )
    {
      clan->trooper1 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "trooper2" ) )
    {
      clan->trooper2 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }
  if ( !str_cmp( arg2, "patrol1" ) )
    {
      clan->patrol1 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "patrol2" ) )
    {
      clan->patrol2 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( get_trust( ch ) < LEVEL_SUB_IMPLEM )
    {
      do_setclan( ch, "" );
      return;
    }

  if ( !str_cmp( arg2, "type" ) )
    {
      if ( clan->mainclan )
        {
          UNLINK ( clan, clan->mainclan->first_subclan, clan->mainclan->last_subclan,
		   next_subclan, prev_subclan );
          clan->mainclan = NULL;
        }

      if ( !str_cmp( argument, "crime" ) || !str_cmp( argument, "crime family" ) )
	{
          clan->clan_type = CLAN_CRIME;
	}
      else if ( !str_cmp( argument, "guild" ) )
	{
	  clan->clan_type = CLAN_GUILD;
	}
      else
	{
	  clan->clan_type = 0;
	}

      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      STRFREE( clan->name );
      clan->name = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !str_cmp( arg2, "filename" ) )
    {
      DISPOSE( clan->filename );
      clan->filename = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      write_clan_list();
      return;
    }

  if ( !str_cmp( arg2, "desc" ) )
    {
      STRFREE( clan->description );
      clan->description = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  do_setclan( ch, "" );
}

static const char *get_clan_type(const CLAN_DATA *const clan)
{
  return clan->clan_type == CLAN_CRIME ? "Crime Family" :
    clan->clan_type == CLAN_GUILD ? "Guild" : "Organization";
}

void do_showclan( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Usage: showclan <clan>\r\n", ch );
      return;
    }

  clan = get_clan( argument );

  if ( !clan )
    {
      send_to_char( "No such clan.\r\n", ch );
      return;
    }

  ch_printf( ch, "%s       : %s\r\nFilename: %s\r\n",
	     get_clan_type(clan),
             clan->name,
             clan->filename);
  ch_printf( ch, "Description: %s\r\nLeader: %s\r\n",
             clan->description,
             clan->leader );
  ch_printf( ch, "Number1: %s\r\nNumber2: %s\r\nPKills: %6d    PDeaths: %6d\r\n",
             clan->number1,
             clan->number2,
             clan->pkills,
             clan->pdeaths );
  ch_printf( ch, "MKills: %6d    MDeaths: %6d\r\n",
             clan->mkills,
             clan->mdeaths );
  ch_printf( ch, "Type: %d\r\n",
             clan->clan_type );
  ch_printf( ch, "Members: %3d\r\n",
             clan->members );
  ch_printf( ch, "Board: %5d   Jail: %5d\r\n",
             clan->board, clan->jail);
  ch_printf( ch, "Guard1: %5d  Guard2: %5d\r\n",
             clan->guard1,
             clan->guard2 );
  ch_printf( ch, "Patrol1: %5d  Patrol2: %5d\r\n",
             clan->patrol1,
             clan->patrol2 );
  ch_printf( ch, "Trooper1: %5d  Trooper2: %5d\r\n",
             clan->trooper1,
             clan->trooper2 );
  ch_printf( ch, "Funds: %ld\r\n",
             clan->funds );
  ch_printf( ch, "Enlist Room 1: %ld  Enlist Room 2: %ld\r\n",
             clan->enlistroom1, clan->enlistroom2 );
}

void do_makeclan( CHAR_DATA *ch, char *argument )
{
  char filename[256];
  CLAN_DATA *clan;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeclan <clan name>\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", CLAN_DIR, strlower(argument) );

  CREATE( clan, CLAN_DATA, 1 );
  LINK( clan, first_clan, last_clan, next, prev );
  clan->next_subclan = NULL;
  clan->prev_subclan = NULL;
  clan->last_subclan = NULL;
  clan->first_subclan = NULL;
  clan->mainclan     = NULL;
  clan->name            = STRALLOC( argument );
  clan->description     = STRALLOC( "" );
  clan->leader  = STRALLOC( "" );
  clan->number1 = STRALLOC( "" );
  clan->number2 = STRALLOC( "" );
  clan->tmpstr  = STRALLOC( "" );
}

void do_clans( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan;
  PLANET_DATA *planet;
  int count = 0;
  int pCount = 0;
  int support;
  long revenue;

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( clan->clan_type == CLAN_CRIME || clan->clan_type == CLAN_GUILD || clan->clan_type == CLAN_SUBCLAN )
        continue;

      pCount = 0;
      support = 0;
      revenue = 0;

      for ( planet = first_planet ; planet ; planet = planet->next )
        if ( clan == planet->governed_by )
          {
            support += planet->pop_support;
            pCount++;
            revenue += get_taxes(planet);
          }

      if ( pCount > 1 )
        support /= pCount;
      ch_printf( ch, "--------------------------------------------------------------------------------\r\n");
      ch_printf( ch, "&z&WOrganization: &Y%-20s    ", clan->name);
      ch_printf( ch, "&WPlanets: &O%-4d &z&WAvg Pop Support: ",pCount);
      if (support <50)
        {
          ch_printf( ch, "&R");
        }
      else
        {
          ch_printf( ch, "&O");
        }
      ch_printf( ch,"%-3d&W\r\nRevenue: &O%-29ld",support,revenue);
      ch_printf(ch,"&z&WLeader : ");
      if( clan->leader[0] != 0 )
        {
          ch_printf(ch,"&O%-20s",clan->leader);
        }
      else
        {
          ch_printf(ch,"&RNONE.             ");
        }
      ch_printf(ch, "&W\r\n");
      if ( clan->first_subclan )
        {
          CLAN_DATA *subclan;
          ch_printf( ch, "  &z&wSubclans             Leader\r\n");

          for ( subclan = clan->first_subclan ; subclan ; subclan = subclan->next_subclan )
            {
              ch_printf( ch, "  &O%-20s %-10s\r\n",
                         subclan->name, subclan->leader );
            }
        }
      count++;
    }
  ch_printf( ch, "--------------------------------------------------------------------------------\r\n");
  ch_printf( ch, "&z&WAutonomous Groups        Leader\r\n");
  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( clan->clan_type != CLAN_CRIME && clan->clan_type != CLAN_GUILD )
        continue;

      ch_printf( ch, "&Y%-24s &O%-10s\r\n",
                 clan->name, clan->leader );
      count++;
    }

  if ( !count )
    {
      set_char_color( AT_BLOOD, ch);
      send_to_char( "There are no organizations currently formed.\r\n", ch );
    }
  set_char_color( AT_WHITE, ch );

}

void do_enlist( CHAR_DATA *ch, char *argument )
{

  CLAN_DATA *clan;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  if ( ch->pcdata->clan )
    {
      ch_printf( ch , "You will have to resign from %s before you can join a new organization.\r\n", ch->pcdata->clan->name );
      return;
    }

  if ( ! IS_SET( ch->in_room->room_flags , ROOM_RECRUIT ) )
    {
      send_to_char( "You don't seem to be in a recruitment office.\r\n", ch );
      return;
    }

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( ( ch->in_room->vnum == clan->enlistroom1 ||
             ch->in_room->vnum == clan->enlistroom2 ) )
        {
          if( !str_cmp( clan->name, "The Empire" ) && ch->race != RACE_HUMAN && ch->race != RACE_DEFEL )
            {
              send_to_char( "&CThe recruiter says, 'You will need to find a sponsor to enlist'&R&w\r\n", ch );
              return;
            }
          SET_BIT( ch->speaks, LANG_CLAN );
          ++clan->members;
          STRFREE( ch->pcdata->clan_name );
          ch->pcdata->clan_name = QUICKLINK( clan->name );
          ch->pcdata->clan = clan;
          ch_printf( ch, "Welcome to %s.\r\n", clan->name );
          update_member( ch );
          save_clan ( clan );
          return;
        }
    }

  send_to_char( "They don't seem to be recruiting right now.\r\n", ch );
  return;

}

void do_resign( CHAR_DATA *ch, char *argument )
{

  CLAN_DATA *clan;
  long lose_exp;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  clan =  ch->pcdata->clan;

  if ( clan == NULL )
    {
      send_to_char( "You have to join an organization before you can quit it.\r\n", ch );
      return;
    }

  if ( !str_cmp( ch->name, ch->pcdata->clan->leader ) )
    {
      ch_printf( ch, "You can't resign from %s ... you are the leader!\r\n", clan->name );
      return;
    }

  if ( ch->speaking & LANG_CLAN )
    ch->speaking = LANG_COMMON;
  REMOVE_BIT( ch->speaks, LANG_CLAN );
  --clan->members;
  if ( !str_cmp( ch->name, ch->pcdata->clan->number1 ) )
    {
      STRFREE( ch->pcdata->clan->number1 );
      ch->pcdata->clan->number1 = STRALLOC( "" );
    }
  if ( !str_cmp( ch->name, ch->pcdata->clan->number2 ) )
    {
      STRFREE( ch->pcdata->clan->number2 );
      ch->pcdata->clan->number2 = STRALLOC( "" );
    }
  remove_member( ch );
  ch->pcdata->clan = NULL;
  STRFREE(ch->pcdata->clan_name);
  ch->pcdata->clan_name = STRALLOC( "" );
  act( AT_MAGIC, "You resign your position in $t", ch, clan->name, NULL , TO_CHAR );

  lose_exp = UMAX( ch->experience[DIPLOMACY_ABILITY] - exp_level( ch->skill_level[DIPLOMACY_ABILITY]  ) , 0 );
  ch_printf( ch, "You lose %ld diplomacy experience.\r\n", lose_exp );
  ch->experience[DIPLOMACY_ABILITY] -= lose_exp;

  DISPOSE( ch->pcdata->bestowments );
  ch->pcdata->bestowments = str_dup("");

  save_char_obj( ch );  /* clan gets saved when pfile is saved */

  return;

}

void do_clan_withdraw( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan;
  long       amount;

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "You don't seem to belong to an organization to withdraw funds from...\r\n", ch );
      return;
    }

  if ( (ch->pcdata && ch->pcdata->bestowments
        &&    is_name("withdraw", ch->pcdata->bestowments))
       ||   !str_cmp( ch->name, ch->pcdata->clan->leader  ))
    ;
  else
    {
      send_to_char( "&RYour organization hasn't seen fit to bestow you with that ability." ,ch );
      return;
    }

  if ( !has_comlink( ch ) )
    {
      if (!ch->in_room || !IS_SET(ch->in_room->room_flags, ROOM_BANK) )
        {
          send_to_char( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }


  clan = ch->pcdata->clan;

  amount = atoi( argument );

  if ( !amount )
    {
      send_to_char( "How much would you like to withdraw?\r\n", ch );
      return;
    }

  if ( amount > clan->funds )
    {
      ch_printf( ch,  "%s doesn't have that much!\r\n", clan->name );
      return;
    }

  if ( amount < 0 )
    {
      ch_printf( ch,  "Nice try...\r\n" );
      return;
    }

  ch_printf( ch,  "You withdraw %ld credits from %s's funds.\r\n", amount, clan->name );

  clan->funds -= amount;
  ch->gold += amount;
  save_clan ( clan );

}


void do_clan_donate( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan;
  long       amount;

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "You don't seem to belong to an organization to donate to...\r\n", ch );
      return;
    }

  if ( !has_comlink( ch ) )
    {
      if (!ch->in_room || !IS_SET(ch->in_room->room_flags, ROOM_BANK) )
        {
          send_to_char( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }


  clan = ch->pcdata->clan;

  amount = atoi( argument );

  if ( !amount )
    {
      send_to_char( "How much would you like to donate?\r\n", ch );
      return;
    }

  if ( amount < 0 )
    {
      ch_printf( ch,  "Nice try...\r\n" );
      return;
    }

  if ( amount > ch->gold )
    {
      send_to_char( "You don't have that much!\r\n", ch );
      return;
    }

  ch_printf( ch,  "You donate %ld credits to %s's funds.\r\n", amount, clan->name );

  clan->funds += amount;
  ch->gold -= amount;
  save_clan ( clan );

}

void do_appoint ( CHAR_DATA *ch , char *argument )
{
  char arg[MAX_STRING_LENGTH];

  argument = one_argument( argument, arg );

  if ( IS_NPC( ch ) || !ch->pcdata )
    return;

  if ( !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if (  str_cmp( ch->name, ch->pcdata->clan->leader  )  )
    {
      send_to_char( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Useage: appoint <name> < first | second >\r\n", ch );
      return;
    }

  if ( !str_cmp( argument , "first" )  )
    {
      if ( ch->pcdata->clan->number1 && str_cmp( ch->pcdata->clan->number1 , "" ) )
        {
          send_to_char( "You already have someone in that position ... demote them first.\r\n", ch );
          return;
        }

      STRFREE( ch->pcdata->clan->number1 );
      ch->pcdata->clan->number1 = STRALLOC( arg );
    }
  else if ( !str_cmp( argument , "second" )  )
    {
      if ( ch->pcdata->clan->number2 && str_cmp( ch->pcdata->clan->number2 , "" ))
        {
          send_to_char( "You already have someone in that position ... demote them first.\r\n", ch );
          return;
        }

      STRFREE( ch->pcdata->clan->number2 );
      ch->pcdata->clan->number2 = STRALLOC( arg );
    }
  else do_appoint( ch , "" );
  save_clan ( ch->pcdata->clan );

}

void do_demote ( CHAR_DATA *ch , char *argument )
{

  if ( IS_NPC( ch ) || !ch->pcdata )
    return;

  if ( !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if (  str_cmp( ch->name, ch->pcdata->clan->leader  )  )
    {
      send_to_char( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Demote who?\r\n", ch );
      return;
    }

  if ( !str_cmp( argument , ch->pcdata->clan->number1 )  )
    {
      send_to_char( "Player Demoted!", ch );

      STRFREE( ch->pcdata->clan->number1 );
      ch->pcdata->clan->number1 = STRALLOC( "" );
    }
  else if ( !str_cmp( argument , ch->pcdata->clan->number2 )  )
    {
      send_to_char( "Player Demoted!", ch );

      STRFREE( ch->pcdata->clan->number2 );
      ch->pcdata->clan->number2 = STRALLOC( "" );
    }
  else
    {
      send_to_char( "They seem to have been demoted already.\r\n", ch );
      return;
    }
  save_clan ( ch->pcdata->clan );

}

void do_capture ( CHAR_DATA *ch , char *argument )
{
  CLAN_DATA *clan;
  PLANET_DATA *planet;
  PLANET_DATA *cPlanet;
  float support = 0.0;
  int pCount = 0;
  char buf[MAX_STRING_LENGTH];

  if ( !ch->in_room || !ch->in_room->area)
    return;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char ( "huh?\r\n" , ch );
      return;
    }

  if ( !ch->pcdata->clan )
    {
      send_to_char ( "You need to be a member of an organization to do that!\r\n" , ch );
      return;
    }

  if ( ch->pcdata->clan->mainclan )
    clan = ch->pcdata->clan->mainclan;
  else
    clan = ch->pcdata->clan;

  if ( clan->clan_type == CLAN_CRIME )
    {
      send_to_char ( "Crime fimilies aren't in the business of controlling worlds.\r\n" , ch );
      return;
    }

  if ( clan->clan_type == CLAN_GUILD )
    {
      send_to_char ( "Your organization serves a much greater purpose.\r\n" , ch );
      return;
    }

  if ( ( planet = ch->in_room->area->planet ) == NULL )
    {
      send_to_char ( "You must be on a planet to capture it.\r\n" , ch );
      return;
    }

  if ( clan == planet->governed_by )
    {
      send_to_char ( "Your organization already controls this planet.\r\n" , ch );
      return;
    }

  if ( planet->spaceobject )
    {
      SHIP_DATA *ship;
      CLAN_DATA *sClan;

      for ( ship = first_ship ; ship ; ship = ship->next )
        {
          if( !ship->spaceobject )
            continue;
          if( ship->shipstate == SHIP_HYPERSPACE || ship->shipstate == SHIP_DISABLED )
            continue;
          if( !space_in_range_c( ship, planet->spaceobject ) )
            continue;
          sClan = get_clan(ship->owner);
          if ( !sClan )
            continue;
          if ( sClan->mainclan )
            sClan = sClan->mainclan;
          if ( sClan == planet->governed_by )
            {
              send_to_char ( "A planet cannot be captured while protected by orbiting spacecraft.\r\n" , ch );
              return;
            }
        }
    }

  if ( IS_SET( planet->flags, PLANET_NOCAPTURE ) )
    {
      send_to_char ( "This planet cannot be captured.\r\n" , ch);
      return;
    }

  if ( planet->pop_support > 0 )
    {
      send_to_char ( "The population is not in favour of changing leaders right now.\r\n" , ch );
      return;
    }

  for ( cPlanet = first_planet ; cPlanet ; cPlanet = cPlanet->next )
    if ( clan == cPlanet->governed_by )
      {
        pCount++;
        support += cPlanet->pop_support;
      }

  if ( support < 0 )
    {
      send_to_char ( "There is not enough popular support for your organization!\r\nTry improving loyalty on the planets that you already control.\r\n" , ch );
      return;
    }

  planet->governed_by = clan;
  planet->pop_support = 50;

  sprintf( buf , "%s has claimed the planet %s!", clan->name, planet->name );
  echo_to_all( AT_RED , buf , 0 );

  save_planet( planet );

  return;
}

void do_empower ( CHAR_DATA *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  CLAN_DATA *clan;
  char buf[MAX_STRING_LENGTH];

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        &&    is_name("empower", ch->pcdata->bestowments))
       || !str_cmp( ch->name, clan->leader  ) )
    ;
  else
    {
      send_to_char( "You clan hasn't seen fit to bestow that ability to you!\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );
  argument = one_argument( argument, arg2 );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Empower whom to do what?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Nice try.\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan != ch->pcdata->clan )
    {
      send_to_char( "This player does not belong to your clan!\r\n", ch );
      return;
    }

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = str_dup("");

  if ( arg2[0] == '\0' || !str_cmp( arg2, "list" ) )
    {
      ch_printf( ch, "Current bestowed commands on %s: %s.\r\n",
                 victim->name, victim->pcdata->bestowments );
      ch_printf( ch, "Current salary on %s: %d.\r\n",
                 victim->name, victim->pcdata->salary );

      return;
    }

  if ( (victim->pcdata && victim->pcdata->bestowments
        &&    is_name(arg2, victim->pcdata->bestowments)) )
    {
      send_to_char( "That player already has that power.\r\n", ch );
      return;
    }


  if ( !str_cmp( arg2, "none" ) )
    {
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup("");
      ch_printf( ch, "Bestowments removed from %s.\r\n", victim->name );
      ch_printf( victim, "%s has removed your bestowed clan abilities.\r\n", ch->name );
      return;
    }
  else if ( !str_cmp( arg2, "pilot" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to fly clan ships.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ability to fly clan ships.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "withdraw" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to withdraw clan funds.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to withdraw clan funds.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "clanbuyship" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to buy clan ships.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to use clanbuyship.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "induct" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to induct new members.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to induct new members.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "empower" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to empower members.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to empower members.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "salary" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to assign salaries.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to assign salaries.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "roster" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to access the roster.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to access the roster.\r\n", ch );
    }
  else
    {
      send_to_char( "Currently you may empower members with only the following:\r\n", ch );
      send_to_char( "\r\npilot:       ability to fly clan ships\r\n", ch );
      send_to_char(     "withdraw:    ability to withdraw clan funds\r\n", ch );
      send_to_char(     "clanbuyship: ability to buy clan ships\r\n", ch );
      send_to_char(     "induct:      ability to induct new members\r\n", ch );
      send_to_char(     "salary:      ability to assign salaries\r\n", ch );
      send_to_char(     "roster:      ability to see the full clan roster\r\n", ch );
      send_to_char(     "none:        removes bestowed abilities\r\n", ch );
    }

  save_char_obj( victim );      /* clan gets saved when pfile is saved */
  return;


}

void do_addsalary ( CHAR_DATA *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  CLAN_DATA *clan;
  int salary;

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        &&    is_name("salary", ch->pcdata->bestowments))
       || !str_cmp( ch->name, clan->leader  ) )
    ;
  else
    {
      send_to_char( "You clan hasn't seen fit to bestow that ability to you!\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );
  argument = one_argument( argument, arg2 );

  salary = atoi(arg2);

  if ( arg[0] == '\0' )
    {
      send_to_char( "Assign a salary to whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Nice try.\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan != ch->pcdata->clan )
    {
      send_to_char( "This player does not belong to your clan!\r\n", ch );
      return;
    }

  if ( salary < 0 )
    {
      ch_printf( ch, "Salary's must be positive!\r\n", victim->name );
      return;
    }

  victim->pcdata->salary = salary;
  ch_printf( ch, "%s has been assigned %d credits for a salary.\r\n", victim->name, salary );
  ch_printf( victim, "%s has give you a %d credit salary.\r\n", ch->name, salary );
  return;

}

void show_members( CHAR_DATA *ch, char *argument, char *format )
{
  MEMBER_LIST   *members_list;
  MEMBER_DATA   *member;
  CLAN_DATA     *clan;
  int members = 0;
  for( members_list = first_member_list; members_list; members_list = members_list->next )
    {
      if( !str_cmp( members_list->name, argument ) )
        break;
    }

  if( !members_list )
    return;

  clan = get_clan( argument );

  if ( !clan  )
    return;

  pager_printf( ch, "\r\nMembers of %s\r\n", clan->name );
  pager_printf( ch,
                "------------------------------------------------------------\r\n" );
  pager_printf( ch, "Leader: %s\r\n", clan->leader );
  pager_printf( ch, "Number1: %s\r\n", clan->number1 );
  pager_printf( ch, "Number2: %s\r\n", clan->number2 );
  pager_printf( ch, "Spacecraft: %d  Vehicles: %d\r\n", clan->spacecraft, clan->vehicles );
  pager_printf( ch,
                "------------------------------------------------------------\r\n" );
  pager_printf( ch, "  Lvl         Name           Class   Kills  Deaths       Joined\r\n\r\n" );

  if( format && format[0] != '\0' )
    {
      if( !str_cmp( format, "kills" )
          || !str_cmp( format, "deaths" )
          || !str_cmp( format, "alpha" ))
        {
          MS_DATA *insert = NULL;
          MS_DATA *sort;
          MS_DATA *first_member = NULL;
          MS_DATA *last_member = NULL;

          CREATE( sort, MS_DATA, 1 );
          sort->member = members_list->first_member;
          LINK( sort, first_member, last_member, next, prev );

          for( member = members_list->first_member->next; member; member = member->next )
            {
              insert = NULL;
              for( sort = first_member; sort; sort = sort->next )
                {
                  if( !str_cmp( format, "kills" ))
                    {
                      if( member->kills > sort->member->kills )
                        {
                          CREATE( insert, MS_DATA, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }
                  else if( !str_cmp( format, "deaths" ))
                    {
                      if( member->deaths > sort->member->deaths )
                        {
                          CREATE( insert, MS_DATA, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }
                  else if( !str_cmp( format, "alpha" ))
                    {
                      if( strcmp( member->name, sort->member->name ) < 0 )
                        {
                          CREATE( insert, MS_DATA, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }

                }
              if( insert == NULL )
                {
                  CREATE( insert, MS_DATA, 1 );
                  insert->member = member;
                  LINK( insert, first_member, last_member, next, prev );
                }
            }

          for( sort = first_member; sort; sort = sort->next )
            if( str_cmp( sort->member->name, clan->leader )
                && str_cmp( sort->member->name, clan->number1 )
                && str_cmp( sort->member->name, clan->number2 ) )
              {
                members++;
                pager_printf( ch, "[%3d] %12s %15s %7d %7d %10s\r\n",
                              sort->member->level,
                              capitalize(sort->member->name ),
                              ability_name[sort->member->mclass],
                              sort->member->kills,
                              sort->member->deaths,
                              sort->member->since );
              }

        }

      for( member = members_list->first_member; member; member = member->next )
        if( !str_prefix( format, member->name ) )
          {
            members++;
            pager_printf( ch, "[%3d] %12s %15s %7d %7d %10s\r\n",
                          member->level,
                          capitalize(member->name ),
                          ability_name[member->mclass],
                          member->kills,
                          member->deaths,
                          member->since );
          }

    }
  else
    {

      for( member = members_list->first_member; member; member = member->next )
        if( str_cmp( member->name, clan->leader ) && str_cmp( member->name, clan->number1 )
            && str_cmp( member->name, clan->number2 ) )
          {
            members++;
            pager_printf( ch, "[%3d] %12s %15s %7d %7d %10s\r\n",
                          member->level,
                          capitalize(member->name),
                          ability_name[member->mclass],
                          member->kills,
                          member->deaths,
                          member->since );
          }
    }

  pager_printf( ch,
                "------------------------------------------------------------\r\n" );
  pager_printf( ch, "Total Members: %d\r\n", members);
  pager_printf( ch,
                "------------------------------------------------------------\r\n" );


}

void remove_member( CHAR_DATA *ch )
{
  MEMBER_LIST   *members_list;
  MEMBER_DATA   *member;

  if( !ch->pcdata )
    return;

  for( members_list = first_member_list; members_list; members_list = members_list->next )
    {
      if( !str_cmp( members_list->name, ch->pcdata->clan_name ) )
        for( member = members_list->first_member; member; member = member->next )
          {
            if( !str_cmp( member->name, ch->name ) )
              {
                UNLINK( member, members_list->first_member, members_list->last_member, next, prev );
                STRFREE( member->name );
                STRFREE( member->since );
                DISPOSE( member );
                save_member_list( members_list );
                break;
              }
          }
    }
}

void do_roster( CHAR_DATA *ch, char *argument )
{
  if( IS_NPC( ch ) || !ch->pcdata->clan
      || ( str_cmp(ch->name, ch->pcdata->clan->leader )
           && str_cmp(ch->name, ch->pcdata->clan->number1 )
           && str_cmp(ch->name, ch->pcdata->clan->number2 )
           && (!ch->pcdata || !ch->pcdata->bestowments
               || !is_name("roster", ch->pcdata->bestowments)) ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  show_members( ch, ch->pcdata->clan->name, argument );
  return;

}
void do_members( CHAR_DATA *ch, char *argument )
{

  char arg1[MAX_STRING_LENGTH];
  argument = one_argument( argument, arg1 );

  if( argument[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Do what?\r\n", ch );
      return;
    }

  if( !str_cmp( arg1, "show" ) )
    {
      if( !str_cmp( argument, "all" ) )
        {
          MEMBER_LIST *members_list;
          for( members_list = first_member_list; members_list; members_list = members_list->next )
            show_members( ch, members_list->name, NULL );
          return;
        }

      show_members( ch, argument, NULL );
      return;
    }

  if( !str_cmp( arg1, "create" ) )
    {
      MEMBER_LIST *members_list;

      CREATE( members_list, MEMBER_LIST, 1 );
      members_list->name = STRALLOC( argument );
      LINK( members_list, first_member_list, last_member_list, next, prev );
      save_member_list( members_list );
      ch_printf( ch, "Member lists \"%s\" created.\r\n", argument );
      return;
    }

  if( !str_cmp( arg1, "delete" ) )
    {
      MEMBER_LIST *members_list;
      MEMBER_DATA *member;

      for( members_list = first_member_list; members_list; members_list = members_list->next )
        if( !str_cmp( argument, members_list->name ) )
          {
            while( members_list->first_member )
              {
                member = members_list->first_member;
                STRFREE( member->name );
                STRFREE( member->since );
                UNLINK( member, members_list->first_member, members_list->last_member, next, prev );
                DISPOSE( member );
              }

            STRFREE( members_list->name );
            UNLINK( members_list, first_member_list, last_member_list, next, prev );
            DISPOSE( members_list );
            ch_printf( ch, "Member list \"%s\" destroyed.\r\n", argument );
            return;
          }
      send_to_char( "No such list.\r\n", ch );
      return;
    }
}

void save_member_list( MEMBER_LIST *members_list )
{
  MEMBER_DATA   *member;
  FILE          *fp;
  CLAN_DATA    *clan;
  char         buf[MAX_STRING_LENGTH];

  if( !members_list )
    {
      bug( "save_member_list: NULL members_list" );
      return;
    }

  if( ( clan = get_clan( members_list->name )) == NULL )
    {
      bug( "save_member_list: no such clan: %s", members_list->name );
      return;
    }

  sprintf( buf, "%s%s.mem", CLAN_DIR, clan->filename );

  if( ( fp = fopen( buf, "w" ) ) == NULL )
    {
      bug( "Cannot open clan.mem file for writing", 0 );
      perror( buf );
      return;
    }

  fprintf( fp, "Name          %s~\n", members_list->name );
  for( member = members_list->first_member; member; member = member->next )
    fprintf( fp, "Member        %s %s %d %d %d %d\n",
             member->name, member->since, member->kills, member->deaths, member->level, member->mclass);
  fprintf( fp, "End\n\n" );
  fclose( fp );

}

bool load_member_list( char *filename )
{
  FILE *fp;
  char buf[MAX_STRING_LENGTH];
  MEMBER_LIST *members_list;
  MEMBER_DATA *member;

  sprintf( buf, "%s%s.mem", CLAN_DIR, filename );

  if( ( fp = fopen( buf, "r" ) ) == NULL )
    {
      bug( "Cannot open member list for reading", 0 );
      return FALSE;
    }

  CREATE( members_list, MEMBER_LIST, 1 );

  for( ; ; )
    {
      const char *word = fread_word( fp );

      if( !str_cmp( word, "Name" ) )
        {
          members_list->name = fread_string( fp );
          continue;
        }
      else
        if( !str_cmp( word, "Member" ) )
          {
            CREATE( member, MEMBER_DATA, 1 );
            member->name = STRALLOC( fread_word( fp ) );
            member->since = STRALLOC( fread_word( fp ) );
            member->kills = fread_number( fp );
            member->deaths = fread_number( fp );
            member->level = fread_number( fp );
            member->mclass = fread_number( fp );
            LINK( member, members_list->first_member, members_list->last_member, next, prev );
            continue;
          }
        else
          if( !str_cmp( word, "End" ) )
            {
              LINK( members_list, first_member_list, last_member_list, next, prev );
              fclose( fp );
              return TRUE;
            }
          else
            {
              bug( "load_members_list: bad section", 0 );
              fclose( fp );
              return FALSE;
            }
    }

}

void update_member( CHAR_DATA *ch )
{
  MEMBER_LIST *members_list;
  MEMBER_DATA *member;

  if( IS_NPC( ch ) || IS_IMMORTAL(ch) || !ch->pcdata->clan )
    return;

  for( members_list = first_member_list; members_list; members_list = members_list->next )
    if( !str_cmp( members_list->name, ch->pcdata->clan_name ) )
      {
        for( member = members_list->first_member; member; member = member->next )
          if ( !str_cmp( member->name, ch->name ) )
            {
              if( ch->pcdata->clan->clan_type == CLAN_PLAIN )
                {
                  member->kills = ch->pcdata->pkills;
                  member->deaths = ch->pcdata->clones;
                }
              else
                {
                  member->kills = ch->pcdata->pkills;
                  member->deaths = ch->pcdata->clones;
                }
              member->mclass = ch->main_ability;
              member->level = ch->top_level;
              return;
            }

        if( member == NULL )
          {
            struct tm *t = localtime(&current_time);
            char buf[MAX_STRING_LENGTH];

            CREATE( member, MEMBER_DATA, 1 );
            member->name = STRALLOC( ch->name );
            member->level = ch->top_level;
            member->mclass = ch->main_ability;
            sprintf( buf, "[%02d|%02d|%04d]", t->tm_mon+1, t->tm_mday, t->tm_year+1900 );
            member->since = STRALLOC( buf );
            if( ch->pcdata->clan->clan_type == CLAN_PLAIN )
              {
                member->kills = ch->pcdata->pkills;
                member->deaths = ch->pcdata->clones;
              }
            else
              {
                member->kills = ch->pcdata->pkills;
                member->deaths = ch->pcdata->clones;
              }
            LINK( member, members_list->first_member, members_list->last_member, next, prev );
            save_member_list( members_list );

          }

      }
}

void do_clanfunds( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan;

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char("You don't seem to belong to an organization.\r\n",ch);
      return;
    }

  if ( !has_comlink( ch ) )
    {
      if (!ch->in_room || !IS_SET(ch->in_room->room_flags, ROOM_BANK) )
        {
          send_to_char( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }

  clan = ch->pcdata->clan;
  if ( clan->funds == 0 )
    {
      ch_printf(ch,"%s has no funds at its disposal.",clan->name);
      return;
    }
  ch_printf(ch,"%s has %ld credits at its disposal.\r\n",clan->name,clan->funds);
}
