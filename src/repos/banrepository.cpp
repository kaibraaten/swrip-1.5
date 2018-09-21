#include <algorithm>
#include "banrepository.hpp"
#include "ban.hpp"
#include "script.hpp"
#include "constants.hpp"

#define BAN_LIST DATA_DIR "banned.lua"

BanRepository *Bans = NULL;

//////////////////////////////////////////////////////
class LuaBanRepository : public BanRepository
{
public:
  bool Contains(const std::string&) const override;
  void Load() override;
  void Save() const override;

private:
  static int L_BanEntry( lua_State *L );
  static void PushBans( lua_State *L, const void *ud );
  static void PushBan(std::shared_ptr<Ban> ban, lua_State *L);
};

void LuaBanRepository::Load()
{
  LuaLoadDataFile( BAN_LIST, L_BanEntry, "BanEntry" );
}

void LuaBanRepository::Save() const
{
  LuaSaveDataFile( BAN_LIST, PushBans, "bans", NULL );
}

bool LuaBanRepository::Contains(const std::string &arg) const
{
  return Find([arg](const auto &ban) { return StrCmp(ban->Site, arg) == 0; }) != nullptr;
}

void LuaBanRepository::PushBan(std::shared_ptr<Ban> ban, lua_State *L)
{
  static int idx = 0;

  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Site", ban->Site );
  LuaSetfieldString( L, "BanTime", ban->BanTime );
  LuaSetfieldNumber( L, "Level", ban->Level );

  lua_settable( L, -3 );
}

void LuaBanRepository::PushBans( lua_State *L, const void *ud )
{
  lua_newtable( L );
  const std::list<std::shared_ptr<Ban>> &bans = Bans->Entities();

  for_each(bans.begin(), bans.end(),
           [&L](const auto ban) { PushBan(ban, L); });

  lua_setglobal( L, "bans" );
}

int LuaBanRepository::L_BanEntry( lua_State *L )
{
  std::shared_ptr<Ban> ban = std::make_shared<Ban>();
  LuaGetfieldString( L, "Site", &ban->Site );
  LuaGetfieldString( L, "BanTime", &ban->BanTime );
  LuaGetfieldInt( L, "Level", &ban->Level );
  Bans->Add(ban);
  return 0;
}

BanRepository *NewBanRepository()
{
  return new LuaBanRepository();
}
