#include <algorithm>
#include <cstdio>
#include <cassert>
#include "mud.hpp"
#include "script.hpp"
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

lua_State *LuaMasterState = nullptr;

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

    if (!lua_isnil(L, ++idx))
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
    const std::string &callbackFunctionName)
{
    lua_State *L = CreateLuaState();

    lua_pushcfunction(L, callback);
    lua_setglobal(L, callbackFunctionName.c_str());

    int error = luaL_loadfile(L, filename.c_str()) || lua_pcall(L, 0, 0, 0);

    if (error)
    {
        Log->Bug("Cannot run file: %s", lua_tostring(L, -1));
        return;
    }

    lua_close(L);
}

void LuaSaveDataFile(const std::string &filename,
    void(*pushData)(lua_State *L, const void*),
    const std::string &data, const void *userData)
{
    lua_State *L = CreateLuaState();
    char buffer[MAX_STRING_LENGTH];

    pushData(L, userData);

    sprintf(buffer, "%ssavers.lua", SCRIPT_DIR);
    int error = luaL_dofile(L, buffer);

    if (error)
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

        if (error)
        {
            Log->Bug("%s:%s():%d: Cannot run file: %s\n",
                __FILE__, __FUNCTION__, __LINE__, lua_tostring(L, -1));
        }
    }

    lua_close(L);
}

void LuaPushFlags(lua_State *L, const std::bitset<Flag::MAX> &flags,
    const std::array<const char * const, Flag::MAX> &nameArray,
    const std::string &key)
{
    LuaPushFlags(L, flags.to_ulong(), nameArray.data(), key);
}

void LuaPushFlags(lua_State *L, unsigned long flags,
    const std::array<const char * const, Flag::MAX> &nameArray,
    const std::string &key)
{
    LuaPushFlags(L, flags, nameArray.data(), key);
}

void LuaPushFlags(lua_State *L, const std::bitset<Flag::MAX> &flags,
    const char * const nameArray[], const std::string &key)
{
    LuaPushFlags(L, flags.to_ulong(), nameArray, key);
}

void LuaPushFlags(lua_State *L, unsigned long flags,
    const char * const nameArray[], const std::string &key)
{
    if (flags)
    {
        lua_pushstring(L, key.c_str());
        lua_newtable(L);

        for (size_t bit = 0; bit < Flag::MAX; ++bit)
        {
            unsigned int mask = 1 << bit;

            if (IsBitSet(flags, mask))
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

    for (size_t bit = 0; bit < LANG_MAX; ++bit)
    {
        unsigned int mask = 1 << bit;

        if (IsBitSet(languages, mask))
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

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            size_t bit = lua_tointeger(L, -2);

            if (bit < Flag::MAX)
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
                          affect->AffectedBy = GetAffectFlag(value);
                      });
    return affect;
}

std::list<std::shared_ptr<SmaugAffect>> LuaLoadSmaugAffects(lua_State *L)
{
    std::list<std::shared_ptr<SmaugAffect>> affectList;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Affects");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
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

    if (!affect->Duration.empty())
    {
        LuaSetfieldString(L, "Duration", affect->Duration);
    }

    if (affect->Location)
    {
        LuaSetfieldNumber(L, "Location", affect->Location);
    }

    if (!affect->Modifier.empty())
    {
        LuaSetfieldString(L, "Modifier", affect->Modifier);
    }

    if (affect->AffectedBy)
    {
        for (size_t x = 0; x < AffectFlags.size(); ++x)
        {
            if (IsBitSet(affect->AffectedBy, 1 << x))
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
    if (!affectList.empty())
    {
        int idx = 0;
        lua_pushstring(L, "Affects");
        lua_newtable(L);

        for (auto affect : affectList)
        {
            LuaPushOneSmaugAffect(L, affect, ++idx);
        }

        lua_settable(L, -3);
    }
}

void LuaPushVector3(lua_State *L, std::shared_ptr<Vector3> v, const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    LuaSetfieldNumber(L, "X", v->x);
    LuaSetfieldNumber(L, "Y", v->y);
    LuaSetfieldNumber(L, "Z", v->z);

    lua_settable(L, -3);
}

void LuaLoadVector3(lua_State *L, std::shared_ptr<Vector3> v, const std::string &key)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if (!lua_isnil(L, ++idx))
    {
        LuaGetfieldDouble(L, "X", &v->x);
        LuaGetfieldDouble(L, "Y", &v->y);
        LuaGetfieldDouble(L, "Z", &v->z);
    }

    lua_pop(L, 1);
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

    if (!lua_isnil(L, ++idx))
    {
        LuaGetfieldInt(L, "Current", current);
        LuaGetfieldInt(L, "Max", mx);
    }

    lua_pop(L, 1);
}

static void LuaPushCharacterAffect(lua_State *L, std::shared_ptr<Affect> affect, int idx)
{
    std::shared_ptr<Skill> skill = GetSkill(affect->Type);

    if (affect->Type >= 0 && skill == nullptr)
    {
        return;
    }

    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldNumber(L, "Duration", affect->Duration);
    LuaSetfieldNumber(L, "Location", affect->Location);

    if (affect->Location >= 0 && affect->Location < static_cast<int>(AffectTypes.size()))
    {
        LuaSetfieldString(L, "AffectType", AffectTypes[affect->Location]);
    }

    LuaSetfieldNumber(L, "Modifier", affect->Modifier);

    if (affect->Type >= 0 && affect->Type < TYPE_PERSONAL)
    {
        LuaSetfieldString(L, "Skill", skill->Name);
    }
    else
    {
        LuaSetfieldNumber(L, "Type", affect->Type);
    }

    if (affect->AffectedBy)
    {
        for (size_t x = 0; x < AffectFlags.size(); ++x)
        {
            if (IsBitSet(affect->AffectedBy, 1 << x))
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

    if (affect->Type >= 0 && skill == nullptr)
    {
        return;
    }

    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldNumber(L, "Duration", affect->Duration);
    LuaSetfieldNumber(L, "Location", affect->Location);

    if (affect->Location >= 0 && affect->Location < static_cast<int>(AffectTypes.size()))
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

    if (affect->Type >= 0 && affect->Type < TopSN)
    {
        LuaSetfieldString(L, "Skill", skill->Name);
    }
    else
    {
        LuaSetfieldNumber(L, "Type", affect->Type);
    }

    if (affect->AffectedBy)
    {
        for (size_t x = 0; x < AffectFlags.size(); ++x)
        {
            if (IsBitSet(affect->AffectedBy, 1 << x))
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
    std::function<void(lua_State*, std::shared_ptr<Affect>, int)> pushOneAffect)
{
    if (!affects.empty())
    {
        int idx = 0;
        lua_pushstring(L, "Affects");
        lua_newtable(L);

        for (auto affect : affects)
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

    for (auto ed : extras)
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

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
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

    for (size_t i = 0; i < values.size(); ++i)
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

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            size_t subscript = lua_tointeger(L, -2);
            int value = lua_tointeger(L, -1);

            if (subscript < values.size())
            {
                values[subscript] = value;
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

static void LuaPushObject(lua_State *L, const Object *obj, size_t idx)
{
    /*
     * Castrate storage characters.
     */
    if (obj->ItemType == ITEM_KEY && !obj->Flags.test(Flag::Obj::ClanObject))
    {
        return;
    }

    /*
     * Catch deleted objects                                      -Thoric
     */
    if (IsObjectExtracted(obj))
    {
        return;
    }

    /*
     * Do NOT save prototype items!                               -Thoric
     */
    if (obj->Flags.test(Flag::Obj::Prototype))
    {
        return;
    }

    lua_pushinteger(L, idx);
    lua_newtable(L);
    std::shared_ptr<ProtoObject> proto = obj->Prototype;

    LuaSetfieldNumber(L, "Vnum", proto->Vnum);

    if (obj->Count > 1)
    {
        LuaSetfieldNumber(L, "Count", obj->Count);
    }

    if (StrCmp(obj->Name, proto->Name) != 0)
    {
        LuaSetfieldString(L, "Name", obj->Name);
    }

    if (StrCmp(obj->ShortDescr, proto->ShortDescr) != 0)
    {
        LuaSetfieldString(L, "ShortDescription", obj->ShortDescr);
    }

    if (StrCmp(obj->Description, proto->Description) != 0)
    {
        LuaSetfieldString(L, "Description", obj->Description);
    }

    if (StrCmp(obj->ActionDescription, proto->ActionDescription) != 0)
    {
        LuaSetfieldString(L, "ActionDescription", obj->ActionDescription);
    }

    if (obj->InRoom != nullptr)
    {
        LuaSetfieldNumber(L, "InRoom", obj->InRoom->Vnum);
    }

    if (obj->Flags != proto->Flags)
    {
        LuaPushFlags(L, obj->Flags, ObjectFlags, "Flags");
    }

    if (obj->WearFlags != proto->WearFlags)
    {
        LuaPushFlags(L, obj->WearFlags, WearFlags, "WearFlags");
    }

    if (obj->ItemType != proto->ItemType)
    {
        LuaSetfieldString(L, "ItemType", ObjectTypes[obj->ItemType]);
    }

    if (obj->Weight != proto->Weight)
    {
        LuaSetfieldNumber(L, "Weight", obj->Weight);
    }

    if (obj->Cost != proto->Cost)
    {
        LuaSetfieldNumber(L, "Cost", obj->Cost);
    }

    if (std::any_of(std::cbegin(obj->Value), std::cend(obj->Value),
        [](const auto v) { return v != 0; }))
    {
        LuaPushOvalues(L, obj->Value);
    }

    if (obj->Level != 0)
    {
        LuaSetfieldNumber(L, "Level", obj->Level);
    }

    if (obj->Timer != 0)
    {
        LuaSetfieldNumber(L, "Timer", obj->Timer);
    }

    int wear_loc = -1;

    for (size_t wear = 0; wear < MAX_WEAR; wear++)
    {
        for (size_t x = 0; x < MAX_LAYERS; x++)
        {
            if (obj == save_equipment[wear][x])
            {
                wear_loc = wear;
                break;
            }
            else if (!save_equipment[wear][x])
            {
                break;
            }
        }
    }

    if (wear_loc != -1)
    {
        LuaSetfieldNumber(L, "WearLocation", wear_loc);
    }

    switch (obj->ItemType)
    {
    case ITEM_PILL:
    case ITEM_POTION:
        if (IS_VALID_SN(obj->Value[OVAL_PILL_SPELL1]))
        {
            LuaSetfieldString(L, "Spell1",
                SkillTable[obj->Value[OVAL_PILL_SPELL1]]->Name);
        }

        if (IS_VALID_SN(obj->Value[OVAL_PILL_SPELL2]))
        {
            LuaSetfieldString(L, "Spell2",
                SkillTable[obj->Value[OVAL_PILL_SPELL2]]->Name);
        }

        if (IS_VALID_SN(obj->Value[OVAL_PILL_SPELL3]))
        {
            LuaSetfieldString(L, "Spell3",
                SkillTable[obj->Value[OVAL_PILL_SPELL3]]->Name);
        }
        break;

    case ITEM_DEVICE:
        if (IS_VALID_SN(obj->Value[OVAL_DEVICE_SPELL]))
        {
            LuaSetfieldString(L, "Spell3",
                SkillTable[obj->Value[OVAL_DEVICE_SPELL]]->Name);
        }
        break;

    case ITEM_SALVE:
        if (IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL1]))
        {
            LuaSetfieldString(L, "Spell4",
                SkillTable[obj->Value[OVAL_SALVE_SPELL1]]->Name);
        }

        if (IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL2]))
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

void LuaPushObjects(lua_State *L, const std::list<Object*> &objects,
    const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);
    size_t idx = 0;

    for (const Object *obj : objects)
    {
        LuaPushObject(L, obj, ++idx);
    }

    lua_settable(L, -3);
}

static void LuaPushMobile(lua_State *L, const Character *mob)
{
    assert(IsNpc(mob));
    auto proto = mob->Prototype;

    LuaSetfieldString(L, "CharacterType", "Mobile");
    LuaPushFlags(L, mob->Flags, MobFlags, "Flags");

    if (StrCmp(mob->ShortDescr, proto->ShortDescr) != 0)
    {
        LuaSetfieldString(L, "ShortDescription", mob->ShortDescr);
    }

    if (StrCmp(mob->LongDescr, proto->LongDescr) != 0)
    {
        LuaSetfieldString(L, "LongDescription", mob->LongDescr);
    }

    if (mob->spec_fun != nullptr && mob->spec_fun != proto->spec_fun)
    {
        LuaSetfieldString(L, "SpecialFunction1", LookupSpecial(mob->spec_fun));
    }

    if (mob->spec_2 != nullptr && mob->spec_2 != proto->spec_2)
    {
        LuaSetfieldString(L, "SpecialFunction2", LookupSpecial(mob->spec_2));
    }

    if (mob->NumberOfAttacks != proto->NumberOfAttacks)
    {
        LuaSetfieldNumber(L, "NumberOfAttacks", mob->NumberOfAttacks);
    }

    if (mob->AttackFlags != proto->AttackFlags)
    {
        LuaPushFlags(L, mob->AttackFlags, AttackFlags, "AttackFlags");
    }

    if (mob->DefenseFlags != proto->DefenseFlags)
    {
        LuaPushFlags(L, mob->DefenseFlags, DefenseFlags, "DefenseFlags");
    }

    if (mob->Alignment != proto->Alignment)
    {
        LuaSetfieldNumber(L, "Alignment", mob->Alignment);
    }

    if (mob->ArmorClass != proto->ArmorClass)
    {
        LuaSetfieldNumber(L, "ArmorClass", mob->ArmorClass);
    }
}

void LuaPushMobiles(lua_State *L, const std::list<Character*> &mobiles,
    const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);
    size_t idx = 0;

    for (const Character *mob : mobiles)
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

    if (!lua_isnil(L, ++outer_idx))
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

static void LuaPushCharacterAbilities(lua_State *L, const Character *ch)
{
    lua_pushstring(L, "Abilities");
    lua_newtable(L);

    for (size_t ability = 0; ability < MAX_ABILITY; ++ability)
    {
        lua_pushinteger(L, ability);
        lua_newtable(L);

        LuaSetfieldString(L, "Name", AbilityName[ability]);
        LuaSetfieldNumber(L, "Level", GetAbilityLevel(ch, ability));
        LuaSetfieldNumber(L, "Experience", GetAbilityXP(ch, ability));
        LuaSetfieldBoolean(L, "IsMain", static_cast<int>(ability) == ch->Ability.Main);
        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

static void LuaPushCharacterSaves(lua_State *L, const Character *ch)
{
    LuaPushSaveVs(L, &ch->Saving, "SaveVs");
}

static void LuaPushCharacterStats(lua_State *L, const Character *ch)
{
    LuaPushStats(L, &ch->PermStats, "PermanentStats");
    LuaPushStats(L, &ch->StatMods, "StatModifiers");
}

void LuaPushCharacter(lua_State *L, const Character *ch,
    std::function<void(lua_State*, const Character*)> pushExtra)
{
    // NOT a fan of this cast, but it can't be avoided.
    DeEquipCharacter(const_cast<Character*>(ch));

    LuaSetfieldString(L, "Name", ch->Name);
    LuaSetfieldString(L, "Description", ch->Description);
    LuaSetfieldString(L, "Gender",
        ch->Sex == SEX_MALE ? "Male" : ch->Sex == SEX_FEMALE ? "Female" : "Neutral");
    LuaSetfieldString(L, "Race", RaceTable[ch->Race].Name);
    LuaSetfieldNumber(L, "Speaks", ch->Speaks);
    LuaSetfieldNumber(L, "Speaking", ch->Speaking);
    LuaSetfieldNumber(L, "Level", ch->TopLevel);
    LuaSetfieldNumber(L, "Trust", ch->Trust);
    LuaSetfieldNumber(L, "InRoom",
        ch->InRoom == GetRoom(ROOM_VNUM_LIMBO) && ch->WasInRoom
        ? ch->WasInRoom->Vnum : ch->InRoom->Vnum);
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
    LuaPushCharacterSaves(L, ch); // ch->Saving.PoisonDeath etc
    LuaPushCharacterStats(L, ch);

    LuaPushCharacterAffects(L, ch->Affects());
    LuaPushObjects(L, ch->Objects(), "Inventory");

    pushExtra(L, ch);

    // NOT a fan of this cast, but it can't be avoided.
    ReEquipCharacter(const_cast<Character*>(ch));
}

void LuaGetfieldBool(lua_State *L, const std::string &key,
    std::function<void(bool)> assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if (!lua_isnil(L, ++idx))
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

    if (!lua_isnil(L, ++idx))
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

    if (!lua_isnil(L, ++idx))
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

    if (!lua_isnil(L, ++idx))
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

    if (!lua_isnil(L, ++idx))
    {
        double value = lua_tonumber(L, idx);
        assignValue(value);
    }

    lua_pop(L, 1);
}

void LuaGetfieldString(lua_State *L, const std::string &key,
    std::function<void(const std::string&)> assignValue)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if (!lua_isnil(L, ++idx))
    {
        std::string value = lua_tostring(L, idx);
        assignValue(value);
    }

    lua_pop(L, 1);
}

static void LoadAbility(lua_State *L, Character *ch, size_t ability)
{
    LuaGetfieldInt(L, "Level",
        [ch, ability](const int level)
    {
        SetAbilityLevel(ch, ability, level);
    });

    LuaGetfieldInt(L, "Experience",
        [ch, ability](const int xp)
    {
        SetAbilityXP(ch, ability, xp);
    });

    LuaGetfieldBool(L, "IsMain",
        [ch, ability](const bool isMain)
    {
        if (isMain)
        {
            ch->Ability.Main = ability;
        }
    });
}

static void LuaLoadCharacterAbilities(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Abilities");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            size_t ability = lua_tointeger(L, -2);

            if (ability < MAX_ABILITY)
            {
                LoadAbility(L, ch, ability);
            }
            else
            {
                Log->Bug("%s:%d : %s() : Error loading %s: Ability %lu out of range.",
                    __FILE__, __LINE__, __FUNCTION__,
                    ch->Name.c_str(), ability);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

static void LuaLoadCharacterSaves(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "SaveVs");

    if (!lua_isnil(L, ++idx))
    {
        LuaGetfieldInt(L, "PoisonDeath", &ch->Saving.PoisonDeath);
        LuaGetfieldInt(L, "Wand", &ch->Saving.Wand);
        LuaGetfieldInt(L, "ParaPetri", &ch->Saving.ParaPetri);
        LuaGetfieldInt(L, "Breath", &ch->Saving.Breath);
        LuaGetfieldInt(L, "SpellStaff", &ch->Saving.SpellStaff);
    }

    lua_pop(L, 1);
}

static void LuaLoadCharacterStats(lua_State *L, Character *ch)
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

        if (sn < 0)
        {
            sn = LookupHerb(skillName);

            if (sn >= 0)
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

    if (error)
    {
        return nullptr;
    }

    affect.AffectedBy = LuaLoadFlags(L, "AffectedBy").to_ulong();

    return std::make_shared<Affect>(affect);
}

static std::shared_ptr<Affect> LuaLoadProtoObjectAffect(lua_State *L)
{
    Affect affect;

    LuaGetfieldInt(L, "Location", &affect.Location);
    LuaGetfieldInt(L, "Modifier", &affect.Modifier);
    affect.Type = -1;
    affect.Duration = -1;    
    affect.AffectedBy = 0;

    if (affect.Location == APPLY_WEAPONSPELL
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

        if (sn < 0)
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

    if (error)
    {
        return nullptr;
    }

    affect.AffectedBy = LuaLoadFlags(L, "AffectedBy").to_ulong();

    if (affect.Location == APPLY_WEAPONSPELL
        || affect.Location == APPLY_WEARSPELL
        || affect.Location == APPLY_REMOVESPELL)
    {
        affect.Modifier = SkillNumberFromSlot(affect.Modifier);
    }

    return std::make_shared<Affect>(affect);
}

static std::list<std::shared_ptr<Affect>> LuaLoadAffects(lua_State *L, const std::string &key,
    std::function<std::shared_ptr<Affect>(lua_State*)> loadOneAffect)
{
    std::list<std::shared_ptr<Affect>> affects;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            std::shared_ptr<Affect> affect = loadOneAffect(L);

            if (affect != nullptr)
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
    Object *obj, size_t idx)
{
    std::string spellName;
    LuaGetfieldString(L, key, &spellName);

    if (!spellName.empty())
    {
        int sn = LookupSkill(spellName);

        if (sn >= 0)
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

static void LuaLoadObjectSpells(lua_State *L, Object *obj)
{
    ConvertSpellNameToOvalue(L, "Spell1", obj, 1);
    ConvertSpellNameToOvalue(L, "Spell2", obj, 2);
    ConvertSpellNameToOvalue(L, "Spell3", obj, 3);
    ConvertSpellNameToOvalue(L, "Spell4", obj, 4);
    ConvertSpellNameToOvalue(L, "Spell5", obj, 5);
}

static Object *LuaLoadObject(lua_State *L)
{
    vnum_t vnum = 0;
    int level = 0;
    LuaGetfieldLong(L, "Vnum", &vnum);
    LuaGetfieldInt(L, "Level", &level);
    std::shared_ptr<ProtoObject> proto = GetProtoObject(vnum);

    if (proto == nullptr)
    {
        Log->Bug("%s:%d %s : Unknown vnum %ld",
            __FILE__, __LINE__, __FUNCTION__, vnum);
        return nullptr;
    }

    Object *obj = CreateObject(proto, level);

    LuaGetfieldInt(L, "Count", &obj->Count);
    LuaGetfieldString(L, "Name", &obj->Name);
    LuaGetfieldString(L, "ShortDescription", &obj->ShortDescr);
    LuaGetfieldString(L, "Description", &obj->Description);
    LuaGetfieldString(L, "ActionDescription", &obj->ActionDescription);
    LuaGetfieldLong(L, "InRoom",
        [obj](const long v)
    {
        obj->InRoom = GetRoom(v);
    });
    LuaGetfieldString(L, "ItemType",
        [obj](const std::string &typeName)
    {
        ItemTypes type = GetObjectType(typeName);

        if (type != -1)
        {
            obj->ItemType = type;
        }
    });
    LuaGetfieldInt(L, "Weight", &obj->Weight);
    LuaGetfieldInt(L, "Cost", &obj->Cost);
    LuaGetfieldInt(L, "Timer", &obj->Timer);
    LuaGetfieldInt(L, "WearLocation", &obj->WearLoc);

    if (FieldExists(L, "Flags"))
    {
        obj->Flags = LuaLoadFlags(L, "Flags");
    }

    if (FieldExists(L, "WearFlags"))
    {
        obj->WearFlags = LuaLoadFlags(L, "WearFlags");
    }

    LuaLoadOvalues(L, obj->Value);
    LuaLoadObjectSpells(L, obj);

    auto affects = LuaLoadObjectAffects(L, "Affects");

    for (auto affect : affects)
    {
        obj->Add(affect);
    }

    auto extraDescriptions = LuaLoadExtraDescriptions(L);

    for (auto extra : extraDescriptions)
    {
        obj->Add(extra);
    }

    if (obj->WearLoc < -1 || obj->WearLoc >= MAX_WEAR)
    {
        obj->WearLoc = WEAR_NONE;
    }

    if (obj->Serial == 0)
    {
        cur_obj_serial = umax((cur_obj_serial + 1) & (BV30 - 1), 1);
        obj->Serial = obj->Prototype->Serial = cur_obj_serial;
    }

    std::list<Object*> contents = LuaLoadObjects(L, "Contents");

    for (Object *nestedObject : contents)
    {
        ObjectToObject(nestedObject, obj);
    }

    return obj;
}

std::list<Object*> LuaLoadObjects(lua_State *L, const std::string &key)
{
    std::list<Object*> objects;
    int idx = lua_gettop(L);
    lua_getfield(L, idx, key.c_str());

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            Object *obj = LuaLoadObject(L);

            if (obj != nullptr)
            {
                objects.push_back(obj);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
    return objects;
}

std::list<Character*> LuaLoadMobiles(lua_State *L, const std::string &key)
{
#pragma message("LuaLoadMobiles")
    return std::list<Character*>();
}

void LuaLoadCharacter(lua_State *L, Character *ch,
    std::function<void(lua_State*, Character*)> loadExtra)
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
    LuaGetfieldInt(L, "Level", &ch->TopLevel);
    LuaGetfieldInt(L, "Trust", &ch->Trust);
    LuaGetfieldInt(L, "InRoom",
        [&ch](const int vnum)
    {
        ch->InRoom = GetRoom(vnum);

        if (ch->InRoom == nullptr)
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

    ch->AffectedBy = LuaLoadFlags(L, "AffectFlags").to_ulong();
    ch->Deaf = LuaLoadFlags(L, "IgnoreChannels").to_ulong();
    ch->Resistant = LuaLoadFlags(L, "Resistant").to_ulong();
    ch->Immune = LuaLoadFlags(L, "Immune").to_ulong();
    ch->Susceptible = LuaLoadFlags(L, "Susceptible").to_ulong();

    LuaLoadCharacterAbilities(L, ch);
    LuaLoadCharacterSaves(L, ch);
    LuaLoadCharacterStats(L, ch);

    auto affects = LuaLoadCharacterAffects(L, "Affects");

    for (auto aff : affects)
    {
        ch->Add(aff);
    }

    auto objects = LuaLoadObjects(L, "Inventory");

    for (auto obj : objects)
    {
        int tmpWearLoc = obj->WearLoc;
        obj->WearLoc = WEAR_NONE;

        ObjectToCharacter(obj, ch);

        obj->WearLoc = tmpWearLoc;

        if (obj->WearLoc != WEAR_NONE)
        {
            EquipCharacter(ch, obj, obj->WearLoc);
        }
    }

    loadExtra(L, ch);
}

static void LuaPushMudProg(lua_State *L, std::shared_ptr<MPROG_DATA> mprog, size_t idx)
{
    lua_pushinteger(L, idx);
    lua_newtable(L);

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
