#ifndef _SWRIP_LUASCRIPT_HPP_
#define _SWRIP_LUASCRIPT_HPP_

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
#include <vector>
#include <utility/vector3.hpp>
#include "constants.hpp"
#include "types.hpp"

lua_State *CreateLuaState();
lua_State *CreateChildThread(lua_State *master);
void LuaSetfieldString(lua_State *L, const std::string &key, const std::string &value);
void LuaSetfieldNumber(lua_State *L, const std::string &key, double value);
void LuaSetfieldBoolean(lua_State *L, const std::string &key, bool value);

template<typename T, typename CallableT>
void LuaGetfield(lua_State *L, const std::string &key, T *value,
                 CallableT assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        assignValue(L, idx, value);
    }

    lua_pop(L, 1);
}

template<typename CallableT, typename UserdataT>
void LuaLoadTable(lua_State *L, const std::string &key, CallableT getFields, UserdataT ud)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        getFields(L, ud);
    }

    lua_pop(L, 1);
}

// CallableT must have the following signature:
// void Callback(lua_State*, int subscript, UserdataT)
// The subscript parameter is the subscript from the Lua
// array in case you need it. UserdataT is whatever you want.
// It's the same object as you provide in the third
// parameter of LuaLoadArray().
template<typename CallableT, typename UserdataT>
void LuaLoadArray(lua_State *L, const std::string &key,
                  CallableT callback,
                  UserdataT userData)
{
    auto idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            auto subscript = lua_tointeger(L, -2);
            callback(L, subscript, userData);
            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

template<typename CallableT, typename CollectionT>
void LuaPushCollection(lua_State *L, CollectionT collection, const std::string &key,
                       CallableT callback)
{
    if(!collection.empty())
    {
        lua_pushstring(L, key.c_str());
        lua_newtable(L);
        size_t idx = 0;

        for(const auto &item : collection)
        {
            callback(L, idx++, item);
        }

        lua_settable(L, -3);
    }
}

void LuaGetfieldString(lua_State *L, const std::string &key, std::string *value);
void LuaGetfieldString(lua_State *L, const std::string &key,
                       std::function<void(const std::string &)> assignValue);
void LuaGetfieldInt(lua_State *L, const std::string &key, int *value);
void LuaGetfieldInt(lua_State *L, const std::string &key,
                    std::function<void(int)> assignValue);
void LuaGetfieldLong(lua_State *L, const std::string &key, long *value);
void LuaGetfieldLong(lua_State *L, const std::string &key,
                     std::function<void(long)> assignValue);
void LuaGetfieldShort(lua_State *L, const std::string &key, short *value);
void LuaGetfieldShort(lua_State *L, const std::string &key,
                      std::function<void(short)> assignValue);
void LuaGetfieldBool(lua_State *L, const std::string &key, bool *value);
void LuaGetfieldBool(lua_State *L, const std::string &key,
                     std::function<void(bool)> assignValue);
void LuaGetfieldDouble(lua_State *L, const std::string &key, double *value);
void LuaGetfieldDouble(lua_State *L, const std::string &key,
                       std::function<void(double)> assignValue);
bool FieldExists(lua_State *L, const std::string &key);
void LuaLoadDataFile(const std::string &filename,
                     int(*callback)(lua_State *L),
                     const std::string &callbackFunctionName);
void LuaSaveDataFile(lua_State *L, const std::string &filename, const std::string &data);

template<typename CallableT, typename UserDataT>
void LuaSaveDataFile(const std::string &filename,
                     CallableT pushData,
                     const std::string &data, UserDataT userData)
{
    lua_State *L = CreateLuaState();
    pushData(L, userData);
    LuaSaveDataFile(L, filename, data);
    lua_close(L);
}

template<typename CallbackT>
void LuaSaveDataFile(const std::string &filename,
                     CallbackT pushData, const std::string &data)
{
    lua_State *L = CreateLuaState();
    pushData(L);
    LuaSaveDataFile(L, filename, data);
    lua_close(L);
}

void LuaPushFlags(lua_State *L, unsigned long flags,
                  const std::array<const char *const, Flag::MAX> &nameArray,
                  const std::string &key);
void LuaPushFlags(lua_State *L, unsigned long flags,
                  const char *const nameArray[], const std::string &key);
void LuaPushFlags(lua_State *L, const std::bitset<Flag::MAX> &flags,
                  const std::array<const char *const, Flag::MAX> &nameArray,
                  const std::string &key);
void LuaPushFlags(lua_State *L, const std::bitset<Flag::MAX> &flags,
                  const char *const nameArray[], const std::string &key);
std::bitset<Flag::MAX> LuaLoadFlags(lua_State *L, const std::string &key);
void LuaPushLanguages(lua_State *L, unsigned long languages, const std::string &key);

void LuaPushSmaugAffects(lua_State *L, const std::list<std::shared_ptr<SmaugAffect>> &affectList);
std::list<std::shared_ptr<SmaugAffect>> LuaLoadSmaugAffects(lua_State *L);
void LuaPushCharacterAffects(lua_State *L, const std::list<std::shared_ptr<Affect>> &affects,
                             const std::string &key = "Affects");
void LuaPushObjectAffects(lua_State *L, const std::list<std::shared_ptr<Affect>> &affects,
                          const std::string &key = "Affects");
void LuaPushProtoObjectAffects(lua_State *L, const std::list<std::shared_ptr<Affect>> &affects);
std::list<std::shared_ptr<Affect>> LuaLoadCharacterAffects(lua_State *L,
                                                           const std::string &key = "Affects");
std::list<std::shared_ptr<Affect>> LuaLoadObjectAffects(lua_State *L,
                                                        const std::string &key = "Affects");
std::list<std::shared_ptr<Affect>> LuaLoadProtoObjectAffects(lua_State *L,
                                                             const std::string &key = "Affects");
void LuaPushObjects(lua_State *L, const std::list<std::shared_ptr<Object>> &objects,
                    const std::string &key = "Objects");
std::list<std::shared_ptr<Object>> LuaLoadObjects(lua_State *L, const std::string &key = "Objects");
void LuaPushMobiles(lua_State *L, const std::list<std::shared_ptr<Character>> &mobiles,
                    const std::string &key = "Mobiles");
std::list<std::shared_ptr<Character>> LuaLoadMobiles(lua_State *L, const std::string &key);
void LuaPushVector3(lua_State *L, std::shared_ptr<Vector3> v, const std::string &key);
void LuaLoadVector3(lua_State *L, std::shared_ptr<Vector3> vec, const std::string &key);
void LuaPushSaveVs(lua_State *L, const SaveVs *saveVs, const std::string &key = "SaveVs");
void LuaPushStats(lua_State *L, const Stats *stats, const std::string &key);
void LuaLoadStats(lua_State *L, Stats *stats, const std::string &key);
void LuaPushCurrentAndMax(lua_State *L, const std::string &key, int current, int max);
void LuaLoadCurrentAndMax(lua_State *L, const std::string &key, int *current, int *max);
void LuaPushOvalues(lua_State *L, const std::array<int, MAX_OVAL> values);
void LuaLoadOvalues(lua_State *L, std::array<int, MAX_OVAL> &values);
void LuaPushExtraDescriptions(lua_State *L,
                              const std::list<std::shared_ptr<ExtraDescription>> &extras);
std::list<std::shared_ptr<ExtraDescription>> LuaLoadExtraDescriptions(lua_State *L);
void LuaPushCharacter(lua_State *L, std::shared_ptr<Character> ch,
                      std::function<void(lua_State *, std::shared_ptr<Character>)> pushExtra);
void LuaLoadCharacter(lua_State *L, std::shared_ptr<Character> ch,
                      std::function<void(lua_State *, std::shared_ptr<Character>)> loadExtra);

#define PushCurrentAndMax( L, key, structure ) LuaPushCurrentAndMax( (L), (key), (structure.Current), (structure.Max) )
#define LoadCurrentAndMax( L, key, structure ) LuaLoadCurrentAndMax( (L), (key), (&structure.Current), (&structure.Max) )
void LuaPushMudProgs(lua_State *L, const MProg *mprog);
void LuaPushSpecFun(lua_State *L, size_t idx,
                    std::function<bool(std::shared_ptr<Character>)> specfun);
void LuaLoadSpecFun(lua_State *L, size_t idx,
                    std::vector<std::function<bool(std::shared_ptr<Character>)>> *specfuns);

template<typename EntityT>
void AssignSpecFuns(const EntityT &mob,
                    const std::vector<std::function<bool(std::shared_ptr<Character>)>> &specfuns)
{
    if(!specfuns.empty())
    {
        mob->spec_fun = specfuns[0];

        if(specfuns.size() > 1)
        {
            mob->spec_2 = specfuns[1];
        }
    }
}

void LuaPushVnumConstants();
void LuaLoadVnumConstants();

#endif
