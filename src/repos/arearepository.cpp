#include <memory>
#include <filesystem>
#include <utility/algorithms.hpp>
#include "log.hpp"
#include "mud.hpp"
#include "arearepository.hpp"
#include "area.hpp"
#include "script.hpp"
#include "protomob.hpp"
#include "protoobject.hpp"
#include "room.hpp"
#include "reset.hpp"
#include "race.hpp"
#include "skill.hpp"
#include "character.hpp"
#include "exit.hpp"

namespace fs = std::filesystem;

std::shared_ptr<AreaRepository> Areas;

class LuaAreaRepository : public AreaRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(const std::shared_ptr<Area>&) const override;
    void Save(const std::shared_ptr<Area>&, bool install) const override;
private:
    //static void PushMember(lua_State* L, const std::shared_ptr<ClanMember>& member, int idx);
    //static void PushMembers(lua_State* L, const
    //std::shared_ptr<Clan>& clan);
    static void PushExits(lua_State *L, const std::shared_ptr<Room> room);
    static void PushExit(lua_State *L, const std::shared_ptr<Exit> xit, size_t idx);
    static void PushRooms(lua_State *L, const std::shared_ptr<Area> &area, bool install);
    static void PushRoom(lua_State *L, const std::shared_ptr<Room> room, bool install);
    static void PushObjects(lua_State *L, const std::shared_ptr<Area> &area, bool install);
    static void PushObject(lua_State *L, const std::shared_ptr<ProtoObject> obj, bool install);
    static void PushMobiles(lua_State *L, const std::shared_ptr<Area> &area, bool install);
    static void PushMobile(lua_State *L, const std::shared_ptr<ProtoMobile> mob, bool install);
    static void PushArea(lua_State* L, const void* userData);
    static void PushOvalues(lua_State *L, const std::shared_ptr<ProtoObject> obj);
    //static void LoadOneMember(lua_State* L, const std::shared_ptr<Clan>& clan);
    //static void LoadMembers(lua_State* L, const std::shared_ptr<Clan>& clan);
    //static void LoadStoreroom(lua_State* L, const std::shared_ptr<Clan>& clan);
    //static int L_ClanEntry(lua_State* L);
    //static void ExecuteClanFile(const std::string& filePath, void* userData);
};

void LuaAreaRepository::Load()
{
    /*ForEachLuaFileInDir(CLAN_DIR, ExecuteClanFile, NULL);

    for (const auto& clan : Clans)
    {
        AssignGuildToMainclan(clan);
    }*/
}

void LuaAreaRepository::Save() const
{
    //for (const auto &area : Entities())
    for(auto area = FirstArea; area; area = area->Next)
    {
        Save(area);
    }
}

void LuaAreaRepository::Save(const std::shared_ptr<Area> &area) const
{
    Save(area, false);
}

struct SaveData
{
    SaveData(std::shared_ptr<Area> a, bool i) : area(a), Install(i) {}
    std::shared_ptr<Area> area;
    bool Install = false;
};
    
void LuaAreaRepository::Save(const std::shared_ptr<Area> &area, bool install) const
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

    SaveData data(area, install);
    
    LuaSaveDataFile(GetAreaFilename(area), PushArea, "area", &data);
}

static std::string EnsureProperFilename(std::string filename)
{
    if (StringEndsWith(filename, ".are"))
    {
        // Chop off legacy file extension.
        filename = filename.substr(0, filename.size() - 4);
    }

    return ConvertToLuaFilename(filename);
}

void LuaAreaRepository::PushArea(lua_State* L, const void* userData)
{
    const SaveData *data = static_cast<const SaveData*>(userData);
    const std::shared_ptr<Area> area = data->area;
    
    lua_pushinteger(L, 0);
    lua_newtable(L);
    
    // Meta data like name, filename, author, flags, reset message,
    // and economy.
    // I recommend not saving vnum ranges but instead let these be
    // inferred.
    LuaSetfieldString(L, "Name", area->Name);

    std::string filename = EnsureProperFilename(area->Filename);

    LuaSetfieldString(L, "Filename", filename);
    LuaSetfieldString(L, "Author", area->Author);
    LuaSetfieldString(L, "ResetMessage", area->ResetMessage);
    LuaSetfieldNumber(L, "HighEconomy", area->HighEconomy);
    LuaSetfieldNumber(L, "LowEconomy", area->LowEconomy);
    LuaPushFlags(L, area->Flags, AreaFlags, "Flags");
    
    // Save mobiles
    PushMobiles(L, area, data->Install);
    
    // Save objects
    PushObjects(L, area, data->Install);
    
    // Save rooms
    PushRooms(L, area, data->Install);
    
    // Shops. Or save along with room?

    // Save specials. Or save along with mob?

    lua_setglobal(L, "area");
}

void LuaAreaRepository::PushExits(lua_State *L, const std::shared_ptr<Room> room)
{
    lua_pushstring(L, "Exits");
    lua_newtable(L);
    size_t idx = 0;
    
    for(auto xit : room->Exits())
    {
        if(!xit->Flags.test(Flag::Exit::Portal)) /* don't fold portals */
        {
            PushExit(L, xit, ++idx);
        }
    }

    lua_settable(L, -3);
}

void LuaAreaRepository::PushExit(lua_State *L, const std::shared_ptr<Exit> xit, size_t idx)
{
    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Direction", GetDirectionName(xit->Direction));
    LuaSetfieldString(L, "Description", StripCarriageReturn(xit->Description));
    LuaSetfieldString(L, "Keyword", StripCarriageReturn(xit->Keyword));
    LuaSetfieldNumber(L, "Key", xit->Key);
    LuaSetfieldNumber(L, "DestinationVnum", xit->Vnum);
    LuaSetfieldNumber(L, "Distance", xit->Distance);
    
    auto flags = xit->Flags;
    flags.reset(Flag::Exit::Bashed);
    LuaPushFlags(L, flags, ExitFlags, "Flags");

    lua_settable(L, -3);
}

void LuaAreaRepository::PushOvalues(lua_State *L, const std::shared_ptr<ProtoObject> obj)
{
    auto ovalues = obj->Value;

    switch (obj->ItemType)
    {
    case ITEM_PILL:
    case ITEM_POTION:
    case ITEM_SCROLL:
        if (IS_VALID_SN(ovalues[1]))
            ovalues[1] = SkillTable[ovalues[1]]->Slot;

        if (IS_VALID_SN(ovalues[2]))
            ovalues[2] = SkillTable[ovalues[2]]->Slot;

        if (IS_VALID_SN(ovalues[3]))
            ovalues[3] = SkillTable[ovalues[3]]->Slot;
        break;
        
    case ITEM_DEVICE:
        if (IS_VALID_SN(ovalues[3]))
            ovalues[3] = SkillTable[ovalues[3]]->Slot;
        break;
        
    case ITEM_SALVE:
        if (IS_VALID_SN(ovalues[4]))
            ovalues[4] = SkillTable[ovalues[4]]->Slot;

        if (IS_VALID_SN(ovalues[5]))
            ovalues[5] = SkillTable[ovalues[5]]->Slot;
        break;
        
    default:
        break;
    }

    LuaPushOvalues(L, ovalues);
}

void LuaAreaRepository::PushRoom(lua_State *L, const std::shared_ptr<Room> room, bool install)
{
    if(install)
    {
        room->Flags.reset(Flag::Room::Prototype);

        std::list<Character*> charactersToExtract = Filter(room->Characters(),
                                                           [](auto victim)
                                                           {
                                                               return IsNpc(victim);
                                                           });

        for (Character *victim : charactersToExtract)
        {
            ExtractCharacter(victim, true);
        }

        /* purge room of (prototyped) objects */
        std::list<Object*> objectsToExtract(room->Objects());

        for (Object *obj : objectsToExtract)
        {
            ExtractObject(obj);
        }
    }

    lua_pushinteger(L, room->Vnum);
    lua_newtable(L);

    LuaSetfieldNumber(L, "Vnum", room->Vnum);
    LuaSetfieldString(L, "Name", room->Name);
    LuaSetfieldString(L, "Description", StripCarriageReturn(room->Description));
    LuaPushFlags(L, room->Flags, RoomFlags, "Flags");
    LuaSetfieldString(L, "Sector", SectorNames[room->Sector][1]);
    LuaSetfieldNumber(L, "TeleDelay", room->TeleDelay);
    LuaSetfieldNumber(L, "TeleVnum", room->TeleVnum);
    LuaSetfieldNumber(L, "Tunnel", room->Tunnel);
    PushExits(L, room);
    LuaPushExtraDescriptions(L, room->ExtraDescriptions());
    LuaPushMudProgs(L, &room->mprog);
    
    lua_settable(L, -3);
}

void LuaAreaRepository::PushRooms(lua_State *L, const std::shared_ptr<Area> &area, bool install)
{
    lua_pushstring(L, "Rooms");
    lua_newtable(L);
    vnum_t vnum = INVALID_VNUM;

    for (vnum = area->VnumRanges.Room.First; vnum <= area->VnumRanges.Room.Last; vnum++)
    {
        if(vnum != INVALID_VNUM)
        {
            auto room = GetRoom(vnum);


            if (room != nullptr)
            {
                PushRoom(L, room, install);
            }
        }
    }

    lua_settable(L, -3);

    if (install && vnum < area->VnumRanges.Room.Last)
    {
        area->VnumRanges.Room.Last = vnum - 1;
    }
}

void LuaAreaRepository::PushObject(lua_State *L, const std::shared_ptr<ProtoObject> obj, bool install)
{
    if (install)
    {
        RemoveBit(obj->Flags, ITEM_PROTOTYPE);
    }

    lua_pushinteger(L, obj->Vnum);
    lua_newtable(L);

    LuaSetfieldNumber(L, "Vnum", obj->Vnum);
    LuaSetfieldString(L, "Name", obj->Name);
    LuaSetfieldString(L, "ShortDescr", obj->ShortDescr);
    LuaSetfieldString(L, "Description", obj->Description);
    LuaSetfieldString(L, "ActionDescription", obj->ActionDescription);
    LuaSetfieldString(L, "ItemType", ObjectTypes[obj->ItemType]);
    LuaSetfieldNumber(L, "Layers", obj->Layers);
    LuaPushFlags(L, obj->Flags, ObjectFlags, "Flags");
    LuaPushFlags(L, obj->WearFlags, WearFlags, "WearFlags");
    PushOvalues(L, obj);
    LuaSetfieldNumber(L, "Weight", obj->Weight);
    LuaSetfieldNumber(L, "Cost", obj->Cost);
    LuaPushExtraDescriptions(L, obj->ExtraDescriptions());
    LuaPushProtoObjectAffects(L, obj->Affects());
    LuaPushMudProgs(L, &obj->mprog);
    
    lua_settable(L, -3);
}

void LuaAreaRepository::PushObjects(lua_State *L, const std::shared_ptr<Area> &area, bool install)
{
    lua_pushstring(L, "Objects");
    lua_newtable(L);
    vnum_t vnum = INVALID_VNUM;
    
    for (vnum = area->VnumRanges.Object.First; vnum <= area->VnumRanges.Object.Last; vnum++)
    {
        if(vnum != INVALID_VNUM)
        {
            auto obj = GetProtoObject(vnum);


            if (obj != nullptr)
            {
                PushObject(L, obj, install);
            }
        }
    }

    lua_settable(L, -3);

    if (install && vnum < area->VnumRanges.Object.Last)
    {
        area->VnumRanges.Object.Last = vnum - 1;
    }
}

void LuaAreaRepository::PushMobiles(lua_State *L, const std::shared_ptr<Area> &area, bool install)
{
    lua_pushstring(L, "Mobiles");
    lua_newtable(L);
    vnum_t vnum = INVALID_VNUM;
    
    for (vnum = area->VnumRanges.Mob.First; vnum <= area->VnumRanges.Mob.Last; vnum++)
    {
        if(vnum != INVALID_VNUM)
        {
            auto mob = GetProtoMobile(vnum);


            if (mob != nullptr)
            {
                PushMobile(L, mob, install);
            }
        }
    }

    lua_settable(L, -3);

    if (install && vnum < area->VnumRanges.Mob.Last)
    {
        area->VnumRanges.Mob.Last = vnum - 1;
    }
}

void LuaAreaRepository::PushMobile(lua_State *L, const std::shared_ptr<ProtoMobile> mob, bool install)
{
    if (install)
    {
        RemoveBit(mob->Flags, ACT_PROTOTYPE);
    }

    lua_pushinteger(L, mob->Vnum);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", mob->Name);
    LuaSetfieldNumber(L, "Vnum", mob->Vnum);
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
    
    lua_settable(L, -3);
}

////////////////////////////////
std::shared_ptr<AreaRepository> NewAreaRepository()
{
    return std::make_shared<LuaAreaRepository>();
}

std::string GetAreaFilename(std::shared_ptr<Area> area)
{
    std::string filename = area->Filename;

    if (StringEndsWith(filename, ".are"))
    {
        // Chop off legacy file extension.
        filename = filename.substr(0, filename.size() - 4);
    }

    return FormatString("%s%s", AREA_DIR, ConvertToLuaFilename(filename).c_str());
}
