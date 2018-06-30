#include "ban.h"
#include "constants.h"
#include "script.h"

Repository *BanRepository = NULL;

static void PushBan(void *element, void *ud)
{
  const Ban *ban = (const Ban*)element;
  lua_State *L = (lua_State*)ud;
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
  const List *bans = GetEntities(BanRepository);
  lua_newtable( L );

  ForEachInList(bans, PushBan, L);

  lua_setglobal( L, "bans" );
}

static int L_BanEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;
  Ban *ban = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "Site" );
  lua_getfield( L, idx, "BanTime" );
  lua_getfield( L, idx, "Level" );
  
  elementsToPop = lua_gettop( L ) - topAtStart;

  AllocateMemory( ban, Ban, 1 );
  
  if( !lua_isnil( L, ++idx ) )
    {
      ban->Site = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ban->BanTime = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ban->Level = lua_tointeger( L, idx );
    }
  
  lua_pop( L, elementsToPop );
  AddBan(ban);
  return 0;
}

void LoadBans(void)
{
  LoadEntities(BanRepository);
}

void SaveBans(void)
{
  SaveEntities(BanRepository);
}

static void _LoadBans(Repository *repo)
{
  LuaLoadDataFile( BAN_LIST, L_BanEntry, "BanEntry" );
}

static void _SaveBans(const Repository *repo)
{
  LuaSaveDataFile( BAN_LIST, PushBans, "bans", NULL );
}

Repository *NewBanRepository(void)
{
  Repository *repo = NewRepository(_LoadBans, _SaveBans);
  return repo;
}

void AddBan(Ban *ban)
{
  AddEntity(BanRepository, ban);
}

void RemoveBan(Ban *ban)
{
  RemoveEntity(BanRepository, ban);
}
