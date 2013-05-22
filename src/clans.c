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

#include <ctype.h>
#include <string.h>
#include <time.h>
#include "mud.h"
#include "character.h"

#define MAX_NEST        100
static  OBJ_DATA *rgObjNest[MAX_NEST];

CLAN_DATA * first_clan = NULL;
CLAN_DATA * last_clan = NULL;

MEMBER_LIST * first_member_list = NULL;
MEMBER_LIST * last_member_list = NULL;

/* local routines */
static void fread_clan( CLAN_DATA *clan, FILE *fp );
static bool load_clan_file( const char *clanfile );

/*
 * Get pointer to clan structure from clan name.
 */
CLAN_DATA *get_clan( const char *name )
{
  CLAN_DATA *clan = NULL;

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( !str_cmp( name, clan->name ) )
	{
	  return clan;
	}
    }

  return NULL;
}

void write_clan_list( void )
{
  const CLAN_DATA *tclan = NULL;
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
void save_clan( const CLAN_DATA *clan )
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
static void fread_clan( CLAN_DATA *clan, FILE *fp )
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

static bool load_clan_file( const char *clanfile )
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
void load_clans( void )
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

void show_members( const CHAR_DATA *ch, const char *argument, const char *format )
{
  MEMBER_LIST *members_list = NULL;
  MEMBER_DATA *member = NULL;
  const CLAN_DATA *clan = NULL;
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
          MS_DATA *sort = NULL;
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
	    {
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

void remove_member( const CHAR_DATA *ch )
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

void save_member_list( const MEMBER_LIST *members_list )
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

bool load_member_list( const char *filename )
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

void update_member( const CHAR_DATA *ch )
{
  MEMBER_LIST *members_list;
  MEMBER_DATA *member;

  if( IS_NPC( ch ) || IS_IMMORTAL(ch) || !ch->pcdata->clan )
    return;

  for( members_list = first_member_list; members_list; members_list = members_list->next )
    {
      if( !str_cmp( members_list->name, ch->pcdata->clan_name ) )
	{
	  for( member = members_list->first_member; member; member = member->next )
	    {
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
}
