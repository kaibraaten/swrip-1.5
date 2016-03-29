#ifndef _SWRIP_SCRIPT_H_
#define _SWRIP_SCRIPT_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#ifdef __cplusplus
}
#endif

#include "utility/vector3.h"
#include "types.h"

extern lua_State *LuaMasterState;

lua_State *CreateLuaState( void );
lua_State *CreateChildThread( lua_State *master );
void LuaSetfieldString( lua_State *L, const char *key, const char *value );
void LuaSetfieldNumber( lua_State *L, const char *key, double value );
void LuaLoadDataFile( const char *filename,
                      int (*callback)( lua_State *L ),
                      const char *callbackFunctionName );
void LuaSaveDataFile( const char *filename,
                      void (*pushData)( lua_State *L, const void* ),
                      const char *data, const void *userData );
void LuaPushFlags( lua_State *L, unsigned long flags,
                   const char * const nameArray[], const char *key );
unsigned int LuaLoadFlags( lua_State *L, const char *key );
void LuaPushSmaugAffects( lua_State *L, const SmaugAffect *affectList );
SmaugAffect *LuaLoadSmaugAffects( lua_State *L );
void LuaPushVector3( lua_State *L, const Vector3 *v, const char *key );
void LuaLoadVector3( lua_State *L, Vector3 *vec, const char *key );

#endif
