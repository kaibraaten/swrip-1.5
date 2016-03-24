#include <stdio.h>
#include "mud.h"
#include "script.h"

lua_State *LuaMasterState;

static void SetLuaPath( lua_State * );

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

void LuaPushOneSmaugAffect( lua_State *L, const SmaugAffect *affect, int idx )
{
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  if( !IsNullOrEmpty( affect->duration ) )
    {
      LuaSetfieldString( L, "Duration", affect->duration );
    }

  if( affect->location )
    {
      LuaSetfieldString( L, "Location", affect_types[affect->location % REVERSE_APPLY] );
    }

  if( !IsNullOrEmpty( affect->modifier ) )
    {
      LuaSetfieldString( L, "Modifier", affect->modifier );
    }

  if( affect->bitvector )
    {
      int x = 0;

      for( x = 0; x < MAX_BIT; ++x )
	{
	  if( IsBitSet( affect->bitvector, 1 << x ) )
	    {
	      LuaSetfieldString( L, "BitVector", affected_flags[x] );
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
