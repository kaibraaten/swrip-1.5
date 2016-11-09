#include "ban.hpp"
#include "constants.hpp"
#include "script.hpp"

Ban *FirstBan = NULL;
Ban *LastBan = NULL;

static void PushBan( lua_State *L, const Ban *ban )
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
  const Ban *ban = NULL;
  lua_newtable( L );

  for( ban = FirstBan; ban; ban = ban->Next )
    {
      PushBan( L, ban );
    }

  lua_setglobal( L, "bans" );
}

void SaveBans( void )
{
  LuaSaveDataFile( BAN_LIST, PushBans, "bans", NULL );
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
  LINK( ban, FirstBan, LastBan, Next, Previous );
  return 0;
}

void LoadBans( void )
{
  LuaLoadDataFile( BAN_LIST, L_BanEntry, "BanEntry" );
}
