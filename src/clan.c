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

#if 0
#define MAX_NEST 100
static Object *rgObjNest[MAX_NEST];
#endif

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
static bool MatchClan( Clan *clan, struct MatchClanUserData *userData );
void LoadClanStoreroom( const Clan *clan );
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

void SaveClan( const Clan *clan )
{
  NewSaveClan( clan, 0 );
}

#if 0
static bool MoveObjectFromSupermobToStoreroom( Object *object, Room *storeroom )
{
  ObjectFromCharacter( object );
  ObjectToRoom( object, storeroom );
  return true;
}
#endif

void LoadClanStoreroom( const Clan *clan )
{
#if 0
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
#endif
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
	  SaveClan( ch->pcdata->ClanInfo.Clan );
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

      SaveClan( ch->pcdata->ClanInfo.Clan );
    }
}

/*
 * Save items in a clan storage room                    -Scryn & Thoric
 */
void SaveClanStoreroom( Character *ch, const Clan *clan )
{
#if 0
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
#endif
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

const char *GetClanFilename( const Clan *clan )
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
  LuaSaveDataFile( fullPath, PushClan, "clan", clan );

  return true;
}

static void LoadOneMember( lua_State *L, ClanMemberList *memberList )
{
  int idx = lua_gettop( L );
  ClanMember *member = NULL;

  AllocateMemory( member, ClanMember, 1 );
  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "MemberSince" );
  lua_getfield( L, idx, "Ability" );
  lua_getfield( L, idx, "Level" );
  lua_getfield( L, idx, "PlayerKills" );
  lua_getfield( L, idx, "PlayerDeaths" );

  if( !lua_isnil( L, ++idx ) )
    {
      member->name = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->since = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->mclass = GetAbility( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->level = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->kills = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->deaths = lua_tointeger( L, idx );
    }

  LINK( member, memberList->first_member, memberList->last_member, next, prev );
  lua_pop( L, 6 );
}

static void LoadMembers( lua_State *L, const Clan *clan )
{
  ClanMemberList *memberList = NULL;
  int idx = lua_gettop( L );

  AllocateMemory( memberList, ClanMemberList, 1 );
  memberList->name = CopyString( clan->Name );
  LINK( memberList, first_ClanMemberList, last_ClanMemberList, next, prev );

  lua_getfield( L, idx, "Members" );

  if( !lua_isnil( L, ++idx ) )
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
	{
	  LoadOneMember( L, memberList );
	  lua_pop( L, 1 );
	}
    }

  lua_pop( L, 1 );
}

static void LoadStoreroom( lua_State *L, Clan *clan )
{

}

static int L_ClanEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int topAfterGets = 0;
  Clan *clan = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "Name" );

  if( !lua_isnil( L, ++idx ) )
    {
      AllocateMemory( clan, Clan, 1 );
      clan->Name = CopyString( lua_tostring( L, idx ) );
      LogPrintf( "Loading %s", clan->Name );
    }
  else
    {
      Bug( "%s: Found clan without name!", __FUNCTION__ );
      lua_pop( L, 1 );
      return 0;
    }

  lua_getfield( L, idx, "MainClan" );
  lua_getfield( L, idx, "Description" );
  lua_getfield( L, idx, "PlayerKills" );
  lua_getfield( L, idx, "PlayerDeaths" );
  lua_getfield( L, idx, "MobKills" );
  lua_getfield( L, idx, "MobDeaths" );
  lua_getfield( L, idx, "Type" );
  lua_getfield( L, idx, "BoardVnum" );
  lua_getfield( L, idx, "StoreroomVnum" );
  lua_getfield( L, idx, "Funds" );
  lua_getfield( L, idx, "NumberOfSpacecraft" );
  lua_getfield( L, idx, "NumberOfVehicles" );
  lua_getfield( L, idx, "JailVnum" );
  lua_getfield( L, idx, "EnlistRoom1Vnum" );
  lua_getfield( L, idx, "EnlistRoom2Vnum" );
  lua_getfield( L, idx, "Leader" );
  lua_getfield( L, idx, "Number1" );
  lua_getfield( L, idx, "Number2" );

  topAfterGets = lua_gettop( L );

  if( !lua_isnil( L, ++idx ) )
    {
      clan->tmpstr = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->tmpstr = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->description = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->description = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->pkills = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->pdeaths = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->mkills = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->mdeaths = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->clan_type = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->board = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->storeroom = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->funds = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->spacecraft = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->vehicles = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->jail = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->enlistroom1 = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->enlistroom2 = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->leadership.leader = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->leadership.leader = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->leadership.number1 = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->leadership.number1 = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->leadership.number2 = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->leadership.number2 = CopyString( "" );
    }

  lua_pop( L, topAfterGets - topAtStart );

  AddClan( clan );
  LoadMembers( L, clan );
  LoadStoreroom( L, clan );

  return 0;
}

static void ExecuteClanFile( const char *filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ClanEntry, "ClanEntry" );
}

void NewLoadClans( void )
{
  ForEachLuaFileInDir( CLAN_DIR, ExecuteClanFile, NULL );

  ForEach( Clan, first_clan, next, AssignSubclanToMainclan, NULL );
}

int CountClanMembers( const Clan *clan )
{
  ClanMemberList *memberList = GetMemberList( clan );
  ClanMember *member = NULL;
  int counter = 0;

  for( member = memberList->first_member; member; member = member->next )
    {
      ++counter;
    }

  return counter;
}
