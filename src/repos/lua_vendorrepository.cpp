#include <system_error>
#include <filesystem>
#include <cassert>
#include "mud.hpp"
#include "character.hpp"
#include "lua_vendorrepository.hpp"
#include "script.hpp"
#include "object.hpp"
#include "protomob.hpp"
#include "room.hpp"
#include "log.hpp"

#define VENDOR_DIR      DATA_DIR "vendor/"

namespace fs = std::filesystem;

static std::string GetVendorFilename(const std::string &pc);
static void PushVendor(lua_State *L, const void *userData);
static void ExecuteVendorFile(const std::string &filename, void *userData);
static int L_VendorEntry(lua_State *L);

class LuaVendorRepository : public VendorRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(const Character *vendor) const override;
    bool HasVendor(const Character *pc) const override;
    void RemoveVendor(Character *pc) const override;
};


void LuaVendorRepository::Load()
{
    extern int falling;
    falling = 1;

    ForEachLuaFileInDir(VENDOR_DIR, ExecuteVendorFile, nullptr);

    falling = 0;
}

void LuaVendorRepository::Save() const
{

}

void LuaVendorRepository::Save(const Character *vendor) const
{
    assert(vendor != nullptr);
    assert(IsNpc(vendor));

    DeEquipCharacter(const_cast<Character*>(vendor));

    LuaSaveDataFile(GetVendorFilename(vendor->Owner),
                    PushVendor,
                    "vendor", vendor);

    ReEquipCharacter(const_cast<Character*>(vendor));
}

bool LuaVendorRepository::HasVendor(const Character *pc) const
{
    auto filename = GetVendorFilename(pc->Name);
    std::error_code ec;
    return fs::exists(filename, ec);
}

void LuaVendorRepository::RemoveVendor(Character *pc) const
{
    auto filename = GetVendorFilename(pc->Name);
    std::error_code ec;
    fs::remove(filename, ec);
}

static void ExecuteVendorFile(const std::string &filename, void *userData)
{
    LuaLoadDataFile(filename, L_VendorEntry, "VendorEntry");
}

static int L_VendorEntry(lua_State *L)
{
    vnum_t vendorVnum = INVALID_VNUM;
    LuaGetfieldLong(L, "Vnum", &vendorVnum);
    auto mob = CreateMobile(GetProtoMobile(vendorVnum));

    if(mob != nullptr)
    {
        vnum_t inroom = INVALID_VNUM;

        LuaGetfieldInt(L, "Credits", &mob->Gold);
        LuaGetfieldLong(L, "Home", &inroom);
        LuaGetfieldString(L, "Owner", &mob->Owner);
        LuaGetfieldString(L, "ShortDescription", &mob->ShortDescr);
        LuaGetfieldString(L, "Position",
                          [mob](const std::string &posName)
                          {
                              mob->Position = GetPosition(posName);
                          });
        mob->Flags = LuaLoadFlags(L, "Flags").to_ulong();

        auto objects = LuaLoadObjects(L, "Objects");

        for (auto obj : objects)
        {
            int tmpWearLoc = obj->WearLoc;
            obj->WearLoc = WEAR_NONE;

            ObjectToCharacter(obj, mob);

            obj->WearLoc = tmpWearLoc;

            if (obj->WearLoc != WEAR_NONE)
            {
                EquipCharacter(mob, obj, obj->WearLoc);
            }
        }

        char buf[MAX_INPUT_LENGTH];
        char vnum1[MAX_INPUT_LENGTH];

        if (inroom == INVALID_VNUM)
        {
            inroom = ROOM_VNUM_VENSTOR;
        }

        mob->Home = GetRoom(inroom);

        if (mob->Home == nullptr)
        {
            mob->Home = GetRoom(ROOM_VNUM_VENSTOR);
        }

        mob->InRoom = mob->Home;

        /* the following code is to make sure no more than one player owned vendor
           is in the room - meckteck */
        std::list<Character*> charactersInRoom(mob->InRoom->Characters());

        for (auto victim : charactersInRoom)
        {
            if (victim->Home != nullptr)
            {
                ExtractCharacter(victim, true);
                break;
            }
        }

        CharacterToRoom(mob, mob->Home);
        sprintf(vnum1, "%ld", mob->Prototype->Vnum);
        do_makeshop(mob, vnum1);
        sprintf(buf, mob->LongDescr.c_str(), mob->Owner.c_str());
        mob->LongDescr = buf;
        mob->HitPoints.Current = 10000;
        mob->HitPoints.Max = 10000;
    }
    else
    {
        Log->Bug("%s: No index data for vnum %ld", __FUNCTION__, vendorVnum);
    }

    return 0;
}

static void PushVendor(lua_State *L, const void *userData)
{
    auto vendor = static_cast<const Character*>(userData);

    lua_pushinteger(L, 1);
    lua_newtable(L);

    LuaPushObjects(L, vendor->Objects(), "Objects");
    LuaSetfieldNumber(L, "Vnum", vendor->Prototype->Vnum);
    LuaSetfieldNumber(L, "Credits", vendor->Gold);

    if(vendor->Home != nullptr)
    {
        LuaSetfieldNumber(L, "Home", vendor->Home->Vnum);
    }

    if(!vendor->Owner.empty())
    {
        LuaSetfieldString(L, "Owner", vendor->Owner);
    }

    if(StrCmp(vendor->ShortDescr, vendor->Prototype->ShortDescr) != 0)
    {
        LuaSetfieldString(L, "ShortDescription", vendor->ShortDescr);
    }

    LuaSetfieldString(L, "Position", PositionName[vendor->Position]);
    LuaPushFlags(L, vendor->Flags, MobFlags, "Flags");

    lua_setglobal(L, "vendor");
}

static std::string GetVendorFilename(const std::string &pc)
{
    return FormatString("%s/%s.lua", VENDOR_DIR,
                        ToLower(pc).c_str());
}

///////////////////////////////////////////////////////////

std::shared_ptr<VendorRepository> NewLuaVendorRepository()
{
    return std::make_shared<LuaVendorRepository>();
}
