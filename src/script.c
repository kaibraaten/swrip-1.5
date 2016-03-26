#include <stdio.h>
#include "mud.h"
#include "script.h"

lua_State *LuaMasterState;

static void SetLuaPath( lua_State * );
static void LuaPushOneSmaugAffect( lua_State *L, const SmaugAffect *affect, int idx );

lua_State *CreateLuaState( void )
{
  lua_State *L = luaL_newstate();
  luaL_openlibs( L );
  SetLuaPath( L );

  return L;
}

lua_State *CreateChildThread( lua_State *master )
{
  lua_State *new_thread = lua_newthread( master );

  lua_pushthread( new_thread );
  lua_newtable( new_thread );
  lua_pushvalue( new_thread, -1 );
  lua_setmetatable( new_thread, -2 );
  lua_pushvalue( new_thread, LUA_GLOBALSINDEX );
  lua_setfield( new_thread, -2, "__index" );
  lua_setfenv( new_thread, -2 );
  lua_pop( new_thread, 1 );
  return new_thread;
}

static void SetLuaPath( lua_State *L )
{
  char path[MAX_STRING_LENGTH];
  sprintf( path, "%s?.lua;;", SCRIPT_DIR );
  lua_getglobal( L, "package" );
  lua_pushstring( L, path );
  lua_setfield( L, -2, "path" );
  lua_pop( L, 1 );
}

void LuaSetfieldString( lua_State *L, const char *key, const char *value )
{
  lua_pushstring( L, value );
  lua_setfield( L, -2, key );
}

void LuaSetfieldNumber( lua_State *L, const char *key, double value )
{
  lua_pushnumber( L, value );
  lua_setfield( L, -2, key );
}

void LuaLoadDataFile( const char *filename,
                      int (*callback)( lua_State *L ),
                      const char *callbackFunctionName )
{
  lua_State *L = CreateLuaState();
  int error;

  lua_pushcfunction( L, callback );
  lua_setglobal( L, callbackFunctionName );

  error = luaL_loadfile( L, filename ) || lua_pcall( L, 0, 0, 0 );

  if( error )
    {
      Bug( "Cannot run file: %s", lua_tostring(L, -1) );
      return;
    }

  lua_close( L );
}

void LuaSaveDataFile( const char *filename,
                      void (*pushData)( lua_State *L ),
                      const char *data )
{
  int error;
  lua_State *L = CreateLuaState();
  char buffer[MAX_STRING_LENGTH];

  pushData( L );

  sprintf( buffer, "%ssavers.lua", SCRIPT_DIR );
  error = luaL_dofile( L, buffer );

  if( error )
    {
      Bug( "%s:%s():%d: Cannot run file: %s\n",
           __FILE__, __FUNCTION__, __LINE__, lua_tostring( L, -1 ) );
    }
  else
    {
      sprintf( buffer, "save%s", data );
      lua_getfield( L, -1, buffer );
      lua_getglobal( L, data );
      lua_pushstring( L, filename );

      error = lua_pcall( L, 2, 0, 0 );

      if( error )
	{
	  Bug( "%s:%s():%d: Cannot run file: %s\n",
	       __FILE__, __FUNCTION__, __LINE__, lua_tostring(L, -1) );
	}
    }

  lua_close(L);
}

void LuaPushFlags( lua_State *L, unsigned long flags,
		   const char * const nameArray[], const char *key )
{
  if( flags )
    {
      size_t bit = 0;
      lua_pushstring( L, key );
      lua_newtable( L );

      for( bit = 0; bit < MAX_BIT; ++bit )
        {
          unsigned int mask = 1 << bit;

          if( IsBitSet( flags, mask ) )
            {
              lua_pushinteger( L, bit );
              lua_pushstring( L, nameArray[bit] );
              lua_settable( L, -3 );
            }
        }

      lua_settable( L, -3 );
    }
}

unsigned int LuaLoadFlags( lua_State *L, const char *key )
{
  unsigned int flags = 0;
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key );

  if( !lua_isnil( L, ++idx ) )
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
	{
	  size_t bit = lua_tointeger( L, -2 );

	  if( bit < MAX_BIT )
	    {
	      SetBit( flags, 1 << bit );
	    }

	  lua_pop( L, 1 );
	}
    }

  lua_pop( L, 1 );

  return flags;
}

static SmaugAffect *LuaLoadOneSmaugAffect( lua_State *L )
{
  int idx = lua_gettop( L );
  SmaugAffect *affect = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );
  AllocateMemory( affect, SmaugAffect, 1 );

  lua_getfield( L, idx, "Duration" );
  lua_getfield( L, idx, "Modifier" );
  lua_getfield( L, idx, "Location" );
  lua_getfield( L, idx, "AffectedBy" );

  if( !lua_isnil( L, ++idx ) )
    {
      affect->Duration = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      affect->Duration = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      affect->Modifier = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      affect->Modifier = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      affect->Location = lua_tointeger( L, idx );;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      affect->AffectedBy = GetAffectedFlag( lua_tostring( L, idx ) );
    }

  lua_pop( L, 4 );

  return affect;
}

SmaugAffect *LuaLoadSmaugAffects( lua_State *L )
{
  SmaugAffect *firstInList = NULL;
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Affects" );

  if( !lua_isnil( L, ++idx ) )
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
        {
	  SmaugAffect *affect = LuaLoadOneSmaugAffect( L );
	  affect->next = firstInList;
	  firstInList = affect;
          lua_pop( L, 1 );
        }
    }

  lua_pop( L, 1 );

  return firstInList;
}

static void LuaPushOneSmaugAffect( lua_State *L, const SmaugAffect *affect, int idx )
{
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  if( !IsNullOrEmpty( affect->Duration ) )
    {
      LuaSetfieldString( L, "Duration", affect->Duration );
    }

  if( affect->Location )
    {
      LuaSetfieldNumber( L, "Location", affect->Location );
    }

  if( !IsNullOrEmpty( affect->Modifier ) )
    {
      LuaSetfieldString( L, "Modifier", affect->Modifier );
    }

  if( affect->AffectedBy )
    {
      int x = 0;

      for( x = 0; x < MAX_BIT; ++x )
	{
	  if( IsBitSet( affect->AffectedBy, 1 << x ) )
	    {
	      LuaSetfieldString( L, "AffectedBy", affected_flags[x] );
	      break;
	    }
	}
    }

  lua_settable( L, -3 );
}

void LuaPushSmaugAffects( lua_State *L, const SmaugAffect *affectList )
{
  if( affectList )
    {
      const SmaugAffect *affect = NULL;
      int idx = 0;
      lua_pushstring( L, "Affects" );
      lua_newtable( L );

      for ( affect = affectList; affect; affect = affect->next )
	{
	  LuaPushOneSmaugAffect( L, affect, ++idx );
	}

      lua_settable( L, -3 );
    }
}
