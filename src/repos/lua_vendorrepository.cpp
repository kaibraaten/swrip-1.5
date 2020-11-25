#include <system_error>
#include <filesystem>
#include <cassert>
#include "mud.hpp"
#include "character.hpp"
#include "lua_vendorrepository.hpp"
#include "luascript.hpp"
#include "object.hpp"
#include "protomob.hpp"
#include "room.hpp"
#include "log.hpp"

#define VENDOR_DIR      DATA_DIR "vendor/"

namespace fs = std::filesystem;

static std::string GetVendorFilename(const std::string &pc);
static void PushVendor(lua_State *L, const std::shared_ptr<Character> &vendor);
static void ExecuteVendorFile(const std::string &filename);
static int L_VendorEntry(lua_State *L);

class LuaVendorRepository : public VendorRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(std::shared_ptr<Character> vendor) const override;
    bool HasVendor(std::shared_ptr<Character> pc) const override;
    void RemoveVendor(std::shared_ptr<Character> pc) const override;
};


void LuaVendorRepository::Load()
{
    extern int falling;
    falling = 1;

    ForEachLuaFileInDir(VENDOR_DIR, ExecuteVendorFile);

    falling = 0;
}

void LuaVendorRepository::Save() const
{

}

void LuaVendorRepository::Save(std::shared_ptr<Character> vendor) const
{
    assert(vendor != nullptr);
    assert(IsNpc(vendor));

    DeEquipCharacter(vendor);

    LuaSaveDataFile(GetVendorFilename(vendor->Owner),
                    PushVendor,
                    "vendor", vendor);

    ReEquipCharacter(vendor);
}

bool LuaVendorRepository::HasVendor(std::shared_ptr<Character> pc) const
{
    auto filename = GetVendorFilename(pc->Name);
    std::error_code ec;
    return fs::exists(filename, ec);
}

void LuaVendorRepository::RemoveVendor(std::shared_ptr<Character> pc) const
{
    auto filename = GetVendorFilename(pc->Name);
    std::error_code ec;
    fs::remove(filename, ec);
}

static void ExecuteVendorFile(const std::string &filename)
{
    LuaLoadDataFile(filename, L_VendorEntry, "VendorEntry");
}

static int L_VendorEntry(lua_State *L)
{
    std::string vendorVnum;
    LuaGetfieldString(L, "Vnum", &vendorVnum);
    auto mob = CreateMobile(GetProtoMobile(vendorVnum));

    if(mob != nullptr)
    {
        std::string inroom;

        LuaGetfieldInt(L, "Credits", &mob->Gold);
        LuaGetfieldString(L, "Home", &inroom);
        LuaGetfieldString(L, "Owner", &mob->Owner);
        LuaGetfieldString(L, "ShortDescription", &mob->ShortDescr);
        LuaGetfieldString(L, "Position",
                          [mob](const std::string &posName)
                          {
                              mob->Position = GetPosition(posName);
                          });
        mob->Flags = LuaLoadFlags(L, "Flags").to_ulong();

        auto objects = LuaLoadObjects(L, "Objects");

        for(auto obj : objects)
        {
            int tmpWearLoc = obj->WearLoc;
            obj->WearLoc = WEAR_NONE;

            ObjectToCharacter(obj, mob);

            obj->WearLoc = tmpWearLoc;

            if(obj->WearLoc != WEAR_NONE)
            {
                EquipCharacter(mob, obj, obj->WearLoc);
            }
        }

        char buf[MAX_INPUT_LENGTH];
        char vnum1[MAX_INPUT_LENGTH];

        if(inroom.empty() || inroom == std::to_string(INVALID_VNUM))
        {
            inroom = std::to_string(ROOM_VNUM_VENSTOR);
        }

        mob->Home = GetRoom(inroom);

        if(mob->Home == nullptr)
        {
            mob->Home = GetRoom(ROOM_VNUM_VENSTOR);
        }

        mob->InRoom = mob->Home;

        /* the following code is to make sure no more than one player owned vendor
           is in the room - meckteck */
        std::list<std::shared_ptr<Character> > charactersInRoom(mob->InRoom->Characters());

        for(auto victim : charactersInRoom)
        {
            if(victim->Home != nullptr)
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
        Log->Bug("%s: No index data for vnum %s", __FUNCTION__, vendorVnum.c_str());
    }

    return 0;
}

static void PushVendor(lua_State *L, const std::shared_ptr<Character> &vendor)
{
    lua_pushinteger(L, 1);
    lua_newtable(L);

    LuaPushObjects(L, vendor->Objects(), "Objects");
    LuaSetfieldNumber(L, "Vnum", vendor->Prototype->Vnum);
    LuaSetfieldNumber(L, "Credits", vendor->Gold);

    if(vendor->Home != nullptr)
    {
        LuaSetfieldString(L, "Home", VnumOrTag(vendor->Home));
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
