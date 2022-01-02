#include <algorithm>
#include <cstdio>
#include <cassert>
#include <imp/runtime/runtimescope.hpp>
#include "mud.hpp"
#include "luascript.hpp"
#include "log.hpp"
#include "stats.hpp"
#include "object.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "protoobject.hpp"
#include "room.hpp"
#include "race.hpp"
#include "protomob.hpp"
#include "repos/objectrepository.hpp"
#include "impscript/imp.hpp"

static void SetLuaPath(lua_State *);
static void LuaPushOneSmaugAffect(lua_State *L, std::shared_ptr<SmaugAffect> affect, int idx);

lua_State *CreateLuaState()
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    SetLuaPath(L);

    return L;
}

lua_State *CreateChildThread(lua_State *master)
{
    lua_State *new_thread = lua_newthread(master);

    lua_pushthread(new_thread);
    lua_newtable(new_thread);
    lua_pushvalue(new_thread, -1);
    lua_setmetatable(new_thread, -2);
    lua_getglobal(new_thread, "_G");
    lua_setfield(new_thread, -2, "__index");
    lua_setupvalue(new_thread, 1, 1);
    lua_pop(new_thread, 1);
    return new_thread;
}

static void SetLuaPath(lua_State *L)
{
    char path[MAX_STRING_LENGTH];
    sprintf(path, "%s?.lua;;", SCRIPT_DIR);
    lua_getglobal(L, "package");
    lua_pushstring(L, path);
    lua_setfield(L, -2, "path");
    lua_pop(L, 1);
}

bool FieldExists(lua_State *L, const std::string &key)
{
    bool exists = false;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        exists = true;
    }

    lua_pop(L, 1);
    return exists;
}

void LuaSetfieldString(lua_State *L, const std::string &key, const std::string &value)
{
    lua_pushstring(L, value.c_str());
    lua_setfield(L, -2, key.c_str());
}

void LuaSetfieldNumber(lua_State *L, const std::string &key, double value)
{
    lua_pushnumber(L, value);
    lua_setfield(L, -2, key.c_str());
}

void LuaSetfieldBoolean(lua_State *L, const std::string &key, bool value)
{
    lua_pushboolean(L, value);
    lua_setfield(L, -2, key.c_str());
}

static void LuaToString(lua_State *L, int idx, std::string *value)
{
    *value = lua_tostring(L, idx);
}

static void LuaToInt(lua_State *L, int idx, int *value)
{
    *value = lua_tointeger(L, idx);
}

static void LuaToLong(lua_State *L, int idx, long *value)
{
    *value = static_cast<long>(lua_tonumber(L, idx));
}

static void LuaToShort(lua_State *L, int idx, short *value)
{
    *value = static_cast<short>(lua_tonumber(L, idx));
}

static void LuaToBool(lua_State *L, int idx, bool *value)
{
    *value = lua_toboolean(L, idx);
}

static void LuaToDouble(lua_State *L, int idx, double *value)
{
    *value = lua_tonumber(L, idx);
}

void LuaGetfieldString(lua_State *L, const std::string &key, std::string *value)
{
    LuaGetfield<std::string>(L, key, value, LuaToString);
}

void LuaGetfieldInt(lua_State *L, const std::string &key, int *value)
{
    LuaGetfield<int>(L, key, value, LuaToInt);
}

void LuaGetfieldBool(lua_State *L, const std::string &key, bool *value)
{
    LuaGetfield<bool>(L, key, value, LuaToBool);
}

void LuaGetfieldLong(lua_State *L, const std::string &key, long *value)
{
    LuaGetfield<long>(L, key, value, LuaToLong);
}

void LuaGetfieldShort(lua_State *L, const std::string &key, short *value)
{
    LuaGetfield<short>(L, key, value, LuaToShort);
}

void LuaGetfieldDouble(lua_State *L, const std::string &key, double *value)
{
    LuaGetfield<double>(L, key, value, LuaToDouble);
}

void LuaLoadDataFile(const std::string &filename,
                     int(*callback)(lua_State *L),
                     const std::string &callbackFunctionName,
                     void *userData)
{
    lua_State *L = CreateLuaState();

    lua_pushcfunction(L, callback);
    lua_setglobal(L, callbackFunctionName.c_str());

    if(userData != nullptr)
    {
        lua_pushlightuserdata(L, userData);
        lua_setglobal(L, "UserData");
    }
    
    int error = luaL_loadfile(L, filename.c_str());

    if(error)
    {
        Log->Bug("Cannot run file %s: %s",
                 filename.c_str(), lua_tostring(L, -1));
        return;
    }

    error = lua_pcall(L, 0, 0, 0);

    if(error)
    {
        Log->Bug("Cannot pcall %s in file %s: %s",
                 callbackFunctionName.c_str(), filename.c_str(), lua_tostring(L, -1));
        return;
    }

    lua_close(L);
}

void LuaSaveDataFile(lua_State *L, const std::string &filename, const std::string &data)
{
    char buffer[MAX_STRING_LENGTH];
    sprintf(buffer, "%ssavers.lua", SCRIPT_DIR);
    int error = luaL_dofile(L, buffer);

    if(error)
    {
        Log->Bug("%s:%s():%d: Cannot run file: %s\n",
                 __FILE__, __FUNCTION__, __LINE__, lua_tostring(L, -1));
    }
    else
    {
        sprintf(buffer, "save%s", data.c_str());
        lua_getfield(L, -1, buffer);
        lua_getglobal(L, data.c_str());
        lua_pushstring(L, filename.c_str());

        error = lua_pcall(L, 2, 0, 0);

        if(error)
        {
            Log->Bug("%s:%s():%d: Cannot run file: %s\n",
                     __FILE__, __FUNCTION__, __LINE__, lua_tostring(L, -1));
        }
    }
}

void LuaPushFlags(lua_State *L, const std::bitset<Flag::MAX> &flags,
                  const std::array<const char *const, Flag::MAX> &nameArray,
                  const std::string &key)
{
    LuaPushFlags(L, flags.to_ulong(), nameArray.data(), key);
}

void LuaPushFlags(lua_State *L, unsigned long flags,
                  const std::array<const char *const, Flag::MAX> &nameArray,
                  const std::string &key)
{
    LuaPushFlags(L, flags, nameArray.data(), key);
}

void LuaPushFlags(lua_State *L, const std::bitset<Flag::MAX> &flags,
                  const char *const nameArray[], const std::string &key)
{
    LuaPushFlags(L, flags.to_ulong(), nameArray, key);
}

void LuaPushFlags(lua_State *L, unsigned long flags,
                  const char *const nameArray[], const std::string &key)
{
    if(flags)
    {
        lua_pushstring(L, key.c_str());
        lua_newtable(L);

        for(size_t bit = 0; bit < Flag::MAX; ++bit)
        {
            unsigned int mask = 1 << bit;

            if(IsBitSet(flags, mask))
            {
                lua_pushinteger(L, bit);
                lua_pushstring(L, nameArray[bit]);
                lua_settable(L, -3);
            }
        }

        lua_settable(L, -3);
    }
}

void LuaPushLanguages(lua_State *L, unsigned long languages, const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    for(size_t bit = 0; bit < LANG_MAX; ++bit)
    {
        unsigned int mask = 1 << bit;

        if(IsBitSet(languages, mask))
        {
            lua_pushinteger(L, bit);
            lua_pushstring(L, LanguageNames[bit]);
            lua_settable(L, -3);
        }
    }

    lua_settable(L, -3);
}

std::bitset<Flag::MAX> LuaLoadFlags(lua_State *L, const std::string &key)
{
    std::bitset<Flag::MAX> flags;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            size_t bit = lua_tointeger(L, -2);

            if(bit < Flag::MAX)
            {
                flags.set(bit);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);

    return flags;
}

static std::shared_ptr<SmaugAffect> LuaLoadOneSmaugAffect(lua_State *L)
{
    std::shared_ptr<SmaugAffect> affect = std::make_shared<SmaugAffect>();
    LuaGetfieldString(L, "Duration", &affect->Duration);
    LuaGetfieldString(L, "Modifier", &affect->Modifier);
    LuaGetfieldInt(L, "Location", &affect->Location);
    LuaGetfieldString(L, "AffectedBy",
                      [affect](const std::string &value)
                      {
                          unsigned long bit = GetAffectFlag(value);
                          affect->AffectedBy = CreateBitSet<Flag::MAX>({ bit });
                      });
    return affect;
}

std::list<std::shared_ptr<SmaugAffect>> LuaLoadSmaugAffects(lua_State *L)
{
    std::list<std::shared_ptr<SmaugAffect>> affectList;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Affects");

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            auto affect = LuaLoadOneSmaugAffect(L);
            affectList.push_front(affect);
            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);

    return affectList;
}

static void LuaPushOneSmaugAffect(lua_State *L, std::shared_ptr<SmaugAffect> affect, int idx)
{
    lua_pushinteger(L, ++idx);
    lua_newtable(L);

    if(!affect->Duration.empty())
    {
        LuaSetfieldString(L, "Duration", affect->Duration);
    }

    if(affect->Location)
    {
        LuaSetfieldNumber(L, "Location", affect->Location);
    }

    if(!affect->Modifier.empty())
    {
        LuaSetfieldString(L, "Modifier", affect->Modifier);
    }

    if(affect->AffectedBy.any())
    {
        for(size_t x = 0; x < AffectFlags.size(); ++x)
        {
            if(affect->AffectedBy.test(x))
            {
                LuaSetfieldString(L, "AffectedBy", AffectFlags[x]);
                break;
            }
        }
    }

    lua_settable(L, -3);
}

void LuaPushSmaugAffects(lua_State *L, const std::list<std::shared_ptr<SmaugAffect>> &affectList)
{
    if(!affectList.empty())
    {
        int idx = 0;
        lua_pushstring(L, "Affects");
        lua_newtable(L);

        for(auto affect : affectList)
        {
            LuaPushOneSmaugAffect(L, affect, ++idx);
        }

        lua_settable(L, -3);
    }
}

void LuaPushVector3(lua_State *L, const Vector3 &v, const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    LuaSetfieldNumber(L, "X", v.x);
    LuaSetfieldNumber(L, "Y", v.y);
    LuaSetfieldNumber(L, "Z", v.z);

    lua_settable(L, -3);
}

Vector3 LuaLoadVector3(lua_State *L, const std::string &key)
{
    Vector3 v;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        LuaGetfieldDouble(L, "X", &v.x);
        LuaGetfieldDouble(L, "Y", &v.y);
        LuaGetfieldDouble(L, "Z", &v.z);
    }

    lua_pop(L, 1);
    return v;
}

void LuaPushCurrentAndMax(lua_State *L, const std::string &key, int current, int mx)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    LuaSetfieldNumber(L, "Current", current);
    LuaSetfieldNumber(L, "Max", mx);

    lua_settable(L, -3);
}

void LuaLoadCurrentAndMax(lua_State *L, const std::string &key, int *current, int *mx)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        LuaGetfieldInt(L, "Current", current);
        LuaGetfieldInt(L, "Max", mx);
    }

    lua_pop(L, 1);
}

static void LuaPushCharacterAffect(lua_State *L, std::shared_ptr<Affect> affect, int idx)
{
    std::shared_ptr<Skill> skill = GetSkill(affect->Type);

    if(affect->Type >= 0 && skill == nullptr)
    {
        return;
    }

    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldNumber(L, "Duration", affect->Duration);
    LuaSetfieldNumber(L, "Location", affect->Location);

    if(affect->Location >= 0 && affect->Location < static_cast<int>(AffectTypes.size()))
    {
        LuaSetfieldString(L, "AffectType", AffectTypes[affect->Location]);
    }

    LuaSetfieldNumber(L, "Modifier", affect->Modifier);

    if(affect->Type >= 0 && affect->Type < TYPE_PERSONAL)
    {
        LuaSetfieldString(L, "Skill", skill->Name);
    }
    else
    {
        LuaSetfieldNumber(L, "Type", affect->Type);
    }

    if(affect->AffectedBy.any())
    {
        for(size_t x = 0; x < AffectFlags.size(); ++x)
        {
            if(affect->AffectedBy.test(x))
            {
                LuaSetfieldString(L, "AffectedBy", AffectFlags[x]);
                break;
            }
        }
    }

    lua_settable(L, -3);
}

static void LuaPushProtoObjectAffect(lua_State *L, std::shared_ptr<Affect> affect, int idx)
{
    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldNumber(L, "Location", affect->Location);
    LuaSetfieldNumber(L, "Modifier",
                      (affect->Location == APPLY_WEAPONSPELL
                       || affect->Location == APPLY_WEARSPELL
                       || affect->Location == APPLY_REMOVESPELL
                       || affect->Location == APPLY_STRIPSN)
                      && IS_VALID_SN(affect->Modifier)
                      ? SkillTable[affect->Modifier]->Slot : affect->Modifier);

    lua_settable(L, -3);
}

static void LuaPushObjectAffect(lua_State *L, std::shared_ptr<Affect> affect, int idx)
{
    std::shared_ptr<Skill> skill = GetSkill(affect->Type);

    if(affect->Type >= 0 && skill == nullptr)
    {
        return;
    }

    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldNumber(L, "Duration", affect->Duration);
    LuaSetfieldNumber(L, "Location", affect->Location);

    if(affect->Location >= 0 && affect->Location < static_cast<int>(AffectTypes.size()))
    {
        LuaSetfieldString(L, "AffectType", AffectTypes[affect->Location]);
    }

    LuaSetfieldNumber(L, "Modifier",
                      (affect->Location == APPLY_WEAPONSPELL
                       || affect->Location == APPLY_WEARSPELL
                       || affect->Location == APPLY_REMOVESPELL
                       || affect->Location == APPLY_STRIPSN)
                      && IS_VALID_SN(affect->Modifier)
                      ? SkillTable[affect->Modifier]->Slot : affect->Modifier);

    if(affect->Type >= 0 && affect->Type < TopSN)
    {
        LuaSetfieldString(L, "Skill", skill->Name);
    }
    else
    {
        LuaSetfieldNumber(L, "Type", affect->Type);
    }

    if(affect->AffectedBy.any())
    {
        for(size_t x = 0; x < AffectFlags.size(); ++x)
        {
            if(affect->AffectedBy.test(x))
            {
                LuaSetfieldString(L, "AffectedBy", AffectFlags[x]);
                break;
            }
        }
    }

    lua_settable(L, -3);
}

static void LuaPushAffects(lua_State *L, const std::list<std::shared_ptr<Affect>> &affects,
                           const std::string &key,
                           std::function<void(lua_State *, std::shared_ptr<Affect>, int)> pushOneAffect)
{
    if(!affects.empty())
    {
        int idx = 0;
        lua_pushstring(L, "Affects");
        lua_newtable(L);

        for(auto affect : affects)
        {
            pushOneAffect(L, affect, ++idx);
        }

        lua_settable(L, -3);
    }
}

void LuaPushCharacterAffects(lua_State *L, const std::list<std::shared_ptr<Affect>> &affects,
                             const std::string &key)
{
    LuaPushAffects(L, affects, key, LuaPushCharacterAffect);
}

void LuaPushObjectAffects(lua_State *L, const std::list<std::shared_ptr<Affect>> &affects,
                          const std::string &key)
{
    LuaPushAffects(L, affects, key, LuaPushObjectAffect);
}

void LuaPushProtoObjectAffects(lua_State *L, const std::list<std::shared_ptr<Affect>> &affects)
{
    LuaPushAffects(L, affects, "Affects", LuaPushProtoObjectAffect);
}

void LuaPushExtraDescriptions(lua_State *L, const std::list<std::shared_ptr<ExtraDescription>> &extras)
{
    lua_pushstring(L, "ExtraDescriptions");
    lua_newtable(L);
    size_t idx = 0;

    for(auto ed : extras)
    {
        lua_pushinteger(L, ++idx);
        lua_newtable(L);

        LuaSetfieldString(L, "Keyword", ed->Keyword);
        LuaSetfieldString(L, "Description", ed->Description);

        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

std::list<std::shared_ptr<ExtraDescription>> LuaLoadExtraDescriptions(lua_State *L)
{
    std::list<std::shared_ptr<ExtraDescription>> extraDescriptions;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "ExtraDescriptions");

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            auto ed = std::make_shared<ExtraDescription>();
            LuaGetfieldString(L, "Keyword", &ed->Keyword);
            LuaGetfieldString(L, "Description", &ed->Description);
            extraDescriptions.push_back(ed);
            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);

    return extraDescriptions;
}

void LuaPushOvalues(lua_State *L, const std::array<int, MAX_OVAL> values)
{
    lua_pushstring(L, "ObjectValues");
    lua_newtable(L);

    for(size_t i = 0; i < values.size(); ++i)
    {
        lua_pushinteger(L, i);
        lua_pushinteger(L, values[i]);
        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

void LuaLoadOvalues(lua_State *L, std::array<int, MAX_OVAL> &values)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "ObjectValues");

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            size_t subscript = lua_tointeger(L, -2);
            int value = lua_tointeger(L, -1);

            if(subscript < values.size())
            {
                values[subscript] = value;
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

static void LuaPushObject(lua_State *L, std::shared_ptr<Object> obj, size_t idx)
{
    /*
     * Castrate storage characters.
     */
    if(obj->ItemType == ITEM_KEY && !obj->Flags.test(Flag::Obj::ClanObject))
    {
        return;
    }

    /*
     * Catch deleted objects                                      -Thoric
     */
    if(IsObjectExtracted(obj))
    {
        return;
    }

    /*
     * Do NOT save prototype items!                               -Thoric
     */
    if(obj->Flags.test(Flag::Obj::Prototype))
    {
        return;
    }

    lua_pushinteger(L, idx);
    lua_newtable(L);
    std::shared_ptr<ProtoObject> proto = obj->Prototype;

    LuaSetfieldString(L, "Vnum", VnumOrTag(proto));

    if(obj->Count > 1)
    {
        LuaSetfieldNumber(L, "Count", obj->Count);
    }

    if(StrCmp(obj->Name, proto->Name) != 0)
    {
        LuaSetfieldString(L, "Name", obj->Name);
    }

    if(StrCmp(obj->ShortDescr, proto->ShortDescr) != 0)
    {
        LuaSetfieldString(L, "ShortDescription", obj->ShortDescr);
    }

    if(StrCmp(obj->Description, proto->Description) != 0)
    {
        LuaSetfieldString(L, "Description", obj->Description);
    }

    if(StrCmp(obj->ActionDescription, proto->ActionDescription) != 0)
    {
        LuaSetfieldString(L, "ActionDescription", obj->ActionDescription);
    }

    if(obj->InRoom != nullptr)
    {
        LuaSetfieldString(L, "InRoom", VnumOrTag(obj->InRoom));
    }

    if(obj->Flags != proto->Flags)
    {
        LuaPushFlags(L, obj->Flags, ObjectFlags, "Flags");
    }

    if(obj->WearFlags != proto->WearFlags)
    {
        LuaPushFlags(L, obj->WearFlags, WearFlags, "WearFlags");
    }

    if(obj->ItemType != proto->ItemType)
    {
        LuaSetfieldString(L, "ItemType", ObjectTypes[obj->ItemType]);
    }

    if(obj->Weight != proto->Weight)
    {
        LuaSetfieldNumber(L, "Weight", obj->Weight);
    }

    if(obj->Cost != proto->Cost)
    {
        LuaSetfieldNumber(L, "Cost", obj->Cost);
    }

    if(std::any_of(std::cbegin(obj->Value), std::cend(obj->Value),
                   [](const auto v)
                   {
                       return v != 0;
                   }))
    {
        LuaPushOvalues(L, obj->Value);
    }

    if(obj->Level != 0)
    {
        LuaSetfieldNumber(L, "Level", obj->Level);
    }

    if(obj->Timer != 0)
    {
        LuaSetfieldNumber(L, "Timer", obj->Timer);
    }

    int wear_loc = -1;

    if(obj->CarriedBy != nullptr)
    {
        auto &save_equipment = GetSaveEquipment(obj->CarriedBy);
        
        for(size_t wear = 0; wear < MAX_WEAR; wear++)
        {
            for(size_t x = 0; x < MAX_LAYERS; x++)
            {
                if(obj == save_equipment[wear][x])
                {
                    wear_loc = wear;
                    break;
                }
                else if(save_equipment[wear][x] == nullptr)
                {
                    break;
                }
            }
        }
    }
    
    if(wear_loc != -1)
    {
        LuaSetfieldNumber(L, "WearLocation", wear_loc);
    }

    switch(obj->ItemType)
    {
    case ITEM_PILL:
    case ITEM_POTION:
        if(IS_VALID_SN(obj->Value[OVAL_PILL_SPELL1]))
        {
            LuaSetfieldString(L, "Spell1",
                              SkillTable[obj->Value[OVAL_PILL_SPELL1]]->Name);
        }

        if(IS_VALID_SN(obj->Value[OVAL_PILL_SPELL2]))
        {
            LuaSetfieldString(L, "Spell2",
                              SkillTable[obj->Value[OVAL_PILL_SPELL2]]->Name);
        }

        if(IS_VALID_SN(obj->Value[OVAL_PILL_SPELL3]))
        {
            LuaSetfieldString(L, "Spell3",
                              SkillTable[obj->Value[OVAL_PILL_SPELL3]]->Name);
        }
        break;

    case ITEM_DEVICE:
        if(IS_VALID_SN(obj->Value[OVAL_DEVICE_SPELL]))
        {
            LuaSetfieldString(L, "Spell3",
                              SkillTable[obj->Value[OVAL_DEVICE_SPELL]]->Name);
        }
        break;

    case ITEM_SALVE:
        if(IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL1]))
        {
            LuaSetfieldString(L, "Spell4",
                              SkillTable[obj->Value[OVAL_SALVE_SPELL1]]->Name);
        }

        if(IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL2]))
        {
            LuaSetfieldString(L, "Spell5",
                              SkillTable[obj->Value[OVAL_SALVE_SPELL2]]->Name);
        }

        break;

    default:
        break;
    }

    LuaPushObjectAffects(L, obj->Affects(), "Affects");
    LuaPushExtraDescriptions(L, obj->ExtraDescriptions());
    LuaPushObjects(L, obj->Objects(), "Contents");
    lua_settable(L, -3);
}

void LuaPushObjects(lua_State *L, const std::list<std::shared_ptr<Object>> &objects,
                    const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);
    size_t idx = 0;

    for(auto obj : objects)
    {
        LuaPushObject(L, obj, ++idx);
    }

    lua_settable(L, -3);
}

void LuaPushSpecFun(lua_State *L, size_t idx,
                    std::function<bool(std::shared_ptr<Character>)> specfun)
{
    lua_pushinteger(L, idx);
    lua_pushstring(L, LookupSpecial(specfun).c_str());
    lua_settable(L, -3);
}

static void LuaPushMobile(lua_State *L, std::shared_ptr<Character> mob)
{
    assert(IsNpc(mob));
    auto proto = mob->Prototype;

    LuaSetfieldString(L, "Vnum", VnumOrTag(proto));
    LuaSetfieldString(L, "CharacterType", "Mobile");

    auto mobflags = mob->Flags;
    mobflags.reset(Flag::Mob::Mounted);
    LuaPushFlags(L, mobflags, MobFlags, "Flags");

    if(StrCmp(mob->ShortDescr, proto->ShortDescr) != 0)
    {
        LuaSetfieldString(L, "ShortDescription", mob->ShortDescr);
    }

    if(StrCmp(mob->LongDescr, proto->LongDescr) != 0)
    {
        LuaSetfieldString(L, "LongDescription", mob->LongDescr);
    }

    std::vector<std::function<bool(std::shared_ptr<Character>)>> specfuns;

    const auto mobspec1ptr = mob->SpecFuns[0].target<bool(*)(std::shared_ptr<Character>)>();
    const auto protospec1ptr = proto->SpecFuns[0].target<bool(*)(std::shared_ptr<Character>)>();
    
    if(mobspec1ptr != nullptr
       && protospec1ptr != nullptr
       && *mobspec1ptr != *protospec1ptr)
    {
        specfuns.push_back(mob->SpecFuns[0]);
    }

    const auto mobspec2ptr = mob->SpecFuns[1].target<bool(*)(std::shared_ptr<Character>)>();
    const auto protospec2ptr = proto->SpecFuns[1].target<bool(*)(std::shared_ptr<Character>)>();

    if(mobspec2ptr != nullptr
       && protospec2ptr != nullptr
       && *mobspec2ptr != *protospec2ptr)
    {
        specfuns.push_back(mob->SpecFuns[1]);
    }
    
    LuaPushCollection(L, specfuns, "SpecFuns", LuaPushSpecFun);

    if(mob->NumberOfAttacks != proto->NumberOfAttacks)
    {
        LuaSetfieldNumber(L, "NumberOfAttacks", mob->NumberOfAttacks);
    }

    if(mob->AttackFlags != proto->AttackFlags)
    {
        LuaPushFlags(L, mob->AttackFlags, AttackFlags, "AttackFlags");
    }

    if(mob->DefenseFlags != proto->DefenseFlags)
    {
        LuaPushFlags(L, mob->DefenseFlags, DefenseFlags, "DefenseFlags");
    }

    if(mob->Alignment != proto->Alignment)
    {
        LuaSetfieldNumber(L, "Alignment", mob->Alignment);
    }

    if(mob->ArmorClass != proto->ArmorClass)
    {
        LuaSetfieldNumber(L, "ArmorClass", mob->ArmorClass);
    }
}

void LuaPushMobiles(lua_State *L, const std::list<std::shared_ptr<Character>> &mobiles,
                    const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);
    size_t idx = 0;

    for(std::shared_ptr<Character> mob : mobiles)
    {
        lua_pushinteger(L, ++idx);
        lua_newtable(L);
        LuaPushCharacter(L, mob, LuaPushMobile);
        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

void LuaPushSaveVs(lua_State *L, const SaveVs *saveVs, const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    LuaSetfieldNumber(L, "PoisonDeath", saveVs->PoisonDeath);
    LuaSetfieldNumber(L, "Wand", saveVs->Wand);
    LuaSetfieldNumber(L, "ParaPetri", saveVs->ParaPetri);
    LuaSetfieldNumber(L, "Breath", saveVs->Breath);
    LuaSetfieldNumber(L, "SpellStaff", saveVs->SpellStaff);

    lua_settable(L, -3);
}

void LuaPushStats(lua_State *L, const Stats *stats, const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    LuaSetfieldNumber(L, "Strength", stats->Str);
    LuaSetfieldNumber(L, "Intelligence", stats->Int);
    LuaSetfieldNumber(L, "Wisdom", stats->Wis);
    LuaSetfieldNumber(L, "Dexterity", stats->Dex);
    LuaSetfieldNumber(L, "Constitution", stats->Con);
    LuaSetfieldNumber(L, "Charisma", stats->Cha);
    LuaSetfieldNumber(L, "Luck", stats->Lck);
    LuaSetfieldNumber(L, "Force", stats->Frc);

    lua_settable(L, -3);
}

void LuaLoadStats(lua_State *L, Stats *stats, const std::string &key)
{
    int outer_idx = lua_gettop(L);
    lua_getfield(L, outer_idx, key.c_str());

    if(!lua_isnil(L, ++outer_idx))
    {
        LuaGetfieldInt(L, "Strength", &stats->Str);
        LuaGetfieldInt(L, "Intelligence", &stats->Int);
        LuaGetfieldInt(L, "Wisdom", &stats->Wis);
        LuaGetfieldInt(L, "Dexterity", &stats->Dex);
        LuaGetfieldInt(L, "Constitution", &stats->Con);
        LuaGetfieldInt(L, "Charisma", &stats->Cha);
        LuaGetfieldInt(L, "Luck", &stats->Lck);
        LuaGetfieldInt(L, "Force", &stats->Frc);
    }

    lua_pop(L, 1);
}

static void LuaPushCharacterAbilities(lua_State *L, std::shared_ptr<Character> ch)
{
    if(!ch->IsNpc())
    {
        lua_pushstring(L, "Abilities");
        lua_newtable(L);

        for(int ability = 0; ability < (int)AbilityClass::Max; ++ability)
        {
            lua_pushinteger(L, ability);
            lua_newtable(L);

            LuaSetfieldString(L, "Name", AbilityName[ability]);
            LuaSetfieldNumber(L, "Level", GetAbilityLevel(ch, AbilityClass(ability)));
            LuaSetfieldNumber(L, "Experience", GetAbilityXP(ch, AbilityClass(ability)));
            LuaSetfieldBoolean(L, "IsMain", AbilityClass(ability) == ch->Ability.Main);
            lua_settable(L, -3);
        }

        lua_settable(L, -3);
    }
}

static void LuaPushCharacterSaves(lua_State *L, std::shared_ptr<Character> ch)
{
    LuaPushSaveVs(L, &ch->Saving, "SaveVs");
}

static void LuaPushCharacterStats(lua_State *L, std::shared_ptr<Character> ch)
{
    LuaPushStats(L, &ch->PermStats, "PermanentStats");
    LuaPushStats(L, &ch->StatMods, "StatModifiers");
}

static void LuaPushRuntimeData(lua_State *L, std::shared_ptr<Imp::RuntimeScope> scope)
{
    auto data = scope->Serialize();
    auto pushData = [](lua_State *luaState, size_t idx, std::string line)
                    {
                        lua_pushinteger(luaState, idx);
                        lua_pushstring(luaState, line.c_str());
                        lua_settable(luaState, -3);
                    };
    LuaPushCollection(L, data, "RuntimeData", pushData);
}

void LuaPushCharacter(lua_State *L, std::shared_ptr<Character> ch,
                      std::function<void(lua_State *, std::shared_ptr<Character>)> pushExtra)
{
    DeEquipCharacter(ch);

    LuaSetfieldString(L, "Name", ch->Name);
    LuaSetfieldString(L, "Description", ch->Description);
    LuaSetfieldString(L, "Gender",
                      ch->Sex == SEX_MALE ? "Male" : ch->Sex == SEX_FEMALE ? "Female" : "Neutral");
    LuaSetfieldString(L, "Race", RaceTable[ch->Race].Name);
    LuaSetfieldNumber(L, "Speaks", ch->Speaks);
    LuaSetfieldNumber(L, "Speaking", ch->Speaking);
    LuaSetfieldNumber(L, "Level", ch->TopLevel());
    LuaSetfieldNumber(L, "Trust", ch->Trust);
    LuaSetfieldString(L, "InRoom",
                      ch->InRoom == GetRoom(ROOM_VNUM_LIMBO) && ch->WasInRoom
                      ? VnumOrTag(ch->WasInRoom) : VnumOrTag(ch->InRoom));
    PushCurrentAndMax(L, "HitPoints", ch->HitPoints);
    PushCurrentAndMax(L, "ForcePoints", ch->Mana);
    PushCurrentAndMax(L, "Fatigue", ch->Fatigue);
    LuaSetfieldNumber(L, "Credits", ch->Gold);
    LuaSetfieldString(L, "Position",
                      PositionName[ch->Position == POS_FIGHTING ? POS_STANDING : ch->Position]);
    LuaSetfieldNumber(L, "HitRoll", ch->HitRoll);
    LuaSetfieldNumber(L, "DamRoll", ch->DamRoll);
    LuaSetfieldNumber(L, "Wimpy", ch->Wimpy);
    LuaSetfieldNumber(L, "MentalState", ch->MentalState);

    LuaPushFlags(L, ch->AffectedBy, AffectFlags, "AffectedBy");
    LuaPushFlags(L, ch->Deaf, ChannelNames, "IgnoreChannels");
    LuaPushFlags(L, ch->Resistant, RisFlags, "Resistant");
    LuaPushFlags(L, ch->Immune, RisFlags, "Immune");
    LuaPushFlags(L, ch->Susceptible, RisFlags, "Susceptible");

    LuaPushCharacterAbilities(L, ch);
    LuaPushCharacterSaves(L, ch);
    LuaPushCharacterStats(L, ch);

    LuaPushCharacterAffects(L, ch->Affects());
    LuaPushObjects(L, ch->Objects(), "Inventory");

    LuaPushRuntimeData(L, ch->RuntimeData());
    
    pushExtra(L, ch);
    
    ReEquipCharacter(ch);
}

void LuaGetfieldBool(lua_State *L, const std::string &key,
                     std::function<void(bool)> assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        bool value = lua_toboolean(L, idx);
        assignValue(value);
    }

    lua_pop(L, 1);
}

void LuaGetfieldInt(lua_State *L, const std::string &key,
                    std::function<void(int)> assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        int value = lua_tointeger(L, idx);
        assignValue(value);
    }

    lua_pop(L, 1);
}

void LuaGetfieldLong(lua_State *L, const std::string &key,
                     std::function<void(long)> assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        long value = static_cast<long>(lua_tonumber(L, idx));
        assignValue(value);
    }

    lua_pop(L, 1);
}

void LuaGetfieldShort(lua_State *L, const std::string &key,
                      std::function<void(short)> assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        short value = static_cast<short>(lua_tonumber(L, idx));
        assignValue(value);
    }

    lua_pop(L, 1);
}

void LuaGetfieldDouble(lua_State *L, const std::string &key,
                       std::function<void(double)> assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        double value = lua_tonumber(L, idx);
        assignValue(value);
    }

    lua_pop(L, 1);
}

void LuaGetfieldString(lua_State *L, const std::string &key,
                       std::function<void(const std::string &)> assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        std::string value = lua_tostring(L, idx);
        assignValue(value);
    }

    lua_pop(L, 1);
}

static void LoadAbility(lua_State *L, std::shared_ptr<Character> ch, size_t ability)
{
    LuaGetfieldInt(L, "Level",
                   [ch, ability](const int level)
                   {
                       SetAbilityLevel(ch, AbilityClass(ability), level);
                   });

    LuaGetfieldInt(L, "Experience",
                   [ch, ability](const int xp)
                   {
                       SetAbilityXP(ch, AbilityClass(ability), xp);
                   });

    LuaGetfieldBool(L, "IsMain",
                    [ch, ability](const bool isMain)
                    {
                        if(isMain)
                        {
                            ch->Ability.Main = AbilityClass(ability);
                        }
                    });
}

static void LuaLoadCharacterAbilities(lua_State *L, std::shared_ptr<Character> ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Abilities");

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            int ability = lua_tointeger(L, -2);

            if(AbilityClass(ability) < AbilityClass::Max)
            {
                LoadAbility(L, ch, ability);
            }
            else
            {
                Log->Bug("%s:%d : %s() : Error loading %s: Ability %d out of range.",
                         __FILE__, __LINE__, __FUNCTION__,
                         ch->Name.c_str(), ability);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

static void LuaLoadCharacterSaves(lua_State *L, std::shared_ptr<Character> ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "SaveVs");

    if(!lua_isnil(L, ++idx))
    {
        LuaGetfieldInt(L, "PoisonDeath", &ch->Saving.PoisonDeath);
        LuaGetfieldInt(L, "Wand", &ch->Saving.Wand);
        LuaGetfieldInt(L, "ParaPetri", &ch->Saving.ParaPetri);
        LuaGetfieldInt(L, "Breath", &ch->Saving.Breath);
        LuaGetfieldInt(L, "SpellStaff", &ch->Saving.SpellStaff);
    }

    lua_pop(L, 1);
}

static void LuaLoadCharacterStats(lua_State *L, std::shared_ptr<Character> ch)
{
    LuaLoadStats(L, &ch->PermStats, "PermanentStats");
    LuaLoadStats(L, &ch->StatMods, "StatModifiers");
}

static std::shared_ptr<Affect> LuaLoadCharacterAffect(lua_State *L)
{
    Affect affect;

    LuaGetfieldInt(L, "Duration", &affect.Duration);
    LuaGetfieldInt(L, "Location", &affect.Location);
    LuaGetfieldInt(L, "Modifier", &affect.Modifier);
    LuaGetfieldInt(L, "Type", &affect.Type);

    bool error = false;
    LuaGetfieldString(L, "Skill",
                      [&affect, &error](const std::string &skillName)
                      {
                          int sn = LookupSkill(skillName);

                          if(sn < 0)
                          {
                              sn = LookupHerb(skillName);

                              if(sn >= 0)
                              {
                                  sn += TYPE_HERB;
                              }
                              else
                              {
                                  Log->Bug("%s (%d): unknown skill %s.",
                                           __FUNCTION__, __LINE__, skillName.c_str());
                                  error = true;
                              }
                          }

                          affect.Type = sn;
                      });

    if(error)
    {
        return nullptr;
    }

    affect.AffectedBy = LuaLoadFlags(L, "AffectedBy");

    return std::make_shared<Affect>(affect);
}

static std::shared_ptr<Affect> LuaLoadProtoObjectAffect(lua_State *L)
{
    Affect affect;

    LuaGetfieldInt(L, "Location", &affect.Location);
    LuaGetfieldInt(L, "Modifier", &affect.Modifier);
    affect.Type = -1;
    affect.Duration = -1;

    if(affect.Location == APPLY_WEAPONSPELL
       || affect.Location == APPLY_WEARSPELL
       || affect.Location == APPLY_REMOVESPELL
       || affect.Location == APPLY_STRIPSN)
    {
        affect.Modifier = SkillNumberFromSlot(affect.Modifier);
    }

    return std::make_shared<Affect>(affect);
}

static std::shared_ptr<Affect> LuaLoadObjectAffect(lua_State *L)
{
    Affect affect;

    LuaGetfieldInt(L, "Duration", &affect.Duration);
    LuaGetfieldInt(L, "Location", &affect.Location);
    LuaGetfieldInt(L, "Modifier", &affect.Modifier);
    LuaGetfieldInt(L, "Type", &affect.Type);

    bool error = false;
    LuaGetfieldString(L, "Skill",
                      [&affect, &error](const std::string &skillName)
                      {
                          int sn = LookupSkill(skillName);

                          if(sn < 0)
                          {
                              Log->Bug("%s (%d): unknown skill %s.",
                                       __FUNCTION__, __LINE__, skillName.c_str());
                              error = true;
                          }
                          else
                          {
                              affect.Type = sn;
                          }
                      });

    if(error)
    {
        return nullptr;
    }

    affect.AffectedBy = LuaLoadFlags(L, "AffectedBy");

    if(affect.Location == APPLY_WEAPONSPELL
       || affect.Location == APPLY_WEARSPELL
       || affect.Location == APPLY_REMOVESPELL)
    {
        affect.Modifier = SkillNumberFromSlot(affect.Modifier);
    }

    return std::make_shared<Affect>(affect);
}

static std::list<std::shared_ptr<Affect>> LuaLoadAffects(lua_State *L, const std::string &key,
                                                         std::function<std::shared_ptr<Affect>(lua_State *)> loadOneAffect)
{
    std::list<std::shared_ptr<Affect>> affects;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            std::shared_ptr<Affect> affect = loadOneAffect(L);

            if(affect != nullptr)
            {
                affects.push_back(affect);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
    return affects;
}

std::list<std::shared_ptr<Affect>> LuaLoadCharacterAffects(lua_State *L, const std::string &key)
{
    return LuaLoadAffects(L, key, LuaLoadCharacterAffect);
}

std::list<std::shared_ptr<Affect>> LuaLoadObjectAffects(lua_State *L, const std::string &key)
{
    return LuaLoadAffects(L, key, LuaLoadObjectAffect);
}

std::list<std::shared_ptr<Affect>> LuaLoadProtoObjectAffects(lua_State *L, const std::string &key)
{
    return LuaLoadAffects(L, key, LuaLoadProtoObjectAffect);
}

static void ConvertSpellNameToOvalue(lua_State *L, const std::string &key,
                                     std::shared_ptr<Object> obj, size_t idx)
{
    std::string spellName;
    LuaGetfieldString(L, key, &spellName);

    if(!spellName.empty())
    {
        int sn = LookupSkill(spellName);

        if(sn >= 0)
        {
            obj->Value[idx] = sn;
        }
        else
        {
            Log->Bug("%s:%d %s() : Unknown skill '%s'.",
                     __FILE__, __LINE__, __FUNCTION__,
                     spellName.c_str());
        }
    }
}

static void LuaLoadObjectSpells(lua_State *L, std::shared_ptr<Object> obj)
{
    ConvertSpellNameToOvalue(L, "Spell1", obj, 1);
    ConvertSpellNameToOvalue(L, "Spell2", obj, 2);
    ConvertSpellNameToOvalue(L, "Spell3", obj, 3);
    ConvertSpellNameToOvalue(L, "Spell4", obj, 4);
    ConvertSpellNameToOvalue(L, "Spell5", obj, 5);
}

static std::shared_ptr<Object> LuaLoadObject(lua_State *L)
{
    std::string vnumOrTag;
    int level = 0;
    
    LuaGetfieldString(L, "Vnum", &vnumOrTag);
    LuaGetfieldInt(L, "Level", &level);
    std::shared_ptr<ProtoObject> proto = GetProtoObject(vnumOrTag);

    if(proto == nullptr)
    {
        Log->Bug("%s:%d %s : Unknown vnum/tag %s",
                 __FILE__, __LINE__, __FUNCTION__, vnumOrTag.c_str());
        return nullptr;
    }

    auto obj = CreateObject(proto, level);

    LuaGetfieldInt(L, "Count", &obj->Count);
    LuaGetfieldString(L, "Name", &obj->Name);
    LuaGetfieldString(L, "ShortDescription", &obj->ShortDescr);
    LuaGetfieldString(L, "Description", &obj->Description);
    LuaGetfieldString(L, "ActionDescription", &obj->ActionDescription);
    LuaGetfieldString(L, "InRoom",
                    [obj](const auto &vOrT)
                    {
                        obj->InRoom = GetRoom(vOrT);
                    });
    LuaGetfieldString(L, "ItemType",
                      [obj](const std::string &typeName)
                      {
                          ItemTypes type = GetObjectType(typeName);

                          if(type != -1)
                          {
                              obj->ItemType = type;
                          }
                      });
    LuaGetfieldInt(L, "Weight", &obj->Weight);
    LuaGetfieldInt(L, "Cost", &obj->Cost);
    LuaGetfieldInt(L, "Timer", &obj->Timer);
    LuaGetfieldInt(L, "WearLocation", &obj->WearLoc);

    if(FieldExists(L, "Flags"))
    {
        obj->Flags = LuaLoadFlags(L, "Flags");
    }

    if(FieldExists(L, "WearFlags"))
    {
        obj->WearFlags = LuaLoadFlags(L, "WearFlags");
    }

    LuaLoadOvalues(L, obj->Value);
    LuaLoadObjectSpells(L, obj);

    auto affects = LuaLoadObjectAffects(L, "Affects");

    for(auto affect : affects)
    {
        obj->Add(affect);
    }

    auto extraDescriptions = LuaLoadExtraDescriptions(L);

    for(auto extra : extraDescriptions)
    {
        obj->Add(extra);
    }

    if(obj->WearLoc < -1 || obj->WearLoc >= MAX_WEAR)
    {
        obj->WearLoc = WEAR_NONE;
    }

    if(obj->Serial == 0)
    {
        cur_obj_serial = umax((cur_obj_serial + 1) & (BV30 - 1), 1);
        obj->Serial = obj->Prototype->Serial = cur_obj_serial;
    }

    auto contents = LuaLoadObjects(L, "Contents");

    for(auto nestedObject : contents)
    {
        ObjectToObject(nestedObject, obj);
    }

    return obj;
}

std::list<std::shared_ptr<Object>> LuaLoadObjects(lua_State *L, const std::string &key)
{
    std::list<std::shared_ptr<Object>> objects;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            auto obj = LuaLoadObject(L);

            if(obj != nullptr)
            {
                objects.push_back(obj);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
    return objects;
}

void LuaLoadSpecFun(lua_State *L, size_t idx,
                    std::vector<std::function<bool(std::shared_ptr<Character>)>> *specfuns)
{
    std::string specname = lua_tostring(L, -1);
    auto specfun = SpecialLookup(specname);

    if(specfun != nullptr)
    {
        specfuns->push_back(specfun);
    }
}

static void LoadMobileData(lua_State *L, std::shared_ptr<Character> mob)
{
    mob->Flags = LuaLoadFlags(L, "Flags");

    LuaGetfieldString(L, "ShortDescription", &mob->ShortDescr);
    LuaGetfieldString(L, "LongDescription", &mob->LongDescr);

    std::vector<std::function<bool(std::shared_ptr<Character>)>> specfuns;
    LuaLoadArray(L, "SpecFuns", LuaLoadSpecFun, &specfuns);
    AssignSpecFuns(mob, specfuns);

    LuaGetfieldInt(L, "NumberOfAttacks", &mob->NumberOfAttacks);

    if(FieldExists(L, "AttackFlags"))
    {
        mob->AttackFlags = LuaLoadFlags(L, "AttackFlags");
    }

    if(FieldExists(L, "DefenseFlags"))
    {
        mob->DefenseFlags = LuaLoadFlags(L, "DefenseFlags");
    }

    LuaGetfieldInt(L, "Alignment", &mob->Alignment);
    LuaGetfieldInt(L, "ArmorClass", &mob->ArmorClass);
}

std::list<std::shared_ptr<Character>> LuaLoadMobiles(lua_State *L, const std::string &key)
{
    std::list<std::shared_ptr<Character>> mobs;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if(!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while(lua_next(L, -2))
        {
            std::string vnumOrTag;
            LuaGetfieldString(L, "Vnum", &vnumOrTag);
            auto proto = GetProtoMobile(vnumOrTag);

            if(proto != nullptr)
            {
                auto mob = CreateMobile(proto);
                LuaLoadCharacter(L, mob, LoadMobileData);

                if(mob != nullptr)
                {
                    mobs.push_back(mob);
                    CharacterToRoom(mob, mob->InRoom);
                }
            }
            
            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);

    return mobs;
}

static void LoadRuntimeData(lua_State *L, size_t idx,
                            std::vector<std::string> *expressions)
{
    std::string expr = lua_tostring(L, -1);
    expressions->push_back(expr);
}

void LuaLoadCharacter(lua_State *L, std::shared_ptr<Character> ch,
                      std::function<void(lua_State *, std::shared_ptr<Character>)> loadExtra)
{
    LuaGetfieldString(L, "Name", &ch->Name);
    LuaGetfieldString(L, "Description", &ch->Description);
    LuaGetfieldString(L, "Gender",
                      [ch](const std::string &genderName)
                      {
                          SexType gender = StrCmp(genderName, "male") == 0 ? SEX_MALE
                              : StrCmp(genderName, "female") == 0 ? SEX_FEMALE
                              : SEX_NEUTRAL;
                          ch->Sex = gender;
                      });
    LuaGetfieldString(L, "Race",
                      [ch](const std::string &raceName)
                      {
                          ch->Race = GetNpcRace(raceName);
                      });
    LuaGetfieldInt(L, "Speaks", &ch->Speaks);
    LuaGetfieldInt(L, "Speaking", &ch->Speaking);
    LuaGetfieldInt(L, "Level",
                   [ch](const auto &lvl)
                   {
                       ch->TopLevel(lvl);
                   });
    LuaGetfieldInt(L, "Trust", &ch->Trust);
    LuaGetfieldString(L, "InRoom",
                      [&ch](const auto &vnumOrTag)
                      {
                          ch->InRoom = GetRoom(vnumOrTag);

                          if(ch->InRoom == nullptr)
                          {
                              ch->InRoom = GetRoom(ROOM_VNUM_LIMBO);
                          }
                      });
    LuaGetfieldInt(L, "Credits", &ch->Gold);
    LuaGetfieldString(L, "Position",
                      [ch](const std::string &posName)
                      {
                          ch->Position = GetPosition(posName);
                      });
    LuaGetfieldInt(L, "HitRoll", &ch->HitRoll);
    LuaGetfieldInt(L, "DamRoll", &ch->DamRoll);
    LuaGetfieldInt(L, "Wimpy", &ch->Wimpy);
    LuaGetfieldInt(L, "MentalState", &ch->MentalState);

    // Add functions to load stats, saves, etc here.
    LoadCurrentAndMax(L, "HitPoints", ch->HitPoints);
    LoadCurrentAndMax(L, "ForcePoints", ch->Mana);
    LoadCurrentAndMax(L, "Fatigue", ch->Fatigue);

    ch->AffectedBy = LuaLoadFlags(L, "AffectedBy");
    ch->Deaf = LuaLoadFlags(L, "IgnoreChannels").to_ulong();
    ch->Resistant = LuaLoadFlags(L, "Resistant");
    ch->Immune = LuaLoadFlags(L, "Immune");
    ch->Susceptible = LuaLoadFlags(L, "Susceptible");

    LuaLoadCharacterAbilities(L, ch);
    LuaLoadCharacterSaves(L, ch);
    LuaLoadCharacterStats(L, ch);

    auto affects = LuaLoadCharacterAffects(L, "Affects");

    for(auto aff : affects)
    {
        ch->Add(aff);
    }

    auto objects = LuaLoadObjects(L, "Inventory");

    for(auto obj : objects)
    {
        int tmpWearLoc = obj->WearLoc;
        obj->WearLoc = WEAR_NONE;

        ObjectToCharacter(obj, ch);

        obj->WearLoc = tmpWearLoc;

        if(obj->WearLoc != WEAR_NONE)
        {
            EquipCharacter(ch, obj, obj->WearLoc);
        }
    }

    std::vector<std::string> expressions;
    LuaLoadArray(L, "RuntimeData", LoadRuntimeData, &expressions);
    std::vector<std::string> code(expressions.begin(), expressions.end());
    auto program = ParseImpProgram("char " + ch->Name + " runtimedata", code);
    auto scope = std::make_shared<Imp::RuntimeScope>();
    program->Eval(scope);
    ch->RuntimeData(scope);
    
    loadExtra(L, ch);
}

static void LuaPushMudProg(lua_State *L, std::shared_ptr<MPROG_DATA> mprog, size_t idx)
{
    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldString(L, "ScriptType", mprog->SType == ScriptType::Imp ? "Imp" : "MProg");
    LuaSetfieldString(L, "MudProgType", MobProgTypeToName(mprog->type));
    LuaSetfieldString(L, "Arguments", mprog->arglist);
    LuaSetfieldString(L, "Code", StripCarriageReturn(mprog->comlist));

    lua_settable(L, -3);
}

void LuaPushMudProgs(lua_State *L, const MProg *mprog)
{
    if(!mprog->MudProgs().empty())
    {
        size_t idx = 0;
        lua_pushstring(L, "MudProgs");
        lua_newtable(L);


        for(auto prog : mprog->MudProgs())
        {
            LuaPushMudProg(L, prog, ++idx);
        }

        lua_settable(L, -3);
    }
}

void PushVnumEntry(lua_State *L, const std::string &key, vnum_t value)
{
    lua_pushstring(L, key.c_str());
    lua_pushinteger(L, value);
    lua_settable(L, -3);
}

static void PushVnumConstantsObjects(lua_State *L)
{
    lua_newtable(L);

    lua_pushstring(L, "Objects");
    lua_newtable(L);

    PushVnumEntry(L, "OBJ_VNUM_DEED", OBJ_VNUM_DEED);
    PushVnumEntry(L, "OBJ_VNUM_MONEY_ONE", OBJ_VNUM_MONEY_ONE);
    PushVnumEntry(L, "OBJ_VNUM_MONEY_SOME", OBJ_VNUM_MONEY_SOME);
    PushVnumEntry(L, "OBJ_VNUM_DROID_CORPSE", OBJ_VNUM_DROID_CORPSE);
    PushVnumEntry(L, "OBJ_VNUM_CORPSE_NPC", OBJ_VNUM_CORPSE_NPC);
    PushVnumEntry(L, "OBJ_VNUM_CORPSE_PC", OBJ_VNUM_CORPSE_PC);
    PushVnumEntry(L, "OBJ_VNUM_BLOODSTAIN", OBJ_VNUM_BLOODSTAIN);
    PushVnumEntry(L, "OBJ_VNUM_SCRAPS", OBJ_VNUM_SCRAPS);
    PushVnumEntry(L, "OBJ_VNUM_LIGHT_BALL", OBJ_VNUM_LIGHT_BALL);
    PushVnumEntry(L, "OBJ_VNUM_SKIN", OBJ_VNUM_SKIN);
    PushVnumEntry(L, "OBJ_VNUM_SHOPPING_BAG", OBJ_VNUM_SHOPPING_BAG);
    PushVnumEntry(L, "OBJ_VNUM_FIRE", OBJ_VNUM_FIRE);
    PushVnumEntry(L, "OBJ_VNUM_TRAP", OBJ_VNUM_TRAP);
    PushVnumEntry(L, "OBJ_VNUM_BLACK_POWDER", OBJ_VNUM_BLACK_POWDER);
    PushVnumEntry(L, "OBJ_VNUM_NOTE", OBJ_VNUM_NOTE);
    PushVnumEntry(L, "OBJ_VNUM_SCHOOL_BLADE", OBJ_VNUM_SCHOOL_BLADE);
    PushVnumEntry(L, "OBJ_VNUM_SCHOOL_LIGHTSABER", OBJ_VNUM_SCHOOL_LIGHTSABER);
    PushVnumEntry(L, "OBJ_VNUM_SCHOOL_GLOWROD", OBJ_VNUM_SCHOOL_GLOWROD);
    PushVnumEntry(L, "OBJ_VNUM_SCHOOL_DIPLOMA", OBJ_VNUM_SCHOOL_DIPLOMA);
    PushVnumEntry(L, "OBJ_VNUM_SCHOOL_COMLINK", OBJ_VNUM_SCHOOL_COMLINK);
    PushVnumEntry(L, "OBJ_VNUM_BLASTECH_E11", OBJ_VNUM_BLASTECH_E11);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_BLASTER", OBJ_VNUM_CRAFTING_BLASTER);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_LIGHTSABER", OBJ_VNUM_CRAFTING_LIGHTSABER);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_BLADE", OBJ_VNUM_CRAFTING_BLADE);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_GRENADE", OBJ_VNUM_CRAFTING_GRENADE);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_LANDMINE", OBJ_VNUM_CRAFTING_LANDMINE);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_GLOWROD", OBJ_VNUM_CRAFTING_GLOWROD);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_SHIELD", OBJ_VNUM_CRAFTING_SHIELD);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_COMLINK", OBJ_VNUM_CRAFTING_COMLINK);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_BOWCASTER", OBJ_VNUM_CRAFTING_BOWCASTER);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_CONTAINER", OBJ_VNUM_CRAFTING_CONTAINER);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_ARMOR", OBJ_VNUM_CRAFTING_ARMOR);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_DISGUISE", OBJ_VNUM_CRAFTING_DISGUISE);
    PushVnumEntry(L, "OBJ_VNUM_CRAFTING_SPICE", OBJ_VNUM_CRAFTING_SPICE);
    
    lua_settable(L, -3);
}

static void PushVnumConstantsRooms(lua_State *L)
{
    lua_pushstring(L, "Rooms");
    lua_newtable(L);
    
    PushVnumEntry(L, "ROOM_VNUM_VENSTOR", ROOM_VNUM_VENSTOR);
    PushVnumEntry(L, "ROOM_JAIL_MON_CALAMARI_1", ROOM_JAIL_MON_CALAMARI_1);
    PushVnumEntry(L, "ROOM_JAIL_MON_CALAMARI_2", ROOM_JAIL_MON_CALAMARI_2);
    PushVnumEntry(L, "ROOM_JAIL_QUARREN_1", ROOM_JAIL_QUARREN_1);
    PushVnumEntry(L, "ROOM_JAIL_QUARREN_2", ROOM_JAIL_QUARREN_2);
    PushVnumEntry(L, "ROOM_JAIL_ADARI", ROOM_JAIL_ADARI);
    PushVnumEntry(L, "ROOM_VNUM_LIMBO", ROOM_VNUM_LIMBO);
    PushVnumEntry(L, "ROOM_VNUM_POLY", ROOM_VNUM_POLY);
    PushVnumEntry(L, "ROOM_VNUM_SPAWNLOCATION", ROOM_VNUM_SPAWNLOCATION);
    PushVnumEntry(L, "ROOM_VNUM_HELL", ROOM_VNUM_HELL);
    PushVnumEntry(L, "ROOM_VNUM_SCHOOL", ROOM_VNUM_SCHOOL);
    PushVnumEntry(L, "ROOM_START_PLAYER", ROOM_START_PLAYER);
    PushVnumEntry(L, "ROOM_START_IMMORTAL", ROOM_START_IMMORTAL);
    PushVnumEntry(L, "ROOM_LIMBO_SHIPYARD", ROOM_LIMBO_SHIPYARD);
    PushVnumEntry(L, "ROOM_PLUOGUS_QUIT", ROOM_PLUOGUS_QUIT);
    PushVnumEntry(L, "ROOM_VNUM_PLACE_BOUNTY", ROOM_VNUM_PLACE_BOUNTY);
    PushVnumEntry(L, "ROOM_VNUM_CLONING_CYLINDER", ROOM_VNUM_CLONING_CYLINDER);
    PushVnumEntry(L, "ROOM_VNUM_CLONING_PAY_COUNTER", ROOM_VNUM_CLONING_PAY_COUNTER);
    PushVnumEntry(L, "ROOM_VNUM_CLONING_CLINIC", ROOM_VNUM_CLONING_CLINIC);
    
    lua_settable(L, -3);
}

static void PushVnumConstantsMobiles(lua_State *L)
{
    lua_pushstring(L, "Mobiles");
    lua_newtable(L);

    PushVnumEntry(L, "MOB_VNUM_VENDOR", MOB_VNUM_VENDOR);
    PushVnumEntry(L, "MOB_VNUM_ANIMATED_CORPSE", MOB_VNUM_ANIMATED_CORPSE);
    PushVnumEntry(L, "MOB_VNUM_SUPERMOB", MOB_VNUM_SUPERMOB);
    PushVnumEntry(L, "MOB_VNUM_STORMTROOPER", MOB_VNUM_STORMTROOPER);
    PushVnumEntry(L, "MOB_VNUM_IMP_GUARD", MOB_VNUM_IMP_GUARD);
    PushVnumEntry(L, "MOB_VNUM_NR_GUARD", MOB_VNUM_NR_GUARD);
    PushVnumEntry(L, "MOB_VNUM_NR_TROOPER", MOB_VNUM_NR_TROOPER);
    PushVnumEntry(L, "MOB_VNUM_MERCINARY", MOB_VNUM_MERCINARY);
    PushVnumEntry(L, "MOB_VNUM_BOUNCER", MOB_VNUM_BOUNCER);
    PushVnumEntry(L, "MOB_VNUM_IMP_ELITE", MOB_VNUM_IMP_ELITE);
    PushVnumEntry(L, "MOB_VNUM_IMP_PATROL", MOB_VNUM_IMP_PATROL);
    PushVnumEntry(L, "MOB_VNUM_IMP_FORCES", MOB_VNUM_IMP_FORCES);
    PushVnumEntry(L, "MOB_VNUM_NR_ELITE", MOB_VNUM_NR_ELITE);
    PushVnumEntry(L, "MOB_VNUM_NR_PATROL", MOB_VNUM_NR_PATROL);
    PushVnumEntry(L, "MOB_VNUM_NR_FORCES", MOB_VNUM_NR_FORCES);
    PushVnumEntry(L, "MOB_VNUM_MERC_ELITE", MOB_VNUM_MERC_ELITE);
    PushVnumEntry(L, "MOB_VNUM_MERC_PATROL", MOB_VNUM_MERC_PATROL);
    PushVnumEntry(L, "MOB_VNUM_MERC_FORCES", MOB_VNUM_MERC_FORCES);
    
    lua_settable(L, -3);
}

void LuaPushVnumConstants()
{
    auto pushVnums = [](lua_State *L)
                     {
                         lua_newtable(L);
                         
                         PushVnumConstantsObjects(L);
                         PushVnumConstantsRooms(L);
                         PushVnumConstantsMobiles(L);
                         
                         lua_setglobal(L, "vnumconstants");
                     };
    
    LuaSaveDataFile(DATA_DIR "vnumconstants.lua", pushVnums, "vnumconstants");
}

static void LoadVnumConstantsObjects(lua_State *L)
{
    int idx = lua_gettop(L);

    lua_getfield(L, idx, "Objects");

    if (!lua_isnil(L, ++idx))
    {
        LuaGetfieldLong(L, "OBJ_VNUM_DEED", &OBJ_VNUM_DEED);
        LuaGetfieldLong(L, "OBJ_VNUM_MONEY_ONE", &OBJ_VNUM_MONEY_ONE);
        LuaGetfieldLong(L, "OBJ_VNUM_MONEY_SOME", &OBJ_VNUM_MONEY_SOME);
        LuaGetfieldLong(L, "OBJ_VNUM_DROID_CORPSE", &OBJ_VNUM_DROID_CORPSE);
        LuaGetfieldLong(L, "OBJ_VNUM_CORPSE_NPC", &OBJ_VNUM_CORPSE_NPC);
        LuaGetfieldLong(L, "OBJ_VNUM_CORPSE_PC", &OBJ_VNUM_CORPSE_PC);
        LuaGetfieldLong(L, "OBJ_VNUM_BLOODSTAIN", &OBJ_VNUM_BLOODSTAIN);
        LuaGetfieldLong(L, "OBJ_VNUM_SCRAPS", &OBJ_VNUM_SCRAPS);
        LuaGetfieldLong(L, "OBJ_VNUM_LIGHT_BALL", &OBJ_VNUM_LIGHT_BALL);
        LuaGetfieldLong(L, "OBJ_VNUM_SKIN", &OBJ_VNUM_SKIN);
        LuaGetfieldLong(L, "OBJ_VNUM_SHOPPING_BAG", &OBJ_VNUM_SHOPPING_BAG);
        LuaGetfieldLong(L, "OBJ_VNUM_FIRE", &OBJ_VNUM_FIRE);
        LuaGetfieldLong(L, "OBJ_VNUM_TRAP", &OBJ_VNUM_TRAP);
        LuaGetfieldLong(L, "OBJ_VNUM_BLACK_POWDER", &OBJ_VNUM_BLACK_POWDER);
        LuaGetfieldLong(L, "OBJ_VNUM_NOTE", &OBJ_VNUM_NOTE);
        LuaGetfieldLong(L, "OBJ_VNUM_SCHOOL_BLADE", &OBJ_VNUM_SCHOOL_BLADE);
        LuaGetfieldLong(L, "OBJ_VNUM_SCHOOL_LIGHTSABER", &OBJ_VNUM_SCHOOL_LIGHTSABER);
        LuaGetfieldLong(L, "OBJ_VNUM_SCHOOL_GLOWROD", &OBJ_VNUM_SCHOOL_GLOWROD);
        LuaGetfieldLong(L, "OBJ_VNUM_SCHOOL_DIPLOMA", &OBJ_VNUM_SCHOOL_DIPLOMA);
        LuaGetfieldLong(L, "OBJ_VNUM_SCHOOL_COMLINK", &OBJ_VNUM_SCHOOL_COMLINK);
        LuaGetfieldLong(L, "OBJ_VNUM_BLASTECH_E11", &OBJ_VNUM_BLASTECH_E11);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_BLASTER", &OBJ_VNUM_CRAFTING_BLASTER);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_LIGHTSABER", &OBJ_VNUM_CRAFTING_LIGHTSABER);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_BLADE", &OBJ_VNUM_CRAFTING_BLADE);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_GRENADE", &OBJ_VNUM_CRAFTING_GRENADE);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_LANDMINE", &OBJ_VNUM_CRAFTING_LANDMINE);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_GLOWROD", &OBJ_VNUM_CRAFTING_GLOWROD);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_SHIELD", &OBJ_VNUM_CRAFTING_SHIELD);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_COMLINK", &OBJ_VNUM_CRAFTING_COMLINK);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_BOWCASTER", &OBJ_VNUM_CRAFTING_BOWCASTER);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_CONTAINER", &OBJ_VNUM_CRAFTING_CONTAINER);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_ARMOR", &OBJ_VNUM_CRAFTING_ARMOR);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_DISGUISE", &OBJ_VNUM_CRAFTING_DISGUISE);
        LuaGetfieldLong(L, "OBJ_VNUM_CRAFTING_SPICE", &OBJ_VNUM_CRAFTING_SPICE);
    }

    lua_pop(L, 1);
}

static void LoadVnumConstantsRooms(lua_State *L)
{
    int idx = lua_gettop(L);

    lua_getfield(L, idx, "Rooms");

    if (!lua_isnil(L, ++idx))
    {
        LuaGetfieldLong(L, "ROOM_VNUM_VENSTOR", &ROOM_VNUM_VENSTOR);
        LuaGetfieldLong(L, "ROOM_JAIL_MON_CALAMARI_1", &ROOM_JAIL_MON_CALAMARI_1);
        LuaGetfieldLong(L, "ROOM_JAIL_MON_CALAMARI_2", &ROOM_JAIL_MON_CALAMARI_2);
        LuaGetfieldLong(L, "ROOM_JAIL_QUARREN_1", &ROOM_JAIL_QUARREN_1);
        LuaGetfieldLong(L, "ROOM_JAIL_QUARREN_2", &ROOM_JAIL_QUARREN_2);
        LuaGetfieldLong(L, "ROOM_JAIL_ADARI", &ROOM_JAIL_ADARI);
        LuaGetfieldLong(L, "ROOM_VNUM_LIMBO", &ROOM_VNUM_LIMBO);
        LuaGetfieldLong(L, "ROOM_VNUM_POLY", &ROOM_VNUM_POLY);
        LuaGetfieldLong(L, "ROOM_VNUM_SPAWNLOCATION", &ROOM_VNUM_SPAWNLOCATION);
        LuaGetfieldLong(L, "ROOM_VNUM_HELL", &ROOM_VNUM_HELL);
        LuaGetfieldLong(L, "ROOM_VNUM_SCHOOL", &ROOM_VNUM_SCHOOL);
        LuaGetfieldLong(L, "ROOM_START_PLAYER", &ROOM_START_PLAYER);
        LuaGetfieldLong(L, "ROOM_START_IMMORTAL", &ROOM_START_IMMORTAL);
        LuaGetfieldLong(L, "ROOM_LIMBO_SHIPYARD", &ROOM_LIMBO_SHIPYARD);
        LuaGetfieldLong(L, "ROOM_PLUOGUS_QUIT", &ROOM_PLUOGUS_QUIT);
        LuaGetfieldLong(L, "ROOM_VNUM_PLACE_BOUNTY", &ROOM_VNUM_PLACE_BOUNTY);
        LuaGetfieldLong(L, "ROOM_VNUM_CLONING_CYLINDER", &ROOM_VNUM_CLONING_CYLINDER);
        LuaGetfieldLong(L, "ROOM_VNUM_CLONING_PAY_COUNTER", &ROOM_VNUM_CLONING_PAY_COUNTER);
        LuaGetfieldLong(L, "ROOM_VNUM_CLONING_CLINIC", &ROOM_VNUM_CLONING_CLINIC);
    }

    lua_pop(L, 1);
}

static void LoadVnumConstantsMobiles(lua_State *L)
{
    int idx = lua_gettop(L);

    lua_getfield(L, idx, "Mobiles");

    if (!lua_isnil(L, ++idx))
    {
        LuaGetfieldLong(L, "MOB_VNUM_VENDOR", &MOB_VNUM_VENDOR);
        LuaGetfieldLong(L, "MOB_VNUM_ANIMATED_CORPSE", &MOB_VNUM_ANIMATED_CORPSE);
        LuaGetfieldLong(L, "MOB_VNUM_SUPERMOB", &MOB_VNUM_SUPERMOB);
        LuaGetfieldLong(L, "MOB_VNUM_STORMTROOPER", &MOB_VNUM_STORMTROOPER);
        LuaGetfieldLong(L, "MOB_VNUM_IMP_GUARD", &MOB_VNUM_IMP_GUARD);
        LuaGetfieldLong(L, "MOB_VNUM_NR_GUARD", &MOB_VNUM_NR_GUARD);
        LuaGetfieldLong(L, "MOB_VNUM_NR_TROOPER", &MOB_VNUM_NR_TROOPER);
        LuaGetfieldLong(L, "MOB_VNUM_MERCINARY", &MOB_VNUM_MERCINARY);
        LuaGetfieldLong(L, "MOB_VNUM_BOUNCER", &MOB_VNUM_BOUNCER);
        LuaGetfieldLong(L, "MOB_VNUM_IMP_ELITE", &MOB_VNUM_IMP_ELITE);
        LuaGetfieldLong(L, "MOB_VNUM_IMP_PATROL", &MOB_VNUM_IMP_PATROL);
        LuaGetfieldLong(L, "MOB_VNUM_IMP_FORCES", &MOB_VNUM_IMP_FORCES);
        LuaGetfieldLong(L, "MOB_VNUM_NR_ELITE", &MOB_VNUM_NR_ELITE);
        LuaGetfieldLong(L, "MOB_VNUM_NR_PATROL", &MOB_VNUM_NR_PATROL);
        LuaGetfieldLong(L, "MOB_VNUM_NR_FORCES", &MOB_VNUM_NR_FORCES);
        LuaGetfieldLong(L, "MOB_VNUM_MERC_ELITE", &MOB_VNUM_MERC_ELITE);
        LuaGetfieldLong(L, "MOB_VNUM_MERC_PATROL", &MOB_VNUM_MERC_PATROL);
        LuaGetfieldLong(L, "MOB_VNUM_MERC_FORCES", &MOB_VNUM_MERC_FORCES);
    }

    lua_pop(L, 1);
}

void LuaLoadVnumConstants()
{
    auto loader = [](lua_State *L)
                  {
                      LoadVnumConstantsObjects(L);
                      LoadVnumConstantsRooms(L);
                      LoadVnumConstantsMobiles(L);
                      return 0;
                  };
    LuaLoadDataFile(DATA_DIR "vnumconstants.lua", loader, "VnumConstantsEntry");
}
