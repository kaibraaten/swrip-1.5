#include <stdio.h>
#include "mud.hpp"
#include "script.hpp"

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
  lua_getglobal( new_thread, "_G" );
  lua_setfield( new_thread, -2, "__index" );
  lua_setupvalue( new_thread, 1, 1 );
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

void LuaSetfieldString( lua_State *L, const std::string &key, const std::string &value )
{
  lua_pushstring( L, value.c_str() );
  lua_setfield( L, -2, key.c_str() );
}

void LuaSetfieldNumber( lua_State *L, const std::string &key, double value )
{
  lua_pushnumber( L, value );
  lua_setfield( L, -2, key.c_str() );
}

void LuaSetfieldBoolean( lua_State *L, const std::string &key, bool value )
{
  lua_pushboolean( L, value );
  lua_setfield( L, -2, key.c_str() );
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
                      void (*pushData)( lua_State *L, const void* ),
                      const char *data, const void *userData )
{
  int error;
  lua_State *L = CreateLuaState();
  char buffer[MAX_STRING_LENGTH];

  pushData( L, userData );

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

void LuaPushFlags(lua_State *L, unsigned long flags,
                  const std::array<const char * const, MAX_BIT> &nameArray,
                  const char *key)
{
  LuaPushFlags(L, flags, nameArray.data(), key);
}

void LuaPushFlags( lua_State *L, unsigned long flags,
		   const char * const nameArray[], const char *key )
{
  if( flags )
    {
      lua_pushstring( L, key );
      lua_newtable( L );

      for(size_t bit = 0; bit < MAX_BIT; ++bit)
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
      affect->AffectedBy = GetAffectFlag( lua_tostring( L, idx ) );
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
	  affect->Next = firstInList;
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
      for(size_t x = 0; x < MAX_BIT; ++x )
	{
	  if( IsBitSet( affect->AffectedBy, 1 << x ) )
	    {
	      LuaSetfieldString( L, "AffectedBy", AffectFlags[x] );
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

      for ( affect = affectList; affect; affect = affect->Next )
	{
	  LuaPushOneSmaugAffect( L, affect, ++idx );
	}

      lua_settable( L, -3 );
    }
}

void LuaPushVector3( lua_State *L, const Vector3 *v, const char *key )
{
  lua_pushstring( L, key );
  lua_newtable( L );

  LuaSetfieldNumber( L, "X", v->x );
  LuaSetfieldNumber( L, "Y", v->y );
  LuaSetfieldNumber( L, "Z", v->z );

  lua_settable( L, -3 );
}

void LuaLoadVector3( lua_State *L, Vector3 *vec, const char *key )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key );

  if( !lua_isnil( L, ++idx ) )
    {
      int subidx = lua_gettop( L );
      lua_getfield( L, subidx, "X" );
      lua_getfield( L, subidx, "Y" );
      lua_getfield( L, subidx, "Z" );

      if( !lua_isnil( L, ++subidx ) )
	{
	  vec->x = lua_tonumber( L, subidx );
	}

      if( !lua_isnil( L, ++subidx ) )
        {
          vec->y = lua_tonumber( L, subidx );
        }

      if( !lua_isnil( L, ++subidx ) )
        {
          vec->z = lua_tonumber( L, subidx );
        }

      lua_pop( L, 3 );
    }

  lua_pop( L, 1 );
}

void LuaPushCurrentAndMax( lua_State *L, const char *key, int current, int mx )
{
  lua_pushstring( L, key );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Current", current );
  LuaSetfieldNumber( L, "Max", mx );

  lua_settable( L, -3 );
}

void LuaLoadCurrentAndMax( lua_State *L, const char *key, int *current, int *mx )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key );

  if( !lua_isnil( L, ++idx ) )
    {
      int subidx = lua_gettop( L );
      lua_getfield( L, subidx, "Current" );
      lua_getfield( L, subidx, "Max" );

      if( !lua_isnil( L, ++subidx ) )
        {
          *current = lua_tonumber( L, subidx );
        }

      if( !lua_isnil( L, ++subidx ) )
        {
          *mx = lua_tonumber( L, subidx );
        }

      lua_pop( L, 2 );
    }

  lua_pop( L, 1 );
}
