#include <cstdio>
#include "mud.hpp"
#include "script.hpp"
#include "log.hpp"
#include "stats.hpp"
#include "object.hpp"
#include "character.hpp"
#include "skill.hpp"

lua_State *LuaMasterState;

static void SetLuaPath( lua_State * );
static void LuaPushOneSmaugAffect( lua_State *L, const SmaugAffect *affect, int idx );
static void LuaPushOneAffect( lua_State *L, const Affect *affect, int idx );

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

void LuaLoadDataFile( const std::string &filename,
                      int (*callback)( lua_State *L ),
                      const std::string &callbackFunctionName )
{
  lua_State *L = CreateLuaState();

  lua_pushcfunction( L, callback );
  lua_setglobal( L, callbackFunctionName.c_str() );

  int error = luaL_loadfile( L, filename.c_str() ) || lua_pcall( L, 0, 0, 0 );

  if( error )
    {
      Log->Bug( "Cannot run file: %s", lua_tostring(L, -1) );
      return;
    }

  lua_close( L );
}

void LuaSaveDataFile( const std::string &filename,
                      void (*pushData)( lua_State *L, const void* ),
                      const std::string &data, const void *userData )
{
  lua_State *L = CreateLuaState();
  char buffer[MAX_STRING_LENGTH];

  pushData( L, userData );

  sprintf( buffer, "%ssavers.lua", SCRIPT_DIR );
  int error = luaL_dofile( L, buffer );

  if( error )
    {
      Log->Bug( "%s:%s():%d: Cannot run file: %s\n",
                __FILE__, __FUNCTION__, __LINE__, lua_tostring( L, -1 ) );
    }
  else
    {
      sprintf( buffer, "save%s", data.c_str() );
      lua_getfield( L, -1, buffer );
      lua_getglobal( L, data.c_str() );
      lua_pushstring( L, filename.c_str() );

      error = lua_pcall( L, 2, 0, 0 );

      if( error )
	{
	  Log->Bug( "%s:%s():%d: Cannot run file: %s\n",
                    __FILE__, __FUNCTION__, __LINE__, lua_tostring(L, -1) );
	}
    }

  lua_close(L);
}

void LuaPushFlags(lua_State *L, unsigned long flags,
                  const std::array<const char * const, MAX_BIT> &nameArray,
                  const std::string &key)
{
  LuaPushFlags(L, flags, nameArray.data(), key);
}

void LuaPushFlags( lua_State *L, unsigned long flags,
		   const char * const nameArray[], const std::string &key )
{
  if( flags )
    {
      lua_pushstring( L, key.c_str() );
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

unsigned int LuaLoadFlags( lua_State *L, const std::string &key )
{
  unsigned int flags = 0;
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key.c_str() );

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
  luaL_checktype( L, 1, LUA_TTABLE );

  SmaugAffect *affect = new SmaugAffect();

  lua_getfield( L, idx, "Duration" );
  lua_getfield( L, idx, "Modifier" );
  lua_getfield( L, idx, "Location" );
  lua_getfield( L, idx, "AffectedBy" );

  if( !lua_isnil( L, ++idx ) )
    {
      affect->Duration = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      affect->Modifier = lua_tostring( L, idx );
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

  if( !affect->Duration.empty() )
    {
      LuaSetfieldString( L, "Duration", affect->Duration );
    }

  if( affect->Location )
    {
      LuaSetfieldNumber( L, "Location", affect->Location );
    }

  if( !affect->Modifier.empty() )
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

void LuaPushVector3( lua_State *L, const Vector3 *v, const std::string &key )
{
  lua_pushstring( L, key.c_str() );
  lua_newtable( L );

  LuaSetfieldNumber( L, "X", v->x );
  LuaSetfieldNumber( L, "Y", v->y );
  LuaSetfieldNumber( L, "Z", v->z );

  lua_settable( L, -3 );
}

void LuaLoadVector3( lua_State *L, Vector3 *vec, const std::string &key )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key.c_str() );

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

void LuaPushCurrentAndMax( lua_State *L, const std::string &key, int current, int mx )
{
  lua_pushstring( L, key.c_str() );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Current", current );
  LuaSetfieldNumber( L, "Max", mx );

  lua_settable( L, -3 );
}

void LuaLoadCurrentAndMax( lua_State *L, const std::string &key, int *current, int *mx )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key.c_str() );

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

static void LuaPushOneAffect( lua_State *L, const Affect *affect, int idx )
{
  const Skill *skill = GetSkill( affect->Type );
  
  if( affect->Type >= 0 && skill == nullptr )
    {
      return;
    }
  
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Duration", affect->Duration );
  LuaSetfieldNumber( L, "Location", affect->Location );
  LuaSetfieldNumber( L, "Modifier", affect->Modifier );

  if( affect->Type >= 0 && affect->Type < TYPE_PERSONAL )
    {
      LuaSetfieldString( L, "Skill", skill->Name );
    }
  else
    {
      LuaSetfieldNumber( L, "Type", affect->Type );
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

void LuaPushAffects( lua_State *L, const std::list<Affect*> &affects,
                     const std::string &key )
{
  if( !affects.empty() )
    {
      int idx = 0;
      lua_pushstring( L, "Affects" );
      lua_newtable( L );

      for ( const Affect *affect : affects )
        {
          LuaPushOneAffect( L, affect, ++idx );
        }

      lua_settable( L, -3 );
    }
}

void LuaPushObjects( lua_State *L, const std::list<Object*> &objects,
                     const std::string &key )
{

}

void LuaPushMobiles( lua_State *L, const std::list<Character*> &mobiles,
                     const std::string &key )
{

}

void LuaPushStats( lua_State *L, const Stats *stats, const std::string &key )
{
  lua_pushstring( L, key.c_str() );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Strength", stats->Str );
  LuaSetfieldNumber( L, "Intelligence", stats->Int );
  LuaSetfieldNumber( L, "Wisdom", stats->Wis );
  LuaSetfieldNumber( L, "Dexterity", stats->Dex );
  LuaSetfieldNumber( L, "Constitution", stats->Con );
  LuaSetfieldNumber( L, "Charisma", stats->Cha );
  LuaSetfieldNumber( L, "Luck", stats->Lck );
  LuaSetfieldNumber( L, "Force", stats->Frc );
  
  lua_settable( L, -3 );
}

void LuaLoadStats( lua_State *L, Stats *stats, const std::string &key )
{
  
}
