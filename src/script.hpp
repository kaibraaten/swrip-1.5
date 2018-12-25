#ifndef _SWRIP_SCRIPT_HPP_
#define _SWRIP_SCRIPT_HPP_

#ifdef __cplusplus
extern "C" {
#endif

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#ifdef __cplusplus
}
#endif

#include <memory>
#include <bitset>
#include <functional>
#include <list>
#include <string>
#include <array>
#include <utility/vector3.hpp>
#include "constants.hpp"
#include "types.hpp"

extern lua_State *LuaMasterState;

lua_State *CreateLuaState( void );
lua_State *CreateChildThread( lua_State *master );
void LuaSetfieldString( lua_State *L, const std::string &key, const std::string &value );
void LuaSetfieldNumber( lua_State *L, const std::string &key, double value );
void LuaSetfieldBoolean( lua_State *L, const std::string &key, bool value );

template<typename T>
void LuaGetfield( lua_State *L, const std::string &key, T *value,
                  std::function<void(lua_State*, int, T*)> assignValue)
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key.c_str() );

  if( !lua_isnil( L, ++idx ) )
    {
      assignValue( L, idx, value );
    }

  lua_pop( L, 1 );
}

void LuaGetfieldString( lua_State *L, const std::string &key, std::string *value );
void LuaGetfieldString( lua_State *L, const std::string &key,
                        std::function<void(const std::string&)> assignValue);
void LuaGetfieldInt( lua_State *L, const std::string &key, int *value );
void LuaGetfieldInt( lua_State *L, const std::string &key,
                     std::function<void(int)> assignValue);
void LuaGetfieldLong( lua_State *L, const std::string &key, long *value );
void LuaGetfieldLong( lua_State *L, const std::string &key,
                      std::function<void(long)> assignValue);
void LuaGetfieldBool( lua_State *L, const std::string &key, bool *value );
void LuaGetfieldBool( lua_State *L, const std::string &key,
                      std::function<void(bool)> assignValue);
void LuaGetfieldDouble( lua_State *L, const std::string &key, double *value );
void LuaGetfieldDouble( lua_State *L, const std::string &key,
                        std::function<void(double)> assignValue);
bool FieldExists( lua_State *L, const std::string &key );
void LuaLoadDataFile( const std::string &filename,
                      int (*callback)( lua_State *L ),
                      const std::string &callbackFunctionName );
void LuaSaveDataFile( const std::string &filename,
                      void (*pushData)( lua_State *L, const void* ),
                      const std::string &data, const void *userData );
void LuaPushFlags(lua_State *L, unsigned long flags,
                  const std::array<const char * const, Flag::MAX> &nameArray,
                  const std::string &key);
void LuaPushFlags( lua_State *L, unsigned long flags,
                   const char * const nameArray[], const std::string &key );
void LuaPushFlags(lua_State *L, const std::bitset<Flag::MAX> &flags,
                  const std::array<const char * const, Flag::MAX> &nameArray,
                  const std::string &key);
void LuaPushFlags(lua_State *L, const std::bitset<Flag::MAX> &flags,
                  const char * const nameArray[], const std::string &key);
std::bitset<Flag::MAX> LuaLoadFlags( lua_State *L, const std::string &key );

void LuaPushSmaugAffects( lua_State *L, const std::list<SmaugAffect*> &affectList );
std::list<SmaugAffect*> LuaLoadSmaugAffects( lua_State *L );
void LuaPushCharacterAffects( lua_State *L, const std::list<std::shared_ptr<Affect>> &affects,
                              const std::string &key = "Affects" );
void LuaPushObjectAffects( lua_State *L, const std::list<std::shared_ptr<Affect>> &affects,
                           const std::string &key = "Affects" );
std::list<std::shared_ptr<Affect>> LuaLoadCharacterAffects( lua_State *L, const std::string &key = "Affects" );
std::list<std::shared_ptr<Affect>> LuaLoadObjectAffects( lua_State *L, const std::string &key = "Affects" );
void LuaPushObjects( lua_State *L, const std::list<Object*> &objects,
                     const std::string &key = "Objects" );
std::list<Object*> LuaLoadObjects( lua_State *L, const std::string &key = "Objects" );
void LuaPushMobiles( lua_State *L, const std::list<Character*> &mobiles,
                     const std::string &key = "Mobiles" );
std::list<Character*> LuaLoadMobiles( lua_State *L, const std::string &key );
void LuaPushVector3( lua_State *L, const Vector3 *v, const std::string &key );
void LuaLoadVector3( lua_State *L, Vector3 *vec, const std::string &key );
void LuaPushStats( lua_State *L, const Stats *stats, const std::string &key );
void LuaLoadStats( lua_State *L, Stats *stats, const std::string &key );
void LuaPushCurrentAndMax( lua_State *L, const std::string &key, int current, int max );
void LuaLoadCurrentAndMax( lua_State *L, const std::string &key, int *current, int *max );
void LuaPushOvalues( lua_State *L, const std::array<int, MAX_OVAL> values );
void LuaPushExtraDescriptions( lua_State *L, const std::list<std::shared_ptr<ExtraDescription>> &extras );
std::list<std::shared_ptr<ExtraDescription>> LuaLoadExtraDescriptions( lua_State *L );
void LuaPushCharacter( lua_State *L, const Character *ch,
                       std::function<void(lua_State*, const Character*)> pushExtra );
void LuaLoadCharacter( lua_State *L, Character *ch,
                       std::function<void(lua_State*, Character*)> loadExtra );

#define PushCurrentAndMax( L, key, structure ) LuaPushCurrentAndMax( (L), (key), (structure.Current), (structure.Max) )
#define LoadCurrentAndMax( L, key, structure ) LuaLoadCurrentAndMax( (L), (key), (&structure.Current), (&structure.Max) )

#endif
