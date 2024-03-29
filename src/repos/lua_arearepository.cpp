#include <ranges>
#include <memory>
#include <map>
#include <filesystem>
#include <utility/algorithms.hpp>
#include "systemdata.hpp"
#include "log.hpp"
#include "mud.hpp"
#include "lua_arearepository.hpp"
#include "shoprepository.hpp"
#include "area.hpp"
#include "luascript.hpp"
#include "protomob.hpp"
#include "protoobject.hpp"
#include "room.hpp"
#include "reset.hpp"
#include "race.hpp"
#include "skill.hpp"
#include "character.hpp"
#include "exit.hpp"
#include "shop.hpp"
#include "plugins.hpp"
#include "vnumconverter.hpp"

#define AREA_DIR        DATA_DIR "areas/"
#define BUILD_DIR       DATA_DIR "building/"

namespace fs = std::filesystem;

// Version 1:
//   Resets are stored in legacy format where each entry must
//   appear in a specific order, because everything is in one
//   big list, subresets and all.
static constexpr int CURRENT_FILEFORMAT_VERSION = 1;
static int FILEFORMAT_VERSION_BEING_LOADED = CURRENT_FILEFORMAT_VERSION;

struct SaveData;

class LuaAreaRepository : public AreaRepository
{
public:
    void Load() override;
    void Load(std::shared_ptr<Area> area) override;
    void Save() const override;
    void Save(const std::shared_ptr<Area> &, std::shared_ptr<VnumConverter> vnumConverter) const override;
    void Save(const std::shared_ptr<Area> &, bool install, std::shared_ptr<VnumConverter> vnumConverter) const override;
    std::string GetAreaFilename(std::shared_ptr<Area> area) const override;
    void Install(std::shared_ptr<Area> area, std::shared_ptr<VnumConverter> vnumConverter, const std::string &newfilename) override;
    void ChangeFilename(std::shared_ptr<Area> area,
                        const std::shared_ptr<VnumConverter> vnumConverter,
                        const std::string &newfilename) override;

private:
    void PushMetaData(lua_State *, std::shared_ptr<Area>,
                      std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushLevelRanges(lua_State *L, std::shared_ptr<Area>,
                         std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushVnumRanges(lua_State *L, std::shared_ptr<Area>,
                        std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushExits(lua_State *L, const std::shared_ptr<Room> room,
                   std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushExit(lua_State *L, const std::shared_ptr<Exit> xit, size_t idx,
                  std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushRooms(lua_State *L, const std::shared_ptr<Area> &area, bool install,
                   std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushRoom(lua_State *L, const std::shared_ptr<Room> room, bool install,
                  std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushObjects(lua_State *L, const std::shared_ptr<Area> &area, bool install,
                     std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushObject(lua_State *L, const std::shared_ptr<ProtoObject> obj, bool install,
                    std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushMobiles(lua_State *L, const std::shared_ptr<Area> &area, bool install,
                     std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushMobile(lua_State *L, const std::shared_ptr<ProtoMobile> mob, bool install,
                    std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushShop(lua_State *L, const std::shared_ptr<ProtoMobile> keeper,
                  std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushRepairShop(lua_State *L, const std::shared_ptr<ProtoMobile> keeper,
                        std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushSpecials(lua_State *L, const std::shared_ptr<ProtoMobile> mob,
                      std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushOvalues(lua_State *L, const std::shared_ptr<ProtoObject> obj,
                     std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushResets(lua_State *L, const std::shared_ptr<Area> area,
                    std::shared_ptr<VnumConverter> vnumConverter) const;
    void PushReset(lua_State *L, const std::shared_ptr<Reset> reset, size_t idx,
                   std::shared_ptr<VnumConverter> vnumConverter) const;
    static void PushArea(lua_State *L, const SaveData *data);

    static void LoadMetaData(lua_State *L, std::shared_ptr<Area> area);
    static void LoadLevelRanges(lua_State *L, std::shared_ptr<Area> area);
    static void LoadVnumRanges(lua_State *L, std::shared_ptr<Area> area);
    static void LoadMobiles(lua_State *L, std::shared_ptr<Area> area);
    static void LoadMobile(lua_State *L, std::shared_ptr<ProtoMobile> mob);
    static void LoadObjects(lua_State *L, std::shared_ptr<Area> area);
    static void LoadObject(lua_State *L, std::shared_ptr<ProtoObject> obj);
    static void LoadOvalues(lua_State *L, std::shared_ptr<ProtoObject> obj);
    static void LoadRooms(lua_State *L, std::shared_ptr<Area> area);
    static void LoadRoom(lua_State *L, std::shared_ptr<Room> room);
    static void LoadResets(lua_State *L, std::shared_ptr<Area> area);
    static void LoadReset(lua_State *L, int subscript,
                          std::map<int, std::shared_ptr<Reset>> *resets);
    static void LoadMobilesCallback(lua_State *L, vnum_t vnum, std::shared_ptr<Area> area);
    static void LoadObjectsCallback(lua_State *L, vnum_t vnum, std::shared_ptr<Area> area);
    static void LoadRoomsCallback(lua_State *L, vnum_t vnum, std::shared_ptr<Area> area);
    static int L_AreaEntry(lua_State *L);
    static void ExecuteAreaFile(const std::string &filePath);
};

void LuaAreaRepository::Install(std::shared_ptr<Area> area,
                                std::shared_ptr<VnumConverter> vnumConverter,
                                const std::string &newfilename)
{
    if(area->Flags.test(Flag::Area::Prototype))
    {
        std::error_code ec;
        fs::rename(GetAreaFilename(area),
                   GetAreaFilename(area) + ".installed", ec);
        fs::remove(GetAreaFilename(area) + ".bak", ec);
        Remove(area);
        area->Flags.reset(Flag::Area::Prototype);

        if(!newfilename.empty())
        {
            area->Filename = newfilename;
        }

        Add(area);
        Save(area, true, vnumConverter);
    }
}

void LuaAreaRepository::ChangeFilename(std::shared_ptr<Area> area,
                                       std::shared_ptr<VnumConverter> vnumConverter,
                                       const std::string &newfilename)
{
    auto oldpath = GetAreaFilename(area);
    area->Filename = newfilename;
    auto newpath = GetAreaFilename(area);
    std::error_code ec;
    fs::rename(oldpath, newpath, ec);
    Save(area, vnumConverter);
}

void LuaAreaRepository::Load()
{
    ForEachLuaFileInDir(AREA_DIR, ExecuteAreaFile);
    ForEachLuaFileInDir(BUILD_DIR, ExecuteAreaFile);
}

void LuaAreaRepository::Load(std::shared_ptr<Area> area)
{
    std::string filename = GetAreaFilename(area);
    LuaLoadDataFile(filename, L_AreaEntry, "AreaEntry", &area);
}

void LuaAreaRepository::Save() const
{
    for(auto area : Entities())
    {
        auto vnumConverter = VnumConverter::Create(area);
        Save(area, vnumConverter);
    }
}

void LuaAreaRepository::Save(const std::shared_ptr<Area> &area, std::shared_ptr<VnumConverter> vnumConverter) const
{
    Save(area, false, vnumConverter);
}

struct SaveData
{
    SaveData(const LuaAreaRepository *r, const std::shared_ptr<Area> &a, bool i, const std::shared_ptr<VnumConverter> &h)
        : Repos(r), area(a), Install(i), VnumConverter(h)
    {
    }
    
    const LuaAreaRepository *Repos = nullptr;
    std::shared_ptr<Area> area;
    bool Install = false;
    std::shared_ptr<class VnumConverter> VnumConverter;
};

void LuaAreaRepository::Save(const std::shared_ptr<Area> &area, bool install,
                             std::shared_ptr<VnumConverter> vnumConverter) const
{
    // Make backup in case something goes wrong while saving.
    try
    {
        fs::rename(GetAreaFilename(area), GetAreaFilename(area) + ".bak");
    }
    catch(const fs::filesystem_error &ex)
    {
        // Usually this exception means the original file wasn't
        // found because it's a new area that doesn't have a file yet.
        Log->Bug("LuaAreaRepository::Save: %s", ex.what());
    }

    SaveData data(this, area, install, vnumConverter);
    LuaSaveDataFile(GetAreaFilename(area), PushArea, "area", &data);
}

static std::string EnsureProperFilename(std::string filename)
{
    if(StringEndsWith(filename, ".are"))
    {
        // Chop off legacy file extension.
        filename = filename.substr(0, filename.size() - 4);
    }

    return ConvertToLuaFilename(filename);
}

template<typename T>
static void PushLevelRange(lua_State *L, const std::string &key, const T &range)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    LuaSetfieldNumber(L, "Low", range.Low);
    LuaSetfieldNumber(L, "High", range.High);

    lua_settable(L, -3);
}

void LuaAreaRepository::PushLevelRanges(lua_State *L, std::shared_ptr<Area> area,
                                        std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "LevelRanges");
    lua_newtable(L);
    PushLevelRange(L, "Soft", area->LevelRanges.Soft);
    PushLevelRange(L, "Hard", area->LevelRanges.Hard);
    lua_settable(L, -3);
}

template<typename T>
static void PushVnumRange(lua_State *L, const std::string &key, const T &range)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    LuaSetfieldNumber(L, "First", range.First);
    LuaSetfieldNumber(L, "Last", range.Last);

    lua_settable(L, -3);
}

void LuaAreaRepository::PushVnumRanges(lua_State *L, std::shared_ptr<Area> area,
                                       std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "VnumRanges");
    lua_newtable(L);
    PushVnumRange(L, "Room", area->VnumRanges.Room);
    PushVnumRange(L, "Mob", area->VnumRanges.Mob);
    PushVnumRange(L, "Object", area->VnumRanges.Object);
    lua_settable(L, -3);
}

void LuaAreaRepository::PushMetaData(lua_State *L, std::shared_ptr<Area> area,
                                     std::shared_ptr<VnumConverter> vnumConverter) const
{
    LuaSetfieldString(L, "Name", area->Name);

    std::string filename = EnsureProperFilename(area->Filename);

    LuaSetfieldNumber(L, "FileFormatVersion", CURRENT_FILEFORMAT_VERSION);
    LuaSetfieldString(L, "Filename", filename);
    LuaSetfieldString(L, "Author", area->Author);
    LuaSetfieldString(L, "ResetMessage", area->ResetMessage);
    LuaSetfieldNumber(L, "ResetFrequency", area->ResetFrequency);
    LuaSetfieldNumber(L, "HighEconomy", area->HighEconomy);
    LuaSetfieldNumber(L, "LowEconomy", area->LowEconomy);
    LuaPushFlags(L, area->Flags, AreaFlags, "Flags");
    PushLevelRanges(L, area, vnumConverter);
    PushVnumRanges(L, area, vnumConverter);
}

void LuaAreaRepository::PushArea(lua_State *L, const SaveData *data)
{
    const std::shared_ptr<Area> area = data->area;
    const LuaAreaRepository *repos = data->Repos;
    const bool install = data->Install;
    const auto vnumConverter = data->VnumConverter;
    
    lua_pushinteger(L, 0);
    lua_newtable(L);

    repos->PushMetaData(L, area, vnumConverter);

    if(!area->Flags.test(Flag::Area::PluginZone))
    {
        repos->PushMobiles(L, area, install, vnumConverter);
        repos->PushObjects(L, area, install, vnumConverter);
        repos->PushRooms(L, area, install, vnumConverter);
        repos->PushResets(L, area, vnumConverter);
    }
    
    lua_setglobal(L, "area");
}

void LuaAreaRepository::PushReset(lua_State *L, const std::shared_ptr<Reset> reset, size_t idx,
                                  std::shared_ptr<VnumConverter> vnumConverter) const
{
    auto relativeReset = vnumConverter->ResetToRelative(reset);

    lua_pushnumber(L, idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Command", std::string(1, CharToUppercase(relativeReset->Command)));
    LuaSetfieldNumber(L, "Arg1", relativeReset->Arg1);
    LuaSetfieldNumber(L, "Arg2", relativeReset->Arg2);
    LuaSetfieldNumber(L, "Arg3", relativeReset->Arg3);
    LuaSetfieldNumber(L, "MiscData", relativeReset->MiscData);
    
    lua_settable(L, -3);
}

void LuaAreaRepository::PushResets(lua_State *L, const std::shared_ptr<Area> area,
                                   std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "Resets");
    lua_newtable(L);
    size_t idx = 0;

    for(auto reset = area->FirstReset; reset; reset = reset->Next)
    {
        if(vnumConverter->ShouldPushReset(reset))
        {
            PushReset(L, reset, ++idx, vnumConverter);
        }
    }

    lua_settable(L, -3);
}

void LuaAreaRepository::PushExits(lua_State *L, const std::shared_ptr<Room> room,
                                  std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "Exits");
    lua_newtable(L);
    size_t idx = 0;

    for(auto xit : room->Exits())
    {
        if(!xit->Flags.test(Flag::Exit::Portal)) /* don't fold portals */
        {
            PushExit(L, xit, ++idx, vnumConverter);
        }
    }

    lua_settable(L, -3);
}

void LuaAreaRepository::PushExit(lua_State *L, const std::shared_ptr<Exit> xit, size_t idx,
                                 std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Direction", GetDirectionName(xit->Direction));
    LuaSetfieldString(L, "Description", StripCarriageReturn(xit->Description));
    LuaSetfieldString(L, "Keyword", StripCarriageReturn(xit->Keyword));
    LuaSetfieldNumber(L, "Key", xit->Key);
    LuaSetfieldNumber(L, "DestinationVnum", vnumConverter->AbsoluteToRelativeRoomVnum(xit->Vnum));
    LuaSetfieldNumber(L, "Distance", xit->Distance);

    auto flags = xit->Flags;
    flags.reset(Flag::Exit::Bashed);
    LuaPushFlags(L, flags, ExitFlags, "Flags");

    lua_settable(L, -3);
}

void LuaAreaRepository::PushOvalues(lua_State *L, const std::shared_ptr<ProtoObject> obj,
                                    std::shared_ptr<VnumConverter> vnumConverter) const
{
    auto ovalues = obj->Value;

    switch(obj->ItemType)
    {
    case ITEM_PILL:
    case ITEM_POTION:
    case ITEM_SCROLL:
        if(IS_VALID_SN(ovalues[OVAL_POTION_SPELL1]))
            ovalues[OVAL_POTION_SPELL1] = SkillTable[ovalues[OVAL_POTION_SPELL1]]->Slot;

        if(IS_VALID_SN(ovalues[OVAL_POTION_SPELL2]))
            ovalues[OVAL_POTION_SPELL2] = SkillTable[ovalues[OVAL_POTION_SPELL2]]->Slot;

        if(IS_VALID_SN(ovalues[OVAL_POTION_SPELL3]))
            ovalues[OVAL_POTION_SPELL3] = SkillTable[ovalues[OVAL_POTION_SPELL3]]->Slot;
        break;

    case ITEM_DEVICE:
        if(IS_VALID_SN(ovalues[OVAL_DEVICE_SPELL]))
            ovalues[OVAL_DEVICE_SPELL] = SkillTable[ovalues[OVAL_DEVICE_SPELL]]->Slot;
        break;

    case ITEM_SALVE:
        if(IS_VALID_SN(ovalues[OVAL_SALVE_SPELL1]))
            ovalues[OVAL_SALVE_SPELL1] = SkillTable[ovalues[OVAL_SALVE_SPELL1]]->Slot;

        if(IS_VALID_SN(ovalues[OVAL_SALVE_SPELL2]))
            ovalues[OVAL_SALVE_SPELL2] = SkillTable[ovalues[OVAL_SALVE_SPELL2]]->Slot;
        break;

    default:
        break;
    }

    LuaPushOvalues(L, ovalues);
}

void LuaAreaRepository::PushRoom(lua_State *L, const std::shared_ptr<Room> room, bool install,
                                 std::shared_ptr<VnumConverter> vnumConverter) const
{
    if(install)
    {
        room->Flags.reset(Flag::Room::Prototype);

        auto charactersToExtract = Filter(room->Characters(),
                                          [](auto victim)
                                          {
                                              return IsNpc(victim);
                                          });

        for(auto victim : charactersToExtract)
        {
            ExtractCharacter(victim, true);
        }

        /* purge room of (prototyped) objects */
        auto objectsToExtract = room->Objects();

        for(auto obj : objectsToExtract)
        {
            ExtractObject(obj);
        }
    }

    lua_pushinteger(L, vnumConverter->AbsoluteToRelativeRoomVnum(room->Vnum));
    lua_newtable(L);

    LuaSetfieldNumber(L, "Vnum", vnumConverter->AbsoluteToRelativeRoomVnum(room->Vnum));
    LuaSetfieldString(L, "Name", room->Name);
    LuaSetfieldString(L, "Tag", room->Tag());
    LuaSetfieldString(L, "Description", StripCarriageReturn(room->Description));
    LuaPushFlags(L, room->Flags, RoomFlags, "Flags");
    LuaSetfieldString(L, "Sector", SectorNames[(int)room->Sector][1]);
    LuaSetfieldNumber(L, "TeleDelay", room->TeleDelay);
    LuaSetfieldNumber(L, "TeleVnum", vnumConverter->AbsoluteToRelativeRoomVnum(room->TeleVnum));
    LuaSetfieldNumber(L, "Tunnel", room->Tunnel);
    PushExits(L, room, vnumConverter);
    LuaPushExtraDescriptions(L, room->ExtraDescriptions());
    LuaPushMudProgs(L, &room->mprog);

    lua_settable(L, -3);
}

void LuaAreaRepository::PushRooms(lua_State *L, const std::shared_ptr<Area> &area, bool install,
                                  std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "Rooms");
    lua_newtable(L);
    std::ranges::for_each(vnumConverter->RoomVnums(),
                          [this, L, vnumConverter, install](const auto vnum)
                          {
                              PushRoom(L, GetRoom(vnum), install, vnumConverter);
                          });
    lua_settable(L, -3);
}

void LuaAreaRepository::PushObject(lua_State *L, const std::shared_ptr<ProtoObject> obj,
                                   bool install,
                                   std::shared_ptr<VnumConverter> vnumConverter) const
{
    if(install)
    {
        obj->Flags.reset(Flag::Obj::Prototype);
    }

    lua_pushinteger(L, vnumConverter->AbsoluteToRelativeObjectVnum(obj->Vnum));
    lua_newtable(L);

    LuaSetfieldNumber(L, "Vnum", vnumConverter->AbsoluteToRelativeObjectVnum(obj->Vnum));
    LuaSetfieldString(L, "Tag", obj->Tag());
    LuaSetfieldString(L, "Name", obj->Name);
    LuaSetfieldString(L, "ShortDescr", obj->ShortDescr);
    LuaSetfieldString(L, "Description", obj->Description);
    LuaSetfieldString(L, "ActionDescription", obj->ActionDescription);
    LuaSetfieldString(L, "ItemType", ObjectTypes[obj->ItemType]);
    LuaSetfieldNumber(L, "Layers", obj->Layers);
    LuaPushFlags(L, obj->Flags, ObjectFlags, "Flags");
    LuaPushFlags(L, obj->WearFlags, WearFlags, "WearFlags");
    PushOvalues(L, obj, vnumConverter);
    LuaSetfieldNumber(L, "Weight", obj->Weight);
    LuaSetfieldNumber(L, "Cost", obj->Cost);
    LuaPushExtraDescriptions(L, obj->ExtraDescriptions());
    LuaPushProtoObjectAffects(L, obj->Affects());
    LuaPushMudProgs(L, &obj->mprog);

    lua_settable(L, -3);
}

void LuaAreaRepository::PushObjects(lua_State *L, const std::shared_ptr<Area> &area,
                                    bool install,
                                    std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "Objects");
    lua_newtable(L);
    std::ranges::for_each(vnumConverter->ObjectVnums(),
                          [this, L, vnumConverter, install](const auto vnum)
                          {
                              PushObject(L, GetProtoObject(vnum), install, vnumConverter);
                          });
    lua_settable(L, -3);
}

void LuaAreaRepository::PushMobiles(lua_State *L, const std::shared_ptr<Area> &area, bool install,
                                    std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "Mobiles");
    lua_newtable(L);
    std::ranges::for_each(vnumConverter->MobileVnums(),
                          [this, L, vnumConverter, install](const auto vnum)
                          {
                              PushMobile(L, GetProtoMobile(vnum), install, vnumConverter);
                          });
    lua_settable(L, -3);
}

void LuaAreaRepository::PushMobile(lua_State *L, const std::shared_ptr<ProtoMobile> mob, bool install,
                                   std::shared_ptr<VnumConverter> vnumConverter) const
{
    if(install)
    {
        mob->Flags.reset(Flag::Mob::Prototype);
    }

    lua_pushinteger(L, vnumConverter->AbsoluteToRelativeMobileVnum(mob->Vnum));
    lua_newtable(L);

    LuaSetfieldString(L, "Name", mob->Name);
    LuaSetfieldNumber(L, "Vnum", vnumConverter->AbsoluteToRelativeMobileVnum(mob->Vnum));
    LuaSetfieldString(L, "Tag", mob->Tag());
    LuaSetfieldString(L, "ShortDescr", mob->ShortDescr);
    LuaSetfieldString(L, "LongDescr", StripCarriageReturn(mob->LongDescr));
    LuaSetfieldString(L, "Description", StripCarriageReturn(mob->Description));
    LuaPushFlags(L, mob->Flags, MobFlags, "Flags");
    LuaPushFlags(L, mob->AffectedBy, AffectFlags, "AffectedBy");
    LuaSetfieldNumber(L, "Alignment", mob->Alignment);
    LuaSetfieldNumber(L, "Level", mob->Level);
    LuaSetfieldNumber(L, "ArmorClass", mob->ArmorClass);

    lua_pushstring(L, "HitChance");
    lua_newtable(L);
    LuaSetfieldNumber(L, "HitNoDice", mob->HitNoDice);
    LuaSetfieldNumber(L, "HitSizeDice", mob->HitSizeDice);
    LuaSetfieldNumber(L, "HitPlus", mob->HitPlus);
    lua_settable(L, -3);

    lua_pushstring(L, "Damage");
    lua_newtable(L);
    LuaSetfieldNumber(L, "DamNoDice", mob->DamNoDice);
    LuaSetfieldNumber(L, "DamSizeDice", mob->DamSizeDice);
    LuaSetfieldNumber(L, "DamPlus", mob->DamPlus);
    lua_settable(L, -3);

    LuaSetfieldNumber(L, "Credits", mob->Gold);
    LuaSetfieldString(L, "Position", PositionName[mob->Position]);
    LuaSetfieldString(L, "DefaultPosition", PositionName[mob->DefaultPosition]);
    LuaSetfieldString(L, "Sex", SexNames[mob->Sex]);
    LuaSetfieldString(L, "Race", NpcRace[mob->Race]);
    LuaSetfieldNumber(L, "Height", mob->Height);
    LuaSetfieldNumber(L, "Weight", mob->Weight);
    LuaSetfieldNumber(L, "NumberOfAttacks", mob->NumberOfAttacks);
    LuaSetfieldNumber(L, "HitRoll", mob->HitRoll);
    LuaSetfieldNumber(L, "DamRoll", mob->DamRoll);
    LuaPushFlags(L, mob->AttackFlags, AttackFlags, "AttackFlags");
    LuaPushFlags(L, mob->DefenseFlags, DefenseFlags, "DefenseFlags");
    LuaPushFlags(L, mob->Resistant, RisFlags, "Resistant");
    LuaPushFlags(L, mob->Immune, RisFlags, "Immune");
    LuaPushFlags(L, mob->Susceptible, RisFlags, "Susceptible");
    LuaPushFlags(L, mob->VipFlags, WantedFlags, "VipFlags");

    LuaPushStats(L, &mob->Stats, "Stats");
    LuaPushSaveVs(L, &mob->Saving, "SaveVs");

    lua_pushstring(L, "Languages");
    lua_newtable(L);
    LuaPushLanguages(L, mob->Speaks, "Speaks");
    LuaPushLanguages(L, mob->Speaking, "Speaking");
    lua_settable(L, -3);

    LuaPushMudProgs(L, &mob->mprog);

    if(mob->Shop != nullptr)
    {
        PushShop(L, mob, vnumConverter);
    }

    if(mob->RepairShop != nullptr)
    {
        PushRepairShop(L, mob, vnumConverter);
    }

    PushSpecials(L, mob, vnumConverter);

    lua_settable(L, -3);
}

template<typename T>
static void PushBusinessHours(lua_State *L, const T &businessHours)
{
    lua_pushstring(L, "BusinessHours");
    lua_newtable(L);

    LuaSetfieldNumber(L, "Open", businessHours.Open);
    LuaSetfieldNumber(L, "Close", businessHours.Close);

    lua_settable(L, -3);
}

template<size_t N>
static void PushBuyTypes(lua_State *L, const std::array<ItemTypes, N> itemTypes,
                         const std::string &key)
{
    lua_pushstring(L, key.c_str());
    lua_newtable(L);

    for(size_t i = 0; i < itemTypes.size(); ++i)
    {
        lua_pushinteger(L, i);
        lua_pushstring(L, ObjectTypes[itemTypes[i]]);
        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

void LuaAreaRepository::PushShop(lua_State *L, const std::shared_ptr<ProtoMobile> keeper,
                                 std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "Shop");
    lua_newtable(L);

    auto shop = keeper->Shop;

    LuaSetfieldNumber(L, "ProfitBuy", shop->ProfitBuy);
    LuaSetfieldNumber(L, "ProfitSell", shop->ProfitSell);
    PushBusinessHours(L, shop->BusinessHours);
    PushBuyTypes<MAX_TRADE>(L, shop->BuyType, "BuyTypes");
    LuaSetfieldString(L, "KeeperShortDescr", keeper->ShortDescr);

    lua_settable(L, -3);
}

void LuaAreaRepository::PushRepairShop(lua_State *L, const std::shared_ptr<ProtoMobile> keeper,
                                       std::shared_ptr<VnumConverter> vnumConverter) const
{
    lua_pushstring(L, "RepairShop");
    lua_newtable(L);

    auto shop = keeper->RepairShop;

    LuaSetfieldNumber(L, "ProfitFix", shop->ProfitFix);
    LuaSetfieldNumber(L, "ShopType", shop->ShopType);
    PushBusinessHours(L, shop->BusinessHours);
    PushBuyTypes<MAX_FIX>(L, shop->FixType, "FixTypes");
    LuaSetfieldString(L, "KeeperShortDescr", keeper->ShortDescr);

    lua_settable(L, -3);
}

void LuaAreaRepository::PushSpecials(lua_State *L, const std::shared_ptr<ProtoMobile> mob,
                                     std::shared_ptr<VnumConverter> vnumConverter) const
{
    std::vector<std::function<bool(std::shared_ptr<Character>)>> specfuns;

    if(mob->SpecFuns[0] != nullptr)
    {
        specfuns.push_back(mob->SpecFuns[0]);
    }

    if(mob->SpecFuns[1] != nullptr)
    {
        specfuns.push_back(mob->SpecFuns[1]);
    }

    LuaPushCollection(L, specfuns, "SpecFuns", LuaPushSpecFun);
}

template<typename T>
static void GetLevelRangeFields(lua_State *L, T &range)
{
    LuaGetfieldInt(L, "Low", &range->Low);
    LuaGetfieldInt(L, "High", &range->High);
}

void LuaAreaRepository::LoadLevelRanges(lua_State *L, std::shared_ptr<Area> area)
{
    LuaLoadTable(L, "LevelRanges",
                 [L](lua_State *, auto &ranges)
                 {
                     LuaLoadTable(L, "Soft",
                                  GetLevelRangeFields<decltype(ranges->Soft) *>,
                                  &ranges->Soft);
                     LuaLoadTable(L, "Hard",
                                  GetLevelRangeFields<decltype(ranges->Hard) *>,
                                  &ranges->Soft);
                 },
                 &area->LevelRanges);
}

template<typename T>
static void GetVnumRangeFields(lua_State *L, T &range)
{
    LuaGetfieldLong(L, "First", &range->First);
    LuaGetfieldLong(L, "Last", &range->Last);
}

void LuaAreaRepository::LoadVnumRanges(lua_State *L, std::shared_ptr<Area> area)
{
    LuaLoadTable(L, "VnumRanges",
                 [L](lua_State *, auto &ranges)
                 {
                     LuaLoadTable(L, "Room",
                                  GetVnumRangeFields<decltype(ranges->Room) *>,
                                  &ranges->Room);
                     LuaLoadTable(L, "Mob",
                                  GetVnumRangeFields<decltype(ranges->Mob) *>,
                                  &ranges->Mob);
                     LuaLoadTable(L, "Object",
                                  GetVnumRangeFields<decltype(ranges->Object) *>,
                                  &ranges->Object);
                 },
                 &area->VnumRanges);
}

void LuaAreaRepository::LoadMetaData(lua_State *L, std::shared_ptr<Area> area)
{
    LuaGetfieldInt(L, "FileFormatVersion", &FILEFORMAT_VERSION_BEING_LOADED);
    LuaGetfieldString(L, "Name", &area->Name);
    LuaGetfieldString(L, "Filename", &area->Filename);
    LuaGetfieldString(L, "Author", &area->Author);
    LuaGetfieldString(L, "ResetMessage", &area->ResetMessage);
    LuaGetfieldInt(L, "ResetFrequency",
                   [area](auto resetFrequency)
                   {
                       area->ResetFrequency = (short)resetFrequency;

                       if(area->ResetFrequency != 0)
                       {
                           area->Age = area->ResetFrequency;
                       }
                   });
    LuaGetfieldInt(L, "HighEconomy", &area->HighEconomy);
    LuaGetfieldInt(L, "LowEconomy", &area->LowEconomy);

    if(FieldExists(L, "Flags"))
    {
        area->Flags = LuaLoadFlags(L, "Flags");
    }

    LoadLevelRanges(L, area);
    LoadVnumRanges(L, area);
}

static void LoadHitChance(lua_State *L, std::shared_ptr<ProtoMobile> mob)
{
    LuaGetfieldInt(L, "HitNoDice", &mob->HitNoDice);
    LuaGetfieldInt(L, "HitSizeDice", &mob->HitSizeDice);
    LuaGetfieldInt(L, "HitPlus", &mob->HitPlus);
}

static void LoadDamage(lua_State *L, std::shared_ptr<ProtoMobile> mob)
{
    LuaGetfieldInt(L, "DamNoDice", &mob->DamNoDice);
    LuaGetfieldInt(L, "DamSizeDice", &mob->DamSizeDice);
    LuaGetfieldInt(L, "DamPlus", &mob->DamPlus);
}

static void LoadMudProg(lua_State *L, int subscript, MProg *mprog)
{
    auto prog = std::make_shared<MPROG_DATA>();
    LuaGetfieldString(L, "MudProgType",
                      [prog](const auto &name)
                      {
                          prog->type = MobProgNameToType(name);
                      });
    LuaGetfieldString(L, "ScriptType",
                      [prog](const auto &name)
                      {
                          prog->SType = StrCmp(name, "Imp") == 0 ? ScriptType::Imp : ScriptType::MProg;
                      });
    LuaGetfieldString(L, "Arguments",
                      [prog](const auto &args)
                      {
                          prog->arglist = args;
                      });
    LuaGetfieldString(L, "Code", &prog->comlist);
    mprog->Add(prog);
    mprog->progtypes |= prog->type;
}

static void LoadLanguages(lua_State *L, std::shared_ptr<ProtoMobile> mob)
{
    mob->Speaks = LuaLoadFlags(L, "Speaks").to_ulong();
    mob->Speaking = LuaLoadFlags(L, "Speaking").to_ulong();

    if(mob->Speaks == 0)
    {
        mob->Speaks = RaceTable[mob->Race].Language | LANG_COMMON;
    }

    if(!mob->Speaking)
    {
        mob->Speaking = RaceTable[mob->Race].Language;
    }
}

template<typename ShopT>
static void LoadBusinessHours(lua_State *L, std::shared_ptr<ShopT> shop)
{
    LuaGetfieldShort(L, "Open", &shop->BusinessHours.Open);
    LuaGetfieldShort(L, "Close", &shop->BusinessHours.Close);
}

template<size_t N>
static void LoadBuyType(lua_State *L, int subscript, std::array<ItemTypes, N> &buyType)
{
    auto itemType = lua_tostring(L, -1);
    buyType[subscript] = GetObjectType(itemType);
}

static void LoadShop(lua_State *L, std::shared_ptr<ProtoMobile> mob)
{
    mob->Shop = std::make_shared<Shop>();
    mob->Shop->Keeper = mob->Vnum;
    LuaGetfieldShort(L, "ProfitBuy", &mob->Shop->ProfitBuy);
    LuaGetfieldShort(L, "ProfitSell", &mob->Shop->ProfitSell);
    LuaGetfieldString(L, "KeeperShortDescr", &mob->ShortDescr);
    LuaLoadTable(L, "BusinessHours", LoadBusinessHours<Shop>, mob->Shop);
    LuaLoadArray(L, "BuyTypes", LoadBuyType<MAX_TRADE>, mob->Shop->BuyType);

    Shops->Add(mob->Shop);
}

static void LoadRepairShop(lua_State *L, std::shared_ptr<ProtoMobile> mob)
{
    mob->RepairShop = std::make_shared<RepairShop>();
    mob->RepairShop->Keeper = mob->Vnum;
    LuaGetfieldShort(L, "ProfitFix", &mob->RepairShop->ProfitFix);
    LuaGetfieldShort(L, "ShopType", &mob->RepairShop->ShopType);
    LuaGetfieldString(L, "KeeperShortDescr", &mob->ShortDescr);
    LuaLoadTable(L, "BusinessHours", LoadBusinessHours<RepairShop>, mob->RepairShop);
    LuaLoadArray(L, "BuyTypes", LoadBuyType<MAX_FIX>, mob->RepairShop->FixType);

    RepairShops->Add(mob->RepairShop);
}

void LuaAreaRepository::LoadMobile(lua_State *L, std::shared_ptr<ProtoMobile> mob)
{
    LuaGetfieldString(L, "Name", &mob->Name);
    LuaGetfieldLong(L, "Vnum", &mob->Vnum);
    LuaGetfieldString(L, "ShortDescr", &mob->ShortDescr);
    LuaGetfieldString(L, "LongDescr", &mob->LongDescr);
    mob->LongDescr[0] = CharToUppercase(mob->LongDescr[0]);
    LuaGetfieldString(L, "Description", &mob->Description);
    mob->Description[0] = CharToUppercase(mob->Description[0]);
    LuaGetfieldInt(L, "Alignment", &mob->Alignment);
    LuaGetfieldInt(L, "Level", &mob->Level);
    LuaGetfieldInt(L, "ArmorClass", &mob->ArmorClass);
    LuaGetfieldInt(L, "Credits", &mob->Gold);
    LuaGetfieldString(L, "Tag",
                      [mob](const auto &tag)
                      {
                          mob->Tag(tag);
                      });
    LuaGetfieldString(L, "Position",
                      [mob](auto positionName)
                      {
                          mob->Position = GetPosition(positionName);
                      });
    LuaGetfieldString(L, "DefaultPosition",
                      [mob](auto positionName)
                      {
                          mob->DefaultPosition = GetPosition(positionName);
                      });
    LuaGetfieldString(L, "Sex",
                      [mob](auto sexName)
                      {
                          mob->Sex = GetSex(sexName);
                      });
    LuaGetfieldString(L, "Race",
                      [mob](auto raceName)
                      {
                          auto race = GetNpcRace(raceName);

                          if(race != -1)
                          {
                              mob->Race = race;
                          }
                          else
                          {
                              mob->Race = RACE_HUMAN;
                          }
                      });
    LuaGetfieldInt(L, "Height", &mob->Height);
    LuaGetfieldInt(L, "Weight", &mob->Weight);
    LuaGetfieldInt(L, "NumberOfAttacks", &mob->NumberOfAttacks);
    LuaGetfieldInt(L, "HitRoll", &mob->HitRoll);
    LuaGetfieldInt(L, "DamRoll", &mob->DamRoll);

    mob->Flags = LuaLoadFlags(L, "Flags");
    mob->Flags.set(Flag::Mob::Npc);
    mob->AffectedBy = LuaLoadFlags(L, "AffectedBy");
    mob->AttackFlags = LuaLoadFlags(L, "AttackFlags");
    mob->DefenseFlags = LuaLoadFlags(L, "DefenseFlags");
    mob->Resistant = LuaLoadFlags(L, "Resistant");
    mob->Immune = LuaLoadFlags(L, "Immune");
    mob->Susceptible = LuaLoadFlags(L, "Susceptible");
    mob->VipFlags = LuaLoadFlags(L, "VipFlags");

    LuaLoadTable(L, "HitChance", LoadHitChance, mob);
    LuaLoadTable(L, "Damage", LoadDamage, mob);
    LuaLoadTable(L, "Languages", LoadLanguages, mob);

    LuaLoadStats(L, &mob->Stats, "Stats");
    
    // Load progs
    LuaLoadArray(L, "MudProgs", LoadMudProg, &mob->mprog);

    // Load shop
    LuaLoadTable(L, "Shop", LoadShop, mob);

    // Load repair shop
    LuaLoadTable(L, "RepairShop", LoadRepairShop, mob);

    // Load specials
    std::vector<std::function<bool(std::shared_ptr<Character>)>> specfuns;
    LuaLoadArray(L, "SpecFuns", LuaLoadSpecFun, &specfuns);
    AssignSpecFuns(mob, specfuns);
}

void LuaAreaRepository::LoadMobilesCallback(lua_State *L, vnum_t vnum, std::shared_ptr<Area> area)
{
#if 0
    if(GetProtoMobile(vnum))
    {
        Log->Bug("%s: vnum %ld duplicated.", __FUNCTION__, vnum);
        ShutdownMud("duplicate vnum");
        exit(1);
    }
#endif

    auto mob = std::make_shared<ProtoMobile>(vnum);
    LoadMobile(L, mob);

    if(area->VnumRanges.Mob.First == INVALID_VNUM
       || vnum < area->VnumRanges.Mob.First)
    {
        area->VnumRanges.Mob.First = vnum;
    }

    if(vnum > area->VnumRanges.Mob.Last)
    {
        area->VnumRanges.Mob.Last = vnum;
    }

    if(area->SavingPlugin == nullptr)
    {
        ProtoMobs.insert({ vnum, mob });
    }
    else
    {
        area->SavingPlugin->Add(mob, vnum);
    }
}

void LuaAreaRepository::LoadMobiles(lua_State *L, std::shared_ptr<Area> area)
{
    LuaLoadArray(L, "Mobiles", &LuaAreaRepository::LoadMobilesCallback, area);
}

void LuaAreaRepository::LoadObjectsCallback(lua_State *L, vnum_t vnum, std::shared_ptr<Area> area)
{
#if 0
    if(GetProtoObject(vnum))
    {
        Log->Bug("%s: vnum %ld duplicated.", __FUNCTION__, vnum);
        ShutdownMud("duplicate vnum");
        exit(1);
    }
#endif

    auto obj = std::make_shared<ProtoObject>(vnum);
    LoadObject(L, obj);

    if(area->VnumRanges.Object.First == INVALID_VNUM
       || vnum < area->VnumRanges.Object.First)
    {
        area->VnumRanges.Object.First = vnum;
    }

    if(vnum > area->VnumRanges.Object.Last)
    {
        area->VnumRanges.Object.Last = vnum;
    }

    if(area->SavingPlugin == nullptr)
    {
        ProtoObjects.insert({ vnum, obj });
    }
    else
    {
        area->SavingPlugin->Add(obj, vnum);
    }
}

void LuaAreaRepository::LoadObjects(lua_State *L, std::shared_ptr<Area> area)
{
    LuaLoadArray(L, "Objects", &LuaAreaRepository::LoadObjectsCallback, area);
}

void LuaAreaRepository::LoadOvalues(lua_State *L, std::shared_ptr<ProtoObject> obj)
{
    LuaLoadOvalues(L, obj->Value);

    switch(obj->ItemType)
    {
    case ITEM_PILL:
    case ITEM_POTION:
        obj->Value[OVAL_PILL_SPELL1] = SkillNumberFromSlot(obj->Value[OVAL_PILL_SPELL1]);
        obj->Value[OVAL_PILL_SPELL2] = SkillNumberFromSlot(obj->Value[OVAL_PILL_SPELL2]);
        obj->Value[OVAL_PILL_SPELL3] = SkillNumberFromSlot(obj->Value[OVAL_PILL_SPELL3]);
        break;

    case ITEM_DEVICE:
        obj->Value[OVAL_DEVICE_SPELL] = SkillNumberFromSlot(obj->Value[OVAL_DEVICE_SPELL]);
        break;

    case ITEM_SALVE:
        obj->Value[OVAL_SALVE_SPELL1] = SkillNumberFromSlot(obj->Value[OVAL_SALVE_SPELL1]);
        obj->Value[OVAL_SALVE_SPELL2] = SkillNumberFromSlot(obj->Value[OVAL_SALVE_SPELL2]);
        break;

    default:
        break;
    }
}

static void LoadExtraDescriptions(lua_State *L, std::shared_ptr<ProtoObject> obj)
{
    auto extraDescriptions = LuaLoadExtraDescriptions(L);

    for(auto extra : extraDescriptions)
    {
        obj->Add(extra);
    }
}

static void LoadObjectAffects(lua_State *L, std::shared_ptr<ProtoObject> obj)
{
    auto affects = LuaLoadProtoObjectAffects(L);

    for(auto affect : affects)
    {
        obj->Add(affect);
    }
}

void LuaAreaRepository::LoadObject(lua_State *L, std::shared_ptr<ProtoObject> obj)
{
    LuaGetfieldLong(L, "Vnum", &obj->Vnum);
    LuaGetfieldString(L, "Name", &obj->Name);
    LuaGetfieldString(L, "ShortDescr", &obj->ShortDescr);
    LuaGetfieldString(L, "Description", &obj->Description);
    obj->Description[0] = CharToUppercase(obj->Description[0]);
    LuaGetfieldString(L, "ActionDescription", &obj->ActionDescription);
    LuaGetfieldString(L, "Tag",
                      [obj](const auto &tag)
                      {
                          obj->Tag(tag);
                      });
    LuaGetfieldString(L, "ItemType",
                      [obj](const auto &itemType)
                      {
                          obj->ItemType = GetObjectType(itemType);
                      });
    LuaGetfieldInt(L, "Layers", &obj->Layers);
    LuaGetfieldInt(L, "Weight", &obj->Weight);
    LuaGetfieldInt(L, "Cost", &obj->Cost);

    obj->Flags = LuaLoadFlags(L, "Flags");
    obj->WearFlags = LuaLoadFlags(L, "WearFlags");

    LoadOvalues(L, obj);
    LuaLoadArray(L, "MudProgs", LoadMudProg, &obj->mprog);
    LoadExtraDescriptions(L, obj);
    LoadObjectAffects(L, obj);
}

void LuaAreaRepository::LoadRoomsCallback(lua_State *L, vnum_t vnum, std::shared_ptr<Area> area)
{
#if 0
    if(GetRoom(vnum) != nullptr)
    {
        Log->Bug("%s: vnum %ld duplicated.", __FUNCTION__, vnum);
        ShutdownMud("duplicate vnum");
        exit(1);
    }
#endif

    auto room = std::make_shared<Room>(vnum);
    room->Area = area;
    LoadRoom(L, room);

    if(area->VnumRanges.Room.First == INVALID_VNUM
       || vnum < area->VnumRanges.Room.First)
    {
        area->VnumRanges.Room.First = vnum;
    }

    if(vnum > area->VnumRanges.Room.Last)
    {
        area->VnumRanges.Room.Last = vnum;
    }

    if(area->SavingPlugin == nullptr)
    {
        int iHash = vnum % MAX_KEY_HASH;
        room->Next = RoomIndexHash[iHash];
        RoomIndexHash[iHash] = room;
        top_room++;
    }
    else
    {
        area->SavingPlugin->Add(room, vnum);
    }
}

void LuaAreaRepository::LoadRooms(lua_State *L, std::shared_ptr<Area> area)
{
    LuaLoadArray(L, "Rooms", &LuaAreaRepository::LoadRoomsCallback, area);
}

static void LoadExtraDescriptions(lua_State *L, std::shared_ptr<Room> room)
{
    auto extraDescriptions = LuaLoadExtraDescriptions(L);

    for(auto extra : extraDescriptions)
    {
        room->Add(extra);
    }
}

static void LoadExit(lua_State *L, int subscript, std::shared_ptr<Room> room)
{
    std::string keyword;
    LuaGetfieldString(L, "Keyword", &keyword);

    DirectionType direction;
    LuaGetfieldString(L, "Direction",
                      [&direction](const auto &dirName)
                      {
                          direction = GetDirection(dirName);
                      });
    auto xit = MakeExit(room, nullptr, direction, keyword);

    LuaGetfieldString(L, "Description", &xit->Description);
    LuaGetfieldLong(L, "Key", &xit->Key);
    LuaGetfieldLong(L, "DestinationVnum", &xit->Vnum);
    LuaGetfieldShort(L, "Distance", &xit->Distance);

    xit->Flags = LuaLoadFlags(L, "Flags");
}

void LuaAreaRepository::LoadRoom(lua_State *L, std::shared_ptr<Room> room)
{
    LuaGetfieldLong(L, "Vnum", &room->Vnum);
    LuaGetfieldString(L, "Name", &room->Name);
    LuaGetfieldString(L, "Description", &room->Description);
    LuaGetfieldString(L, "Sector",
                      [room](const auto &sector)
                      {
                          room->Sector = GetSectorType(sector);

                          if(room->Sector <= SectorType::Invalid
                             || room->Sector >= SectorType::Max)
                          {
                              Log->Bug("%s: vnum %ld has bad sector_type %d.",
                                       __FUNCTION__, room->Vnum,
                                       (int)room->Sector);
                              room->Sector = SectorType::Inside;
                          }
                      });
    LuaGetfieldInt(L, "TeleDelay", &room->TeleDelay);
    LuaGetfieldLong(L, "TeleVnum", &room->TeleVnum);
    LuaGetfieldInt(L, "Tunnel", &room->Tunnel);
    LuaGetfieldString(L, "Tag",
                      [room](const auto &tag)
                      {
                          room->Tag(tag);
                      });
    room->Flags = LuaLoadFlags(L, "Flags");
    LoadExtraDescriptions(L, room);
    LuaLoadArray(L, "MudProgs", LoadMudProg, &room->mprog);
    LuaLoadArray(L, "Exits", LoadExit, room);
}

void LuaAreaRepository::LoadResets(lua_State *L, std::shared_ptr<Area> area)
{
    // Why do we use this map to collect the data instead of adding
    // to the area directly you may ask? It's because there's no
    // guarantee that the array is stored in ascending order
    // in the data file.
    std::map<int, std::shared_ptr<Reset>> resets;
    LuaLoadArray(L, "Resets", &LuaAreaRepository::LoadReset, &resets);

    // Add to area here
    for(auto [_, reset] : resets)
    {
        if(reset->Command != '*')
        {
            AddReset(area, reset->Command, reset->MiscData, reset->Arg1, reset->Arg2, reset->Arg3,
                     area->SavingPlugin);
        }
    }

    RenumberPutResets(area);
}

void LuaAreaRepository::LoadReset(lua_State *L, int subscript,
                                  std::map<int, std::shared_ptr<Reset>> *resets)
{
    auto reset = std::make_shared<Reset>();
    LuaGetfieldString(L, "Command",
                      [reset](const std::string &cmd)
                      {
                          reset->Command = cmd[0];
                      });
    LuaGetfieldInt(L, "Arg1", &reset->Arg1);
    LuaGetfieldInt(L, "Arg2", &reset->Arg2);
    LuaGetfieldInt(L, "MiscData", &reset->MiscData);

    if(FieldExists(L, "Arg3"))
    {
        LuaGetfieldInt(L, "Arg3", &reset->Arg3);

        if(reset->Command == 'G' || reset->Command == 'R')
        {
            reset->Arg3 = 0;
        }
    }

    resets->insert({ subscript, reset });
}

int LuaAreaRepository::L_AreaEntry(lua_State *L)
{
    std::shared_ptr<Area> area;

    lua_getglobal(L, "UserData");

    if(lua_islightuserdata(L, -1))
    {
        area = *static_cast<std::shared_ptr<Area>*>(lua_touserdata(L, -1));
    }
    else
    {
        area = std::make_shared<Area>();
    }

    lua_pop(L, 1);
    LuaGetfieldString(L, "Filename", &area->Filename);
    Log->Info("Loading %s", area->Filename.c_str());
    area->Age = 15;
    area->LevelRanges.Soft.High = MAX_LEVEL;
    area->LevelRanges.Hard.High = MAX_LEVEL;

    LoadMetaData(L, area);

    if(!area->Flags.test(Flag::Area::PluginZone))
    {
        LoadMobiles(L, area);
        LoadObjects(L, area);
        LoadRooms(L, area);
        LoadResets(L, area);
    }

    // Wrap with "if not userdata".
    // Ie, we don't want to add temporary plugin zones to global list.
    if(area->SavingPlugin == nullptr)
    {
        Areas->Add(area);
    }
    
    fprintf(stderr, "%-14s: Rooms: %5ld - %-5ld Objs: %5ld - %-5ld Mobs: %5ld - %ld\n",
            area->Filename.c_str(),
            area->VnumRanges.Room.First, area->VnumRanges.Room.Last,
            area->VnumRanges.Object.First, area->VnumRanges.Object.Last,
            area->VnumRanges.Mob.First, area->VnumRanges.Mob.Last);

    return 0;
}

void LuaAreaRepository::ExecuteAreaFile(const std::string &filename)
{
    LuaLoadDataFile(filename, L_AreaEntry, "AreaEntry");
}

////////////////////////////////
std::shared_ptr<AreaRepository> NewLuaAreaRepository()
{
    return std::make_shared<LuaAreaRepository>();
}

std::string LuaAreaRepository::GetAreaFilename(std::shared_ptr<Area> area) const
{
    if(area->SavingPlugin)
    {
        return GetPluginPath(area->SavingPlugin) + "/area.lua";
    }
    else
    {
        std::string filename = area->Filename;

        if(StringEndsWith(filename, ".are"))
        {
            // Chop off legacy file extension.
            filename = filename.substr(0, filename.size() - 4);
        }

        const char *directory = area->Flags.test(Flag::Area::Prototype) ? BUILD_DIR : AREA_DIR;
        return FormatString("%s%s", directory, ConvertToLuaFilename(filename).c_str());
    }
}
