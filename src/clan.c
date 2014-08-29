/****************************************************************************
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
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include <time.h>
#include "mud.h"
#include "character.h"
#include "clan.h"

#define MAX_NEST 100
static Object *rgObjNest[MAX_NEST];

Clan *first_clan = NULL;
Clan *last_clan = NULL;

MEMBER_LIST *first_member_list = NULL;
MEMBER_LIST *last_member_list = NULL;

struct MatchClanUserData
{
  struct Clan *Clan;
  const char *Name;
};

/* local routines */
static void ReadClan( Clan *clan, FILE *fp );
static bool LoadClanFile( const char *clanfile );
static bool MatchClan( Clan *clan, struct MatchClanUserData *userData );
static void LoadClanStoreroom( const Clan *clan );
static void LoadClanMemberList( const Clan *clan );

/*
 * Get pointer to clan structure from clan name.
 */
Clan *GetClan( const char *name )
{
  struct MatchClanUserData userData;

  userData.Clan = NULL;
  userData.Name = name;
  
  ForEach( Clan, first_clan, next, MatchClan, &userData );

  return userData.Clan;
}

static bool MatchClan( Clan *clan, struct MatchClanUserData *userData )
{
  if( !StrCmp( userData->Name, clan->name ) )
    {
      userData->Clan = clan;
      return false;
    }

  return true;
}

static bool WriteClanFilename( const Clan *clan, FILE *fpout )
{
  fprintf( fpout, "%s\n", clan->filename );
  return true;
}

void WriteClanList( void )
{
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", CLAN_DIR, CLAN_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      Bug( "FATAL: cannot open %s for writing!\r\n", filename );
      return;
    }

  ForEach( Clan, first_clan, next, WriteClanFilename, fpout );

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

/*
 * Save a clan's data to its data file
 */
void SaveClan( const Clan *clan )
{
  FILE *fp;
  char filename[256];
  char buf[MAX_STRING_LENGTH];

  if ( !clan )
    {
      Bug( "SaveClan: null clan pointer!", 0 );
      return;
    }

  if ( !clan->filename || clan->filename[0] == '\0' )
    {
      sprintf( buf, "SaveClan: %s has no filename", clan->name );
      Bug( buf, 0 );
      return;
    }

  sprintf( filename, "%s%s", CLAN_DIR, clan->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "SaveClan: fopen", 0 );
      perror( filename );
    }
  else
    {
      fprintf( fp, "#CLAN\n" );
      fprintf( fp, "Name         %s~\n", clan->name              );
      fprintf( fp, "Filename     %s~\n", clan->filename          );
      fprintf( fp, "Description  %s~\n", clan->description       );
      fprintf( fp, "Leader       %s~\n", clan->leadership.leader            );
      fprintf( fp, "NumberOne    %s~\n", clan->leadership.number1           );
      fprintf( fp, "NumberTwo    %s~\n", clan->leadership.number2           );
      fprintf( fp, "PKills       %d\n",  clan->pkills            );
      fprintf( fp, "PDeaths      %d\n",  clan->pdeaths           );
      fprintf( fp, "MKills       %d\n",  clan->mkills            );
      fprintf( fp, "MDeaths      %d\n",  clan->mdeaths           );
      fprintf( fp, "Type         %d\n",  clan->clan_type         );
      fprintf( fp, "Members      %d\n",  clan->members           );
      fprintf( fp, "Board        %ld\n",  clan->board             );
      fprintf( fp, "Storeroom    %ld\n",  clan->storeroom         );
      fprintf( fp, "GuardOne     %ld\n",  clan->guard1            );
      fprintf( fp, "GuardTwo     %ld\n",  clan->guard2            );
      fprintf( fp, "PatrolOne    %ld\n",  clan->patrol1           );
      fprintf( fp, "PatrolTwo    %ld\n",  clan->patrol2           );
      fprintf( fp, "TrooperOne   %ld\n",  clan->trooper1          );
      fprintf( fp, "TrooperTwo   %ld\n",  clan->trooper2          );
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
static void ReadClan( Clan *clan, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'B':
          KEY( "Board", clan->board, ReadInt( fp ) );
          break;

        case 'D':
          KEY( "Description", clan->description, ReadStringToTilde( fp ) );
          break;

        case 'E':
          KEY( "Enlist1", clan->enlistroom1, ReadInt( fp ) );
          KEY( "Enlist2", clan->enlistroom2, ReadInt( fp ) );

          if ( !StrCmp( word, "End" ) )
            {
              if (!clan->name)
		{
		  clan->name = CopyString( "" );
		}

              if (!clan->leadership.leader)
		{
		  clan->leadership.leader = CopyString( "" );
		}

              if (!clan->description)
		{
		  clan->description = CopyString( "" );
		}

              if (!clan->leadership.number1)
		{
		  clan->leadership.number1 = CopyString( "" );
		}


              if (!clan->leadership.number2)
		{
		  clan->leadership.number2 = CopyString( "" );
		}

              if (!clan->tmpstr)
		{
		  clan->tmpstr = CopyString( "" );
		}

              return;
            }
          break;

        case 'F':
          KEY( "Funds",    clan->funds,    ReadInt( fp ) );
          KEY( "Filename", clan->filename, ReadStringToTilde( fp ) );
          break;

        case 'G':
          KEY( "GuardOne", clan->guard1, ReadInt( fp ) );
          KEY( "GuardTwo", clan->guard2, ReadInt( fp ) );
          break;

        case 'J':
          KEY( "Jail", clan->jail, ReadInt( fp ) );
          break;

        case 'L':
          KEY( "Leader", clan->leadership.leader, ReadStringToTilde( fp ) );
          break;

        case 'M':
          KEY( "MDeaths",  clan->mdeaths, ReadInt( fp ) );
          KEY( "Members",  clan->members, ReadInt( fp ) );
          KEY( "MKills",   clan->mkills,  ReadInt( fp ) );
          KEY( "MainClan", clan->tmpstr,  ReadStringToTilde( fp ) );
          break;

        case 'N':
          KEY( "Name",      clan->name,    ReadStringToTilde( fp ) );
          KEY( "NumberOne", clan->leadership.number1, ReadStringToTilde( fp ) );
          KEY( "NumberTwo", clan->leadership.number2, ReadStringToTilde( fp ) );
          break;

        case 'P':
          KEY( "PDeaths",   clan->pdeaths, ReadInt( fp ) );
          KEY( "PKills",    clan->pkills,  ReadInt( fp ) );
          KEY( "PatrolOne", clan->patrol1, ReadInt( fp ) );
          KEY( "PatrolTwo", clan->patrol2, ReadInt( fp ) );
          break;

        case 'S':
          KEY( "Storeroom", clan->storeroom, ReadInt( fp ) );
          break;

        case 'T':
          KEY( "Type", clan->clan_type, ReadInt( fp ) );
          KEY( "TrooperOne", clan->trooper1, ReadInt( fp ) );
          KEY( "TrooperTwo", clan->trooper2, ReadInt( fp ) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "ReadClan: no match: %s", word );
        }
    }
}

/*
 * Load a clan file
 */
static bool LoadClanFile( const char *clanfile )
{
  char filename[256];
  Clan *clan;
  FILE *fp;
  bool found = false;

  AllocateMemory( clan, Clan, 1 );
  clan->next_subclan = NULL;
  clan->prev_subclan = NULL;
  clan->last_subclan = NULL;
  clan->first_subclan = NULL;
  clan->mainclan     = NULL;

  sprintf( filename, "%s%s", CLAN_DIR, clanfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {

      found = true;

      for ( ; ; )
        {
	  const char *word;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "LoadClanFile: # not found." );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "CLAN"   ) )
            {
              ReadClan( clan, fp );
              break;
            }
          else if ( !StrCmp( word, "END"  ) )
	    {
              break;
	    }
	  else
	    {
	      Bug( "LoadClanFile: bad section: %s.", word );
	      break;
	    }
        }

      fclose( fp );
    }

  if ( found )
    {
      LINK( clan, first_clan, last_clan, next, prev );

      LoadClanMemberList( clan );
      LoadClanStoreroom( clan );
    }
  else
    {
      FreeMemory( clan );
    }

  return found;
}

static void LoadClanStoreroom( const Clan *clan )
{
  char filename[256];
  FILE *fp = NULL;
  Room *storeroom = NULL;

  if ( clan->storeroom == INVALID_VNUM
       || (storeroom = GetRoom( clan->storeroom )) == NULL )
    {
      LogPrintf( "Storeroom not found." );
      return;
    }

  sprintf( filename, "%s%s.vault", CLAN_DIR, clan->filename );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      int iNest = 0;
      Object *tobj = NULL, *tobj_next = NULL;

      LogPrintf( "Loading clan storage room" );
      RoomProgSetSupermob(storeroom);

      for ( iNest = 0; iNest < MAX_NEST; iNest++ )
	{
	  rgObjNest[iNest] = NULL;
	}

      for ( ; ; )
	{
	  const char *word = NULL;
	  char letter = ReadChar( fp );

	  if ( letter == '*' )
	    {
	      ReadToEndOfLine( fp );
	      continue;
	    }

	  if ( letter != '#' )
	    {
	      Bug( "%s: # not found (%s)", __FUNCTION__, clan->name );
	      break;
	    }

	  word = ReadWord( fp );

	  if ( !StrCmp( word, "OBJECT" ) )
	    {
	      ReadObject( supermob, fp, OS_CARRY );
	    }
	  else if ( !StrCmp( word, "END" ) )
	    {
	      break;
	    }
	  else
	    {
	      Bug( "%s: bad section (%s)", __FUNCTION__, clan->name );
	      break;
	    }
	}

      fclose( fp );

      for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
	{
	  tobj_next = tobj->next_content;
	  ObjectFromCharacter( tobj );
	  ObjectToRoom( tobj, storeroom );
	}

      ReleaseSupermob();
    }
  else
    {
      LogPrintf( "Cannot open clan vault" );
    }
}

/*
 * Load in all the clan files.
 */
void LoadClans( void )
{
  FILE *fpList = NULL;
  char clanlist[256];
  Clan *clan = NULL;

  LogPrintf( "Loading clans..." );
  sprintf( clanlist, "%s%s", CLAN_DIR, CLAN_LIST );

  if ( ( fpList = fopen( clanlist, "r" ) ) == NULL )
    {
      perror( clanlist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : ReadWord( fpList );
      LogPrintf( filename );

      if ( filename[0] == '$' )
	{
	  break;
	}

      if ( !LoadClanFile( filename ) )
        {
          Bug( "Cannot load clan file: %s", filename );
        }
    }

  fclose( fpList );
  LogPrintf( " Done clans\r\nSorting clans...." );

  for ( clan=first_clan; clan; clan = clan->next )
    {
      Clan *bosclan = NULL;

      if ( !clan->tmpstr || clan->tmpstr[0] == '\0' )
        continue;

      bosclan = GetClan ( clan->tmpstr );

      if ( !bosclan )
        continue;

      LINK( clan , bosclan->first_subclan , bosclan->last_subclan , next_subclan, prev_subclan );
      clan->mainclan = bosclan;
    }

  LogPrintf(" Done sorting" );
}

void ShowClanMembers( const Character *ch, const char *argument, const char *format )
{
  MEMBER_LIST *members_list = NULL;
  MEMBER_DATA *member = NULL;
  const Clan *clan = NULL;
  int members = 0;

  for( members_list = first_member_list; members_list; members_list = members_list->next )
    {
      if( !StrCmp( members_list->name, argument ) )
        break;
    }

  if( !members_list )
    return;

  clan = GetClan( argument );

  if ( !clan  )
    return;

  PagerPrintf( ch, "\r\nMembers of %s\r\n", clan->name );
  PagerPrintf( ch,
                "------------------------------------------------------------\r\n" );
  PagerPrintf( ch, "Leader: %s\r\n", clan->leadership.leader );
  PagerPrintf( ch, "Number1: %s\r\n", clan->leadership.number1 );
  PagerPrintf( ch, "Number2: %s\r\n", clan->leadership.number2 );
  PagerPrintf( ch, "Spacecraft: %d  Vehicles: %d\r\n", clan->spacecraft, clan->vehicles );
  PagerPrintf( ch,
                "------------------------------------------------------------\r\n" );
  PagerPrintf( ch, "  Lvl         Name           Class   Kills  Deaths       Joined\r\n\r\n" );

  if( format && format[0] != '\0' )
    {
      if( !StrCmp( format, "kills" )
          || !StrCmp( format, "deaths" )
          || !StrCmp( format, "alpha" ))
        {
          MS_DATA *insert = NULL;
          MS_DATA *sort = NULL;
          MS_DATA *first_member = NULL;
          MS_DATA *last_member = NULL;

          AllocateMemory( sort, MS_DATA, 1 );
          sort->member = members_list->first_member;
          LINK( sort, first_member, last_member, next, prev );

          for( member = members_list->first_member->next; member; member = member->next )
            {
              insert = NULL;
              for( sort = first_member; sort; sort = sort->next )
                {
                  if( !StrCmp( format, "kills" ))
                    {
                      if( member->kills > sort->member->kills )
                        {
                          AllocateMemory( insert, MS_DATA, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }
                  else if( !StrCmp( format, "deaths" ))
                    {
                      if( member->deaths > sort->member->deaths )
                        {
                          AllocateMemory( insert, MS_DATA, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }
                  else if( !StrCmp( format, "alpha" ))
                    {
                      if( strcmp( member->name, sort->member->name ) < 0 )
                        {
                          AllocateMemory( insert, MS_DATA, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }

                }

              if( insert == NULL )
                {
                  AllocateMemory( insert, MS_DATA, 1 );
                  insert->member = member;
                  LINK( insert, first_member, last_member, next, prev );
                }
            }

          for( sort = first_member; sort; sort = sort->next )
	    {
	      if( StrCmp( sort->member->name, clan->leadership.leader )
		  && StrCmp( sort->member->name, clan->leadership.number1 )
		  && StrCmp( sort->member->name, clan->leadership.number2 ) )
		{
		  members++;
		  PagerPrintf( ch, "[%3d] %12s %15s %7d %7d %10s\r\n",
				sort->member->level,
				Capitalize(sort->member->name ),
				ability_name[sort->member->mclass],
				sort->member->kills,
				sort->member->deaths,
				sort->member->since );
		}
	    }
        }

      for( member = members_list->first_member; member; member = member->next )
        if( !StringPrefix( format, member->name ) )
          {
            members++;
            PagerPrintf( ch, "[%3d] %12s %15s %7d %7d %10s\r\n",
                          member->level,
                          Capitalize(member->name ),
                          ability_name[member->mclass],
                          member->kills,
                          member->deaths,
                          member->since );
          }

    }
  else
    {

      for( member = members_list->first_member; member; member = member->next )
        if( StrCmp( member->name, clan->leadership.leader ) && StrCmp( member->name, clan->leadership.number1 )
            && StrCmp( member->name, clan->leadership.number2 ) )
          {
            members++;
            PagerPrintf( ch, "[%3d] %12s %15s %7d %7d %10s\r\n",
                          member->level,
                          Capitalize(member->name),
                          ability_name[member->mclass],
                          member->kills,
                          member->deaths,
                          member->since );
          }
    }

  PagerPrintf( ch,
                "------------------------------------------------------------\r\n" );
  PagerPrintf( ch, "Total Members: %d\r\n", members);
  PagerPrintf( ch,
                "------------------------------------------------------------\r\n" );
}

void RemoveClanMember( const Character *ch )
{
  MEMBER_LIST   *members_list;
  MEMBER_DATA   *member;

  if( !ch->pcdata )
    return;

  for( members_list = first_member_list; members_list; members_list = members_list->next )
    {
      if( !StrCmp( members_list->name, ch->pcdata->ClanInfo.ClanName ) )
        for( member = members_list->first_member; member; member = member->next )
          {
            if( !StrCmp( member->name, ch->name ) )
              {
                UNLINK( member, members_list->first_member, members_list->last_member, next, prev );
                FreeMemory( member->name );
                FreeMemory( member->since );
                FreeMemory( member );
                SaveClanMemberList( members_list );
                break;
              }
          }
    }
}

void SaveClanMemberList( const MEMBER_LIST *members_list )
{
  MEMBER_DATA   *member;
  FILE          *fp;
  Clan    *clan;
  char         buf[MAX_STRING_LENGTH];

  if( !members_list )
    {
      Bug( "SaveClanMemberList: NULL members_list" );
      return;
    }

  if( ( clan = GetClan( members_list->name )) == NULL )
    {
      Bug( "SaveClanMemberList: no such clan: %s", members_list->name );
      return;
    }

  sprintf( buf, "%s%s.mem", CLAN_DIR, clan->filename );

  if( ( fp = fopen( buf, "w" ) ) == NULL )
    {
      Bug( "Cannot open clan.mem file for writing", 0 );
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

static void LoadClanMemberList( const Clan *clan )
{
  FILE *fp;
  char filename[MAX_STRING_LENGTH];
  MEMBER_LIST *members_list;

  AllocateMemory( members_list, MEMBER_LIST, 1 );

  sprintf( filename, "%s%s.mem", CLAN_DIR, clan->filename );

  if( ( fp = fopen( filename, "r" ) ) == NULL )
    {
      Bug( "%s: Cannot open member list %s for reading", __FUNCTION__, filename );

      LogPrintf( "No memberlist found, creating new list" );
      members_list->name = CopyString( clan->name );
      LINK( members_list, first_member_list, last_member_list, next, prev );
      SaveClanMemberList( members_list );

      return;
    }

  for( ; ; )
    {
      MEMBER_DATA *member;
      const char *word = ReadWord( fp );

      if( !StrCmp( word, "Name" ) )
        {
          members_list->name = ReadStringToTilde( fp );
          continue;
        }
      else if( !StrCmp( word, "Member" ) )
	{
	  AllocateMemory( member, MEMBER_DATA, 1 );
	  member->name = CopyString( ReadWord( fp ) );
	  member->since = CopyString( ReadWord( fp ) );
	  member->kills = ReadInt( fp );
	  member->deaths = ReadInt( fp );
	  member->level = ReadInt( fp );
	  member->mclass = ReadInt( fp );
	  LINK( member, members_list->first_member, members_list->last_member, next, prev );
	  continue;
	}
      else if( !StrCmp( word, "End" ) )
	{
	  LINK( members_list, first_member_list, last_member_list, next, prev );
	  fclose( fp );
	  return;
	}
      else
	{
	  Bug( "%s: bad section", __FUNCTION__ );
	  fclose( fp );
	  return;
	}
    }
}

void UpdateClanMember( const Character *ch )
{
  MEMBER_LIST *members_list;
  MEMBER_DATA *member;

  if( IsNpc( ch ) || IsImmortal(ch) || !ch->pcdata->ClanInfo.Clan )
    return;

  for( members_list = first_member_list; members_list; members_list = members_list->next )
    {
      if( !StrCmp( members_list->name, ch->pcdata->ClanInfo.ClanName ) )
	{
	  for( member = members_list->first_member; member; member = member->next )
	    {
	      if ( !StrCmp( member->name, ch->name ) )
		{
		  if( ch->pcdata->ClanInfo.Clan->clan_type == CLAN_PLAIN )
		    {
		      member->kills = ch->pcdata->pkills;
		      member->deaths = ch->pcdata->clones;
		    }
		  else
		    {
		      member->kills = ch->pcdata->pkills;
		      member->deaths = ch->pcdata->clones;
		    }

		  member->mclass = ch->ability.main;
		  member->level = ch->top_level;
		  return;
		}
	    }

	  if( member == NULL )
	    {
	      struct tm *t = localtime(&current_time);
	      char buf[MAX_STRING_LENGTH];

	      AllocateMemory( member, MEMBER_DATA, 1 );
	      member->name = CopyString( ch->name );
	      member->level = ch->top_level;
	      member->mclass = ch->ability.main;
	      sprintf( buf, "[%02d|%02d|%04d]", t->tm_mon+1, t->tm_mday, t->tm_year+1900 );
	      member->since = CopyString( buf );

	      if( ch->pcdata->ClanInfo.Clan->clan_type == CLAN_PLAIN )
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
	      SaveClanMemberList( members_list );
	    }
	}
    }
}
