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

#include <cctype>
#include <cstring>
#include <ctime>
#include <cassert>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "script.hpp"
#include "pcdata.hpp"
#include "log.hpp"

#if 0
#define MAX_NEST 100
static Object *rgObjNest[MAX_NEST];
#endif

ClanRepository *Clans = nullptr;

ClanMemberList *FirstClanMemberList = nullptr;
ClanMemberList *LastClanMemberList = nullptr;

/* local routines */
/*static void LoadClanStoreroom( const Clan *clan );*/
static ClanMember *GetMemberData( const ClanMemberList*, const char *memberName );

/*
 * Get pointer to clan structure from clan name.
 */
Clan *GetClan( const std::string &name )
{
  return Clans->Find([name](const auto &clan)
                         {
                           return StrCmp(clan->Name, name) == 0;
                         });
}

#if 0
static bool MoveObjectFromSupermobToStoreroom( Object *object, Room *storeroom )
{
  ObjectFromCharacter( object );
  ObjectToRoom( object, storeroom );
  return true;
}
#endif

#if 0
static void LoadClanStoreroom( const Clan *clan )
{
  char filename[256];
  FILE *fp = NULL;
  Room *storeroom = NULL;

  if ( clan->Storeroom == INVALID_VNUM
       || (storeroom = GetRoom( clan->Storeroom )) == NULL )
    {
      Log->Bug( "Storeroom for clan %s not found.", clan->Name );
      return;
    }

  sprintf( filename, "%s%s.vault", CLAN_DIR, clan->filename );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      int iNest = 0;

      Log->Info( "Loading clan storage room" );
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
	      Log->Bug( "%s: # not found (%s)", __FUNCTION__, clan->Name );
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
	      Log->Bug( "%s: bad section (%s)", __FUNCTION__, clan->Name );
	      break;
	    }
	}

      fclose( fp );

      ForEach( Object, supermob->FirstCarrying, NextContent,
	       MoveObjectFromSupermobToStoreroom, storeroom );
      ReleaseSupermob();
    }
  else
    {
      Log->Bug( "Cannot open clan vault for %s", clan->Name );
    }
}
#endif

void AssignGuildToMainclan(Clan *guild)
{
  Clan *mainClan = GetClan(guild->tmpstr);
  AssignGuildToMainclan(guild, mainClan);
}

void AssignGuildToMainclan( Clan *guild, Clan *mainClan )
{
  if ( mainClan )
    {
      guild->Type = CLAN_GUILD;
      mainClan->Subclans.push_back(guild);
      guild->MainClan = mainClan;
    }
}

ClanMemberList *GetMemberList( const Clan *clan )
{
  ClanMemberList *members_list = NULL;

  if( clan )
    {
      for( members_list = FirstClanMemberList; members_list; members_list = members_list->Next )
	{
	  if( !StrCmp( members_list->Name, clan->Name ) )
	    {
	      break;
	    }
	}
    }

  return members_list;
}

static int MoreKillsThan(const ClanMember *lhv, const ClanMember *rhv)
{
  return lhv->Kills > rhv->Kills ? -1 : lhv->Kills < rhv->Kills ? 1 : 0;
}

static int MoreDeathsThan(const ClanMember *lhv, const ClanMember *rhv)
{
  return lhv->Deaths > rhv->Deaths ? -1 : lhv->Deaths < rhv->Deaths ? 1 : 0;
}

static int LessName(const ClanMember *lhv, const ClanMember *rhv)
{
  return StrCmp(lhv->Name, rhv->Name);
}

void ShowClanMembers( const Character *ch, const std::string &clanName, const std::string &format )
{
  const Clan *clan = GetClan( clanName );
  ClanMemberList *members_list = GetMemberList( clan );
  int members = 0;

  assert(clan != NULL);
  assert(members_list != NULL);

  ch->Echo( "\r\nMembers of %s\r\n", clan->Name );
  ch->Echo( "------------------------------------------------------------------------------\r\n" );
  ch->Echo( "Leader: %s\r\n", clan->Leadership.Leader );
  ch->Echo( "Number1: %s\r\n", clan->Leadership.Number1 );
  ch->Echo( "Number2: %s\r\n", clan->Leadership.Number2 );
  ch->Echo( "Spacecraft: %d  Vehicles: %d\r\n", clan->Spacecraft, clan->Vehicles );
  ch->Echo( "------------------------------------------------------------------------------\r\n" );
  ch->Echo( "Lvl  Name            Class                 Kills    Deaths              Joined\r\n\r\n" );

  if( !format.empty() )
    {
      if( !StrCmp( format, "kills" )
          || !StrCmp( format, "deaths" )
          || !StrCmp( format, "alpha" ))
        {
          std::list<const ClanMember*> sortedList;

          for( const ClanMember *member = members_list->FirstMember->Next; member; member = member->Next )
            {
              if( StrCmp( member->Name, clan->Leadership.Leader ) != 0
                  && StrCmp( member->Name, clan->Leadership.Number1 ) != 0
                  && StrCmp( member->Name, clan->Leadership.Number2 ) != 0 )
                {
                  sortedList.push_back(member);
                }
            }

          if( !StrCmp( format, "kills" ))
            {
              sortedList.sort(MoreKillsThan);
            }
          else if( !StrCmp( format, "deaths" ))
            {
              sortedList.sort(MoreDeathsThan);
            }
          else if( !StrCmp( format, "alpha" ))
            {
              sortedList.sort(LessName);
            }

          for(const ClanMember *member : sortedList)
            {
              members++;
              ch->Echo( "%3d  %-15s %-17s %9d %9d %19s\r\n",
                        member->Level,
                        Capitalize(member->Name ),
                        AbilityName[member->Ability],
                        member->Kills,
                        member->Deaths,
                        FormatDate( &member->Since ) );
	    }
        }
      else
        {
          const ClanMember *member = NULL;

          for( member = members_list->FirstMember; member; member = member->Next )
            {
              if( !StringPrefix( format, member->Name ) )
                {
                  members++;
                  ch->Echo( "%3d  %-15s %-17s %9d %9d %19s\r\n",
                            member->Level,
                            Capitalize(member->Name ),
                            AbilityName[member->Ability],
                            member->Kills,
                            member->Deaths,
                            FormatDate( &member->Since ) );
                }
            }
        }
    }
  else
    {
      const ClanMember *member = NULL;

      for( member = members_list->FirstMember; member; member = member->Next )
	{
	  members++;
	  ch->Echo( "%3d  %-15s %-17s %9d %9d %19s\r\n",
                    member->Level,
                    Capitalize(member->Name),
                    AbilityName[member->Ability],
                    member->Kills,
                    member->Deaths,
                    FormatDate( &member->Since ) );
	}
    }

  ch->Echo( "------------------------------------------------------------------------------\r\n" );
  ch->Echo( "Total Members: %d\r\n", members );
  ch->Echo( "------------------------------------------------------------------------------\r\n" );
}

void RemoveClanMember( const Character *ch )
{
  if( !ch->PCData )
    {
      return;
    }

  ClanMemberList *members_list = GetMemberList( ch->PCData->ClanInfo.Clan );

  if( members_list )
    {
      ClanMember *member = GetMemberData( members_list, ch->Name );

      if( member )
	{
	  UNLINK( member, members_list->FirstMember, members_list->LastMember, Next, Previous );
	  FreeMemory( member->Name );
	  delete member;
	  Clans->Save( ch->PCData->ClanInfo.Clan );
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

  members_list = GetMemberList( ch->PCData->ClanInfo.Clan );

  if( members_list )
    {
      ClanMember *member = GetMemberData( members_list, ch->Name );

      if( !member )
	{
          member = new ClanMember();
	  member->Name = CopyString( ch->Name );
	  member->Since = current_time;

	  LINK( member, members_list->FirstMember, members_list->LastMember, Next, Previous );
	}

      member->Kills = ch->PCData->PKills;
      member->Deaths = ch->PCData->Clones;
      member->Ability = ch->Ability.Main;
      member->Level = ch->TopLevel;
      member->LastActivity = current_time;
      
      Clans->Save( ch->PCData->ClanInfo.Clan );
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
      Log->Bug( "%s: Null clan pointer!", __FUNCTION__ );
      return;
    }

  if ( !ch )
    {
      Log->Bug("%s: Null ch pointer!", __FUNCTION__ );
      return;
    }

  sprintf( filename, "%s%s.vault", CLAN_DIR, clan->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Log->Bug( "%s: fopen", __FUNCTION__ );
      perror( filename );
    }
  else
    {
      short templvl = ch->TopLevel;
      const Object *contents = ch->InRoom->last_content;

      ch->TopLevel = LEVEL_AVATAR;               /* make sure EQ doesn't get lost */

      if (contents)
	{
	  WriteObject(ch, contents, fp, 0, OS_CARRY );
	}

      fprintf( fp, "#END\n" );
      ch->TopLevel = templvl;
      fclose( fp );
    }
#endif
}

static ClanMember *GetMemberData( const ClanMemberList *clanMemberList, const char *memberName )
{
  ClanMember *member = NULL;

  for( member = clanMemberList->FirstMember; member; member = member->Next )
    {
      if ( !StrCmp( member->Name, memberName ) )
	{
	  break;
	}
    }

  return member;
}

Clan *AllocateClan( void )
{
  Clan *clan = new Clan();
  return clan;
}

void FreeClan( Clan *clan )
{
  if( clan->Name )
    {
      FreeMemory( clan->Name );
    }

  if( clan->Description )
    {
      FreeMemory( clan->Description );
    }

  if( clan->tmpstr )
    {
      FreeMemory( clan->tmpstr );
    }

  if( clan->Leadership.Leader )
    {
      FreeMemory( clan->Leadership.Leader );
    }

  if( clan->Leadership.Number1 )
    {
      FreeMemory( clan->Leadership.Number1 );
    }

  if( clan->Leadership.Number2 )
    {
      FreeMemory( clan->Leadership.Number2 );
    }

  delete clan;
}

void AddClan( Clan *clan )
{
  Clans->Add(clan);
}

void RemoveClan( Clan *clan )
{
  Clans->Remove(clan);
}

static void PushMember( lua_State *L, const ClanMember *member, int idx )
{
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", member->Name );
  LuaSetfieldNumber( L, "MemberSince", member->Since );
  LuaSetfieldString( L, "Ability", AbilityName[member->Ability] );
  LuaSetfieldNumber( L, "Level", member->Level );
  LuaSetfieldNumber( L, "Deaths", member->Deaths );
  LuaSetfieldNumber( L, "Kills", member->Kills );
  LuaSetfieldNumber( L, "LastActivity", member->LastActivity );
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

      for( member = memberList->FirstMember; member; member = member->Next )
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

  if( clan->MainClan )
    {
      LuaSetfieldString( L, "MainClan", clan->MainClan->Name );
    }

  if( !IsNullOrEmpty( clan->Description ) )
    {
      LuaSetfieldString( L, "Description", clan->Description );
    }

  LuaSetfieldNumber( L, "PlayerKills", clan->PlayerKills );
  LuaSetfieldNumber( L, "PlayerDeaths", clan->PlayerDeaths );
  LuaSetfieldNumber( L, "MobKills", clan->MobKills );
  LuaSetfieldNumber( L, "MobDeaths", clan->MobDeaths );
  LuaSetfieldNumber( L, "Type", clan->Type );

  if( clan->Board != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "BoardVnum", clan->Board );
    }

  if( clan->Storeroom != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "StoreroomVnum", clan->Storeroom );
    }

  LuaSetfieldNumber( L, "Funds", clan->Funds );

  if( clan->Jail != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "JailVnum", clan->Jail );
    }

  if( clan->EnlistRoom1 != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "EnlistRoom1Vnum", clan->EnlistRoom1 );
    }

  if( clan->EnlistRoom2 != INVALID_VNUM )
    {
      LuaSetfieldNumber( L, "EnlistRoom2Vnum", clan->EnlistRoom2 );
    }

  LuaSetfieldString( L, "Leader", clan->Leadership.Leader );
  LuaSetfieldString( L, "Number1", clan->Leadership.Number1 );
  LuaSetfieldString( L, "Number2", clan->Leadership.Number2 );
  LuaSetfieldNumber( L, "FoundationDate", clan->FoundationDate );
  
  PushMembers( L, clan );

  lua_setglobal( L, "clan" );
}

const char *GetClanFilename( const Clan *clan )
{
  static char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", CLAN_DIR, ConvertToLuaFilename( clan->Name ) );

  return fullPath;
}

static void LoadOneMember( lua_State *L, ClanMemberList *memberList )
{
  int idx = lua_gettop( L );
  ClanMember *member = new ClanMember();

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "MemberSince" );
  lua_getfield( L, idx, "Ability" );
  lua_getfield( L, idx, "Level" );
  lua_getfield( L, idx, "Kills" );
  lua_getfield( L, idx, "Deaths" );
  lua_getfield( L, idx, "LastActivity" );
  
  if( !lua_isnil( L, ++idx ) )
    {
      member->Name = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->Since = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->Ability = GetAbility( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->Level = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->Kills = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->Deaths = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      member->LastActivity = lua_tointeger( L, idx );
    }
  
  LINK( member, memberList->FirstMember, memberList->LastMember, Next, Previous );
  lua_pop( L, 7 );
}

static void LoadMembers( lua_State *L, const Clan *clan )
{
  ClanMemberList *memberList = new ClanMemberList();
  int idx = lua_gettop( L );

  memberList->Name = CopyString( clan->Name );
  LINK( memberList, FirstClanMemberList, LastClanMemberList, Next, Previous );

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
  lua_getfield( L, idx, "JailVnum" );
  lua_getfield( L, idx, "EnlistRoom1Vnum" );
  lua_getfield( L, idx, "EnlistRoom2Vnum" );
  lua_getfield( L, idx, "Leader" );
  lua_getfield( L, idx, "Number1" );
  lua_getfield( L, idx, "Number2" );
  lua_getfield( L, idx, "FoundationDate" );
  
  topAfterGets = lua_gettop( L );

 if( !lua_isnil( L, ++idx ) )
    {
      clan = AllocateClan();
      clan->Name = CopyString( lua_tostring( L, idx ) );
      Log->Info( "Loading %s", clan->Name );
    }
  else
    {
      Log->Bug( "%s: Found clan without name!", __FUNCTION__ );
      lua_pop( L, topAfterGets - topAtStart );
      return 0;
    }
  
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
      clan->Description = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->Description = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->PlayerKills = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->PlayerDeaths = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->MobKills = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->MobDeaths = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Type = (ClanType) lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Board = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Storeroom = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Funds = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Jail = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->EnlistRoom1 = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->EnlistRoom2 = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Leadership.Leader = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->Leadership.Leader = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Leadership.Number1 = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->Leadership.Number1 = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Leadership.Number2 = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      clan->Leadership.Number2 = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->FoundationDate = lua_tointeger( L, idx );
    }
  
  lua_pop( L, topAfterGets - topAtStart );

  AddClan( clan );
  LoadMembers( L, clan );
  LoadStoreroom( L, clan );

  return 0;
}

static void ExecuteClanFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ClanEntry, "ClanEntry" );
}

size_t CountClanMembers( const Clan *clan )
{
  ClanMemberList *memberList = GetMemberList( clan );
  ClanMember *member = NULL;
  size_t counter = 0;

  for( member = memberList->FirstMember; member; member = member->Next )
    {
      ++counter;
    }

  return counter;
}

bool IsBountyHuntersGuild(const std::string &clanName)
{
  return !StrCmp(clanName, "the hunters guild")
    || !StrCmp(clanName, "the bounty hunters guild")
    || !StrCmp(clanName, "the assassins guild");
}

/////////////////////////////////////////////////////
class LuaClanRepository : public ClanRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Clan*) const override;
};

void LuaClanRepository::Load()
{
  ForEachLuaFileInDir( CLAN_DIR, ExecuteClanFile, NULL );

  for(Clan *clan : Clans->Entities())
    {
      AssignGuildToMainclan(clan);
    }
}

void LuaClanRepository::Save() const
{
  for(const Clan *clan : Entities())
    {
      Save(clan);
    }
}

void LuaClanRepository::Save(const Clan *clan) const
{
  LuaSaveDataFile( GetClanFilename( clan ), PushClan, "clan", clan );
}

ClanRepository *NewClanRepository()
{
  return new LuaClanRepository();
}

