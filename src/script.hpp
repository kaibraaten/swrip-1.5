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
void LuaLoadDataFile( const char *filename,
                      int (*callback)( lua_State *L ),
                      const char *callbackFunctionName );
void LuaSaveDataFile( const char *filename,
                      void (*pushData)( lua_State *L, const void* ),
                      const char *data, const void *userData );
void LuaPushFlags(lua_State *L, unsigned long flags,
                  const std::array<const char * const, MAX_BIT> &nameArray,
                  const char *key);
void LuaPushFlags( lua_State *L, unsigned long flags,
                   const char * const nameArray[], const char *key );
unsigned int LuaLoadFlags( lua_State *L, const char *key );
void LuaPushSmaugAffects( lua_State *L, const SmaugAffect *affectList );
SmaugAffect *LuaLoadSmaugAffects( lua_State *L );
void LuaPushVector3( lua_State *L, const Vector3 *v, const char *key );
void LuaLoadVector3( lua_State *L, Vector3 *vec, const char *key );
void LuaPushCurrentAndMax( lua_State *L, const char *key, int current, int max );
void LuaLoadCurrentAndMax( lua_State *L, const char *key, int *current, int *max );

#define PushCurrentAndMax( L, key, structure ) LuaPushCurrentAndMax( (L), (key), (structure.Current), (structure.Max) )
#define LoadCurrentAndMax( L, key, structure ) LuaLoadCurrentAndMax( (L), (key), (&structure.Current), (&structure.Max) )

#endif
