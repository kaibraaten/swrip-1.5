#include "clanrepository.hpp"
#include "clan.hpp"
#include "script.hpp"
#include "constants.hpp"
#include "mud.hpp"
#include "log.hpp"

#define CLAN_DIR DATA_DIR "clans/"

ClanRepository *Clans = nullptr;

class LuaClanRepository : public ClanRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Clan*) const override;

private:
  static void PushMember( lua_State *L, const ClanMember *member, int idx );
  static void PushMembers( lua_State *L, const Clan *clan );
  static void PushClan( lua_State *L, const void *userData );
  static void LoadOneMember( lua_State *L, Clan *clan );
  static void LoadMembers( lua_State *L, Clan *clan );
  static void LoadStoreroom( lua_State *L, Clan *clan );
  static int L_ClanEntry( lua_State *L );
  static void ExecuteClanFile( const std::string &filePath, void *userData );
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

void LuaClanRepository::PushMember( lua_State *L, const ClanMember *member, int idx )
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

void LuaClanRepository::PushMembers( lua_State *L, const Clan *clan )
{
  int idx = 0;
  lua_pushstring( L, "Members" );
  lua_newtable( L );

  for(const ClanMember *member : clan->Members() )
    {
      PushMember( L, member, ++idx );
    }

  lua_settable( L, -3 );
}

void LuaClanRepository::PushClan( lua_State *L, const void *userData )
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

  if( !clan->Description.empty() )
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

void LuaClanRepository::LoadOneMember( lua_State *L, Clan *clan )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  ClanMember *member = new ClanMember();

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "MemberSince" );
  lua_getfield( L, idx, "Ability" );
  lua_getfield( L, idx, "Level" );
  lua_getfield( L, idx, "Kills" );
  lua_getfield( L, idx, "Deaths" );
  lua_getfield( L, idx, "LastActivity" );

  const int elementsToPop = lua_gettop( L ) - topAtStart;
  
  if( !lua_isnil( L, ++idx ) )
    {
      member->Name = lua_tostring( L, idx );
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

  clan->Add(member);
  lua_pop( L, elementsToPop );
}

void LuaClanRepository::LoadMembers( lua_State *L, Clan *clan )
{
  int idx = lua_gettop( L );

  lua_getfield( L, idx, "Members" );

  if( !lua_isnil( L, ++idx ) )
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
        {
          LoadOneMember( L, clan );
          lua_pop( L, 1 );
        }
    }

  lua_pop( L, 1 );
}

void LuaClanRepository::LoadStoreroom( lua_State *L, Clan *clan )
{

}

int LuaClanRepository::L_ClanEntry( lua_State *L )
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
      clan->Name = lua_tostring( L, idx );
      Log->Info( "Loading %s", clan->Name.c_str() );
    }
  else
    {
      Log->Bug( "%s: Found clan without name!", __FUNCTION__ );
      lua_pop( L, topAfterGets - topAtStart );
      return 0;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->tmpstr = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Description = lua_tostring( L, idx );
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
      clan->Leadership.Leader = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Leadership.Number1 = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->Leadership.Number2 = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      clan->FoundationDate = lua_tointeger( L, idx );
    }

  lua_pop( L, topAfterGets - topAtStart );

  Clans->Add( clan );
  LoadMembers( L, clan );
  LoadStoreroom( L, clan );

  return 0;
}

void LuaClanRepository::ExecuteClanFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ClanEntry, "ClanEntry" );
}

std::string GetClanFilename( const Clan *clan )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", CLAN_DIR, ConvertToLuaFilename( clan->Name ).c_str() );

  return fullPath;
}

ClanRepository *NewClanRepository()
{
  return new LuaClanRepository();
}

/*
 * Save items in a clan storage room                    -Scryn & Thoric
 */
void SaveClanStoreroom( Character *ch, const Clan *clan )
{
  // See original implementation here:
  /*
    https://github.com/kaibraaten/swrip-1.5/blob/9dd6b4a09af43c8dbaf044b581d1693349914108/src/clan.cpp
  */
}
