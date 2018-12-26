#include "clanrepository.hpp"
#include "clan.hpp"
#include "script.hpp"
#include "constants.hpp"
#include "mud.hpp"
#include "log.hpp"

#define CLAN_DIR DATA_DIR "clans/"

std::shared_ptr<ClanRepository> Clans;

class LuaClanRepository : public ClanRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const std::shared_ptr<Clan>&) const override;

private:
  static void PushMember( lua_State *L, const std::shared_ptr<ClanMember> &member, int idx );
  static void PushMembers( lua_State *L, const std::shared_ptr<Clan> &clan );
  static void PushClan( lua_State *L, const void *userData );
  static void LoadOneMember( lua_State *L, const std::shared_ptr<Clan> &clan );
  static void LoadMembers( lua_State *L, const std::shared_ptr<Clan> &clan );
  static void LoadStoreroom( lua_State *L, const std::shared_ptr<Clan> &clan );
  static int L_ClanEntry( lua_State *L );
  static void ExecuteClanFile( const std::string &filePath, void *userData );
};

void LuaClanRepository::Load()
{
  ForEachLuaFileInDir( CLAN_DIR, ExecuteClanFile, NULL );

  for(const auto &clan : Clans)
    {
      AssignGuildToMainclan(clan);
    }
}

void LuaClanRepository::Save() const
{
  for(const auto &clan : Entities())
    {
      Save(clan);
    }
}

void LuaClanRepository::Save(const std::shared_ptr<Clan> &clan) const
{
  LuaSaveDataFile( GetClanFilename( clan ), PushClan, "clan", &clan );
}

void LuaClanRepository::PushMember( lua_State *L,
                                    const std::shared_ptr<ClanMember> &member,
                                    int idx )
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

void LuaClanRepository::PushMembers( lua_State *L, const std::shared_ptr<Clan> &clan )
{
  int idx = 0;
  lua_pushstring( L, "Members" );
  lua_newtable( L );

  for(const auto &member : clan->Members() )
    {
      PushMember( L, member, ++idx );
    }

  lua_settable( L, -3 );
}

void LuaClanRepository::PushClan( lua_State *L, const void *userData )
{
  const std::shared_ptr<Clan> clan = *static_cast<const std::shared_ptr<Clan>*>(userData);
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

void LuaClanRepository::LoadOneMember( lua_State *L, const std::shared_ptr<Clan> &clan )
{
  std::shared_ptr<ClanMember> member = std::make_shared<ClanMember>();

  LuaGetfieldString( L, "Name", &member->Name );
  LuaGetfieldLong( L, "MemberSince", &member->Since );
  LuaGetfieldString( L, "Ability",
                     [member](const std::string &abilityName)
                     {
                       member->Ability = GetAbility( abilityName );
                     });
  LuaGetfieldInt( L, "Level", &member->Level );
  LuaGetfieldInt( L, "Kills", &member->Kills );
  LuaGetfieldInt( L, "Deaths", &member->Deaths );
  LuaGetfieldLong( L, "LastActivity", &member->LastActivity );

  clan->Add(member);
}

void LuaClanRepository::LoadMembers( lua_State *L, const std::shared_ptr<Clan> &clan )
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

void LuaClanRepository::LoadStoreroom( lua_State *L, const std::shared_ptr<Clan> &clan )
{

}

int LuaClanRepository::L_ClanEntry( lua_State *L )
{
  std::string clanName;
  LuaGetfieldString( L, "Name", &clanName );

  if( clanName.empty() )
    {
      Log->Bug( "%s: Found clan without name!", __FUNCTION__ );
      return 0;
    }

  std::shared_ptr<Clan> clan = AllocateClan();
  clan->Name = clanName;
  Log->Info( "Loading %s", clan->Name.c_str() );
  
  LuaGetfieldString( L, "MainClan", &clan->MainClanName );
  LuaGetfieldString( L, "Description", &clan->Description );
  LuaGetfieldInt( L, "PlayerKills", &clan->PlayerKills );
  LuaGetfieldInt( L, "PlayerDeaths", &clan->PlayerDeaths );
  LuaGetfieldInt( L, "MobKills", &clan->MobKills );
  LuaGetfieldInt( L, "MobDeaths", &clan->MobDeaths );
  LuaGetfieldInt( L, "Type", &clan->Type );
  LuaGetfieldLong( L, "BoardVnum", &clan->Board );
  LuaGetfieldLong( L, "StoreroomVnum", &clan->Storeroom );
  LuaGetfieldLong( L, "Funds", &clan->Funds );
  LuaGetfieldLong( L, "JailVnum", &clan->Jail );
  LuaGetfieldLong( L, "EnlistRoom1Vnum", &clan->EnlistRoom1 );
  LuaGetfieldLong( L, "EnlistRoom2Vnum", &clan->EnlistRoom2 );
  LuaGetfieldString( L, "Leader", &clan->Leadership.Leader );
  LuaGetfieldString( L, "Number1", &clan->Leadership.Number1 );
  LuaGetfieldString( L, "Number2", &clan->Leadership.Number2 );
  LuaGetfieldLong( L, "FoundationDate", &clan->FoundationDate );

  Clans->Add( clan );
  LoadMembers( L, clan );
  LoadStoreroom( L, clan );

  return 0;
}

void LuaClanRepository::ExecuteClanFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ClanEntry, "ClanEntry" );
}

std::string GetClanFilename( const std::shared_ptr<Clan> &clan )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", CLAN_DIR, ConvertToLuaFilename( clan->Name ).c_str() );

  return fullPath;
}

std::shared_ptr<ClanRepository> NewClanRepository()
{
  return std::make_shared<LuaClanRepository>();
}

/*
 * Save items in a clan storage room                    -Scryn & Thoric
 */
void SaveClanStoreroom( Character *ch, const std::shared_ptr<Clan> &clan )
{
  // See original implementation here:
  /*
    https://github.com/kaibraaten/swrip-1.5/blob/9dd6b4a09af43c8dbaf044b581d1693349914108/src/clan.cpp
  */
}
