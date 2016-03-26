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
#include "script.h"

#define MAX_NEST 100
static Object *rgObjNest[MAX_NEST];

Clan *first_clan = NULL;
Clan *last_clan = NULL;

ClanMemberList *first_ClanMemberList = NULL;
ClanMemberList *last_ClanMemberList = NULL;

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
static ClanMember *GetMemberData( const ClanMemberList*, const char *memberName );

/*
 * Get pointer to clan structure from clan name.
 */
Clan *GetClan( const char *name )
{
  struct MatchClanUserData userData;

  if( IsNullOrEmpty( name ) )
    {
      return NULL;
    }

  userData.Clan = NULL;
  userData.Name = name;
  
  ForEach( Clan, first_clan, next, MatchClan, &userData );

  return userData.Clan;
}

static bool MatchClan( Clan *clan, struct MatchClanUserData *userData )
{
  if( !StrCmp( userData->Name, clan->Name ) )
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

  if ( IsNullOrEmpty( clan->filename ) )
    {
      sprintf( buf, "SaveClan: %s has no filename", clan->Name );
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
      fprintf( fp, "Name         %s~\n", clan->Name              );
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
      fprintf( fp, "Funds        %ld\n", clan->funds             );
      fprintf( fp, "Enlist1      %ld\n",  clan->enlistroom1       );
      fprintf( fp, "Enlist2      %ld\n",  clan->enlistroom2       );
      fprintf( fp, "Jail         %ld\n",  clan->jail              );

      if ( clan->mainclan )
	{
	  fprintf( fp, "MainClan     %s~\n",      clan->mainclan->Name    );
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
              if (!clan->Name)
		{
		  clan->Name = CopyString( "" );
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
          KEY( "Name",      clan->Name,    ReadStringToTilde( fp ) );
          KEY( "NumberOne", clan->leadership.number1, ReadStringToTilde( fp ) );
          KEY( "NumberTwo", clan->leadership.number2, ReadStringToTilde( fp ) );
          break;

        case 'P':
          KEY( "PDeaths",   clan->pdeaths, ReadInt( fp ) );
          KEY( "PKills",    clan->pkills,  ReadInt( fp ) );
          break;

        case 'S':
          KEY( "Storeroom", clan->storeroom, ReadInt( fp ) );
          break;

        case 'T':
          KEY( "Type", clan->clan_type, ReadInt( fp ) );
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
  Clan *clan = AllocateClan();
  FILE *fp = NULL;
  bool found = false;

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
      AddClan( clan );

      LoadClanMemberList( clan );
      LoadClanStoreroom( clan );
    }
  else
    {
      FreeClan( clan );
    }

  return found;
}

static bool MoveObjectFromSupermobToStoreroom( Object *object, Room *storeroom )
{
  ObjectFromCharacter( object );
  ObjectToRoom( object, storeroom );
  return true;
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
	      Bug( "%s: # not found (%s)", __FUNCTION__, clan->Name );
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
	      Bug( "%s: bad section (%s)", __FUNCTION__, clan->Name );
	      break;
	    }
	}

      fclose( fp );

      ForEach( Object, supermob->first_carrying, next_content,
	       MoveObjectFromSupermobToStoreroom, storeroom );
      ReleaseSupermob();
    }
  else
    {
      LogPrintf( "Cannot open clan vault" );
    }
}

bool AssignSubclanToMainclan( Clan *subclan, void *unused )
{
  Clan *mainclan = GetClan( subclan->tmpstr );

  if ( mainclan )
    {
      LINK( subclan, mainclan->first_subclan, mainclan->last_subclan, next_subclan, prev_subclan );
      subclan->mainclan = mainclan;
      LogPrintf( " Assigning subclan %s to mainclan %s.", subclan->Name, mainclan->Name );
    }

  return true;
}

/*
 * Load in all the clan files.
 */
void LoadClans( void )
{
  FILE *fpList = NULL;
  char clanlist[256];

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
  LogPrintf( " Done clans\r\n" );
  LogPrintf( " Sorting clans" );

  ForEach( Clan, first_clan, next, AssignSubclanToMainclan, NULL );

  LogPrintf(" Done sorting" );
}

ClanMemberList *GetMemberList( const Clan *clan )
{
  ClanMemberList *members_list = NULL;

  if( clan )
    {
      for( members_list = first_ClanMemberList; members_list; members_list = members_list->next )
	{
	  if( !StrCmp( members_list->name, clan->Name ) )
	    {
	      break;
	    }
	}
    }

  return members_list;
}

void ShowClanMembers( const Character *ch, const char *clanName, const char *format )
{
  const Clan *clan = GetClan( clanName );
  ClanMemberList *members_list = GetMemberList( clan );
  ClanMember *member = NULL;
  int members = 0;

  if( !clan || !members_list )
    return;

  PagerPrintf( ch, "\r\nMembers of %s\r\n", clan->Name );
  PagerPrintf( ch,
                "------------------------------------------------------------\r\n" );
  PagerPrintf( ch, "Leader: %s\r\n", clan->leadership.leader );
  PagerPrintf( ch, "Number1: %s\r\n", clan->leadership.number1 );
  PagerPrintf( ch, "Number2: %s\r\n", clan->leadership.number2 );
  PagerPrintf( ch, "Spacecraft: %d  Vehicles: %d\r\n", clan->spacecraft, clan->vehicles );
  PagerPrintf( ch,
                "------------------------------------------------------------\r\n" );
  PagerPrintf( ch, "  Lvl         Name           Class   Kills  Deaths       Joined\r\n\r\n" );

  if( !IsNullOrEmpty( format ) )
    {
      if( !StrCmp( format, "kills" )
          || !StrCmp( format, "deaths" )
          || !StrCmp( format, "alpha" ))
        {
          SortedClanMemberListEntry *sort = NULL;
          SortedClanMemberListEntry *first_member = NULL;
          SortedClanMemberListEntry *last_member = NULL;

          AllocateMemory( sort, SortedClanMemberListEntry, 1 );
          sort->member = members_list->first_member;
          LINK( sort, first_member, last_member, next, prev );

          for( member = members_list->first_member->next; member; member = member->next )
            {
              SortedClanMemberListEntry *insert = NULL;

              for( sort = first_member; sort; sort = sort->next )
                {
                  if( !StrCmp( format, "kills" ))
                    {
                      if( member->kills > sort->member->kills )
                        {
                          AllocateMemory( insert, SortedClanMemberListEntry, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }
                  else if( !StrCmp( format, "deaths" ))
                    {
                      if( member->deaths > sort->member->deaths )
                        {
                          AllocateMemory( insert, SortedClanMemberListEntry, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }
                  else if( !StrCmp( format, "alpha" ))
                    {
                      if( strcmp( member->name, sort->member->name ) < 0 )
                        {
                          AllocateMemory( insert, SortedClanMemberListEntry, 1 );
                          insert->member = member;
                          INSERT( insert, sort, first_member, next, prev );
                          break;
                        }
                    }

                }

              if( insert == NULL )
                {
                  AllocateMemory( insert, SortedClanMemberListEntry, 1 );
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
				AbilityName[sort->member->mclass],
				sort->member->kills,
				sort->member->deaths,
				sort->member->since );
		}
	    }

	  while( first_member )
	    {
	      SortedClanMemberListEntry *sortedMember = first_member;
	      first_member = sortedMember->next;
	      FreeMemory( sortedMember );
	    }
        }

      for( member = members_list->first_member; member; member = member->next )
	{
	  if( !StringPrefix( format, member->name ) )
	    {
	      members++;
	      PagerPrintf( ch, "[%3d] %12s %15s %7d %7d %10s\r\n",
			   member->level,
			   Capitalize(member->name ),
			   AbilityName[member->mclass],
			   member->kills,
			   member->deaths,
			   member->since );
	    }
	}
    }
  else
    {
      for( member = members_list->first_member; member; member = member->next )
	{
	  if( StrCmp( member->name, clan->leadership.leader ) && StrCmp( member->name, clan->leadership.number1 )
	      && StrCmp( member->name, clan->leadership.number2 ) )
	    {
	      members++;
	      PagerPrintf( ch, "[%3d] %12s %15s %7d %7d %10s\r\n",
			   member->level,
			   Capitalize(member->name),
			   AbilityName[member->mclass],
			   member->kills,
			   member->deaths,
			   member->since );
	    }
	}
    }

  PagerPrintf( ch, "------------------------------------------------------------\r\n" );
  PagerPrintf( ch, "Total Members: %d\r\n", members );
  PagerPrintf( ch, "------------------------------------------------------------\r\n" );
}

void RemoveClanMember( const Character *ch )
{
  ClanMemberList *members_list;

  if( !ch->pcdata )
    {
      return;
    }

  members_list = GetMemberList( ch->pcdata->ClanInfo.Clan );

  if( members_list )
    {
      ClanMember *member = GetMemberData( members_list, ch->name );

      if( member )
	{
	  UNLINK( member, members_list->first_member, members_list->last_member, next, prev );
	  FreeMemory( member->name );
	  FreeMemory( member->since );
	  FreeMemory( member );
	  SaveClanMemberList( members_list );
	}
    }
}

void SaveClanMemberList( const ClanMemberList *members_list )
{
  ClanMember *member;
  FILE *fp;
  Clan *clan;
  char buf[MAX_STRING_LENGTH];

  if( !members_list )
    {
      Bug( "%s: NULL members_list", __FUNCTION__ );
      return;
    }

  if( ( clan = GetClan( members_list->name )) == NULL )
    {
      Bug( "%s: no such clan: %s", __FUNCTION__, members_list->name );
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
    {
      fprintf( fp, "Member        %s %s %d %d %d %d\n",
	       member->name, member->since, member->kills, member->deaths, member->level, member->mclass);
    }

  fprintf( fp, "End\n\n" );
  fclose( fp );
}

static void LoadClanMemberList( const Clan *clan )
{
  FILE *fp = NULL;
  char filename[MAX_STRING_LENGTH];
  ClanMemberList *members_list = NULL;

  AllocateMemory( members_list, ClanMemberList, 1 );

  sprintf( filename, "%s%s.mem", CLAN_DIR, clan->filename );

  if( ( fp = fopen( filename, "r" ) ) == NULL )
    {
      Bug( "%s: Cannot open member list %s for reading", __FUNCTION__, filename );

      LogPrintf( "No memberlist found, creating new list" );
      members_list->name = CopyString( clan->Name );
      LINK( members_list, first_ClanMemberList, last_ClanMemberList, next, prev );
      SaveClanMemberList( members_list );

      return;
    }

  for( ; ; )
    {
      ClanMember *member = NULL;
      const char *word = ReadWord( fp );

      if( !StrCmp( word, "Name" ) )
        {
          members_list->name = ReadStringToTilde( fp );
          continue;
        }
      else if( !StrCmp( word, "Member" ) )
	{
	  AllocateMemory( member, ClanMember, 1 );
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
	  LINK( members_list, first_ClanMemberList, last_ClanMemberList, next, prev );
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
  ClanMemberList *members_list = NULL;

  if( IsNpc( ch ) || IsImmortal(ch) || !IsClanned( ch ) )
    {
      return;
    }

  members_list = GetMemberList( ch->pcdata->ClanInfo.Clan );

  if( members_list )
    {
      ClanMember *member = GetMemberData( members_list, ch->name );

      if( member )
	{
	  member->kills = ch->pcdata->pkills;
	  member->deaths = ch->pcdata->clones;
	  member->mclass = ch->ability.main;
	  member->level = ch->top_level;
	}
      else
	{
	  struct tm *t = localtime(&current_time);
	  char buf[MAX_STRING_LENGTH];

	  AllocateMemory( member, ClanMember, 1 );
	  member->name = CopyString( ch->name );
	  member->level = ch->top_level;
	  member->mclass = ch->ability.main;
	  sprintf( buf, "[%02d|%02d|%04d]", t->tm_mon+1, t->tm_mday, t->tm_year+1900 );
	  member->since = CopyString( buf );
	  member->kills = ch->pcdata->pkills;
	  member->deaths = ch->pcdata->clones;

	  LINK( member, members_list->first_member, members_list->last_member, next, prev );
	}

      SaveClanMemberList( members_list );
    }
}

/*
 * Save items in a clan storage room                    -Scryn & Thoric
 */
void SaveClanStoreroom( Character *ch, const Clan *clan )
{
  FILE *fp;
  char filename[256];

  if ( !clan )
    {
      Bug( "%s: Null clan pointer!", __FUNCTION__ );
      return;
    }

  if ( !ch )
    {
      Bug("%s: Null ch pointer!", __FUNCTION__ );
      return;
    }

  sprintf( filename, "%s%s.vault", CLAN_DIR, clan->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "%s: fopen", __FUNCTION__ );
      perror( filename );
    }
  else
    {
      short templvl = ch->top_level;
      const Object *contents = ch->in_room->last_content;

      ch->top_level = LEVEL_AVATAR;               /* make sure EQ doesn't get lost */

      if (contents)
	{
	  WriteObject(ch, contents, fp, 0, OS_CARRY );
	}

      fprintf( fp, "#END\n" );
      ch->top_level = templvl;
      fclose( fp );
    }
}

static ClanMember *GetMemberData( const ClanMemberList *clanMemberList, const char *memberName )
{
  ClanMember *member = NULL;

  for( member = clanMemberList->first_member; member; member = member->next )
    {
      if ( !StrCmp( member->name, memberName ) )
	{
	  break;
	}
    }

  return member;
}

Clan *AllocateClan( void )
{
  Clan *clan = NULL;
  AllocateMemory( clan, Clan, 1 );

  return clan;
}

void FreeClan( Clan *clan )
{
  if( clan->filename )
    {
      FreeMemory( clan->filename );
    }

  if( clan->Name )
    {
      FreeMemory( clan->Name );
    }

  if( clan->description )
    {
      FreeMemory( clan->description );
    }

  if( clan->tmpstr )
    {
      FreeMemory( clan->tmpstr );
    }

  if( clan->leadership.leader )
    {
      FreeMemory( clan->leadership.leader );
    }

  if( clan->leadership.number1 )
    {
      FreeMemory( clan->leadership.number1 );
    }

  if( clan->leadership.number2 )
    {
      FreeMemory( clan->leadership.number2 );
    }

  FreeMemory( clan );
}

void AddClan( Clan *clan )
{
  LINK( clan, first_clan, last_clan, next, prev );
}

void UnlinkClan( Clan *clan )
{
  UNLINK( clan, first_clan, last_clan, next, prev );
}

void NewLoadClans( void )
{

}

static const char *GetClanFilename( const Clan *clan )
{
  size_t n = 0;
  static char buf[MAX_STRING_LENGTH];
  strcpy( buf, StringToLowercase( clan->Name ) );

  for( n = 0; n < strlen( buf ); ++n )
    {
      if( buf[n] == ' ' )
        {
          buf[n] = '_';
        }
    }

  return buf;
}

static void PushMember( lua_State *L, const ClanMember *member, int idx )
{
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", member->name );
  LuaSetfieldString( L, "MemberSince", member->since );
  LuaSetfieldString( L, "Ability", AbilityName[member->mclass] );
  LuaSetfieldNumber( L, "Level", member->level );
  LuaSetfieldNumber( L, "PlayerDeaths", member->deaths );
  LuaSetfieldNumber( L, "PlayerKills", member->kills );

  lua_settable( L, -3 );
}

static void PushMembers( lua_State *L, const Clan *clan )
{
  const ClanMemberList *memberList = GetMemberList( clan );

  if( memberList )
    {
      const ClanMember *member = NULL;
      int idx = 0;
      lua_pushstring( L, "Members" );
      lua_newtable( L );

      for( member = memberList->first_member; member; member = member->next )
	{
	  PushMember( L, member, ++idx );
	}

      lua_settable( L, -3 );
    }
}

static void PushClan( lua_State *L, const void *userData )
{
  const Clan *clan = (const Clan*) userData;
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", clan->Name );

  if( clan->mainclan )
    {
      LuaSetfieldString( L, "MainClan", clan->mainclan->Name );
    }

  if( !IsNullOrEmpty( clan->description ) )
    {
      LuaSetfieldString( L, "Description", clan->description );
    }

  LuaSetfieldNumber( L, "PlayerKills", clan->pkills );
  LuaSetfieldNumber( L, "PlayerDeaths", clan->pdeaths );
  LuaSetfieldNumber( L, "MobKills", clan->mkills );
  LuaSetfieldNumber( L, "MobDeaths", clan->mdeaths );
  LuaSetfieldNumber( L, "Type", clan->clan_type );

  if( clan->board != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "BoardVnum", clan->board );
    }

  if( clan->storeroom != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "StoreroomVnum", clan->storeroom );
    }

  LuaSetfieldNumber( L, "Funds", clan->funds );
  LuaSetfieldNumber( L, "NumberOfSpacecraft", clan->spacecraft );
  LuaSetfieldNumber( L, "NumberOfVehicles", clan->vehicles );

  if( clan->jail != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "JailVnum", clan->jail );
    }

  if( clan->enlistroom1 != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "EnlistRoom1Vnum", clan->enlistroom1 );
    }

  if( clan->enlistroom2 != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "EnlistRoom2Vnum", clan->enlistroom2 );
    }

  LuaSetfieldString( L, "Leader", clan->leadership.leader );
  LuaSetfieldString( L, "Number1", clan->leadership.number1 );
  LuaSetfieldString( L, "Number2", clan->leadership.number2 );

  PushMembers( L, clan );

  lua_setglobal( L, "clan" );
}

bool NewSaveClan( const Clan *clan, int dummy )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s.lua", CLAN_DIR, GetClanFilename( clan ) );
  LogPrintf( "%s", fullPath );

  LuaSaveDataFile( fullPath, PushClan, "clan", clan );

  return true;
}
