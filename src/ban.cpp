#include <algorithm>
#include "ban.hpp"
#include "constants.hpp"
#include "script.hpp"

BanRepository *BanRepos = NULL;

static void PushBan(std::shared_ptr<Ban> ban, lua_State *L)
{
  static int idx = 0;

  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Site", ban->Site );
  LuaSetfieldString( L, "BanTime", ban->BanTime );
  LuaSetfieldNumber( L, "Level", ban->Level );

  lua_settable( L, -3 );
}

static void PushBans( lua_State *L, const void *ud )
{
  lua_newtable( L );
  const std::list<std::shared_ptr<Ban>>& bans = BanRepos->Entities();

  for_each(bans.begin(), bans.end(),
           [&L](const auto ban) { PushBan(ban, L); });

  lua_setglobal( L, "bans" );
}

static int L_BanEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "Site" );
  lua_getfield( L, idx, "BanTime" );
  lua_getfield( L, idx, "Level" );
  
  int elementsToPop = lua_gettop( L ) - topAtStart;
  std::shared_ptr<Ban> ban = std::make_shared<Ban>();
  
  if( !lua_isnil( L, ++idx ) )
    {
      ban->Site = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ban->BanTime = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ban->Level = lua_tointeger( L, idx );
    }
  
  lua_pop( L, elementsToPop );
  BanRepos->Add(ban);
  return 0;
}

void BanRepository::Load()
{
  LuaLoadDataFile( BAN_LIST, L_BanEntry, "BanEntry" );
}

void BanRepository::Save() const
{
  LuaSaveDataFile( BAN_LIST, PushBans, "bans", NULL );
}

bool BanRepository::Contains(const std::string &arg) const
{
  return Find([arg](const auto &ban) { return StrCmp(ban->Site, arg) == 0; }) != nullptr;
}

BanRepository *NewBanRepository(void)
{
  BanRepository *repo = new BanRepository();
  return repo;
}
