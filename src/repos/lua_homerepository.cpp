#include <filesystem>
#include <utility/algorithms.hpp>
#include "lua_homerepository.hpp"
#include "luascript.hpp"
#include "room.hpp"
#include "mud.hpp"
#include "home.hpp"
#include "log.hpp"

#define HOME_DIR DATA_DIR "homes/"

namespace fs = std::filesystem;

static std::string GetHomeFilename(vnum_t roomVnum);
static void PushHome(lua_State *L, const std::shared_ptr<Home> &home);
static int L_HomeEntryFull(lua_State *L);
static int L_HomeEntryMeta(lua_State *L);

class LuaHomeRepository : public HomeRepository
{
public:
    void Load() override;
    void Save() const override;
    void Load(std::shared_ptr<Home> home) override;
    void Save(std::shared_ptr<Home> home) const override;

    void Delete(std::shared_ptr<Home> home) override;
    
    std::shared_ptr<Home> FindByVnum(vnum_t) const override;
    std::list<std::shared_ptr<Home>> FindHomesForResident(const std::string &name) const override;
    bool IsResidentOf(const std::string &name, vnum_t room) const override;
};

bool LuaHomeRepository::IsResidentOf(const std::string &name, vnum_t room) const
{
    for(auto home : FindHomesForResident(name))
    {
        if(home->Vnum() == room)
        {
            for(auto resident : home->Residents())
            {
                if(StrCmp(resident->Name, name) == 0)
                {
                    return true;
                }
            }
        }
    }
    
    return false;
}

void LuaHomeRepository::Delete(std::shared_ptr<Home> home)
{
    Remove(home);
    std::error_code ec;
    auto filename = GetHomeFilename(home->Vnum());
    fs::remove(filename, ec);
}

std::shared_ptr<Home> LuaHomeRepository::FindByVnum(vnum_t vnum) const
{
    return Find([vnum](const auto &home)
                {
                    return home->Vnum() == vnum;
                });
}

std::list<std::shared_ptr<Home>> LuaHomeRepository::FindHomesForResident(const std::string &name) const
{
    std::list<std::shared_ptr<Home>> homes;

    for(auto home : Entities())
    {
        if(home->IsResident(name))
        {
            homes.push_back(home);
        }
    }

    return homes;
}

static void ExecuteHomeFile(const std::string &filename)
{
    LuaLoadDataFile(filename, L_HomeEntryMeta, "HomeEntry");
}

void LuaHomeRepository::Load()
{
    ForEachLuaFileInDir(HOME_DIR, ExecuteHomeFile);
}

void LuaHomeRepository::Save() const
{

}

void LuaHomeRepository::Load(std::shared_ptr<Home> home)
{
    auto filename = GetHomeFilename(home->Vnum());
    LuaLoadDataFile(filename, L_HomeEntryFull, "HomeEntry");
}

void LuaHomeRepository::Save(std::shared_ptr<Home> home) const
{
    auto filename = GetHomeFilename(home->Vnum());
    LuaSaveDataFile(filename, PushHome, "home", home);
}

static std::string GetHomeFilename(vnum_t roomVnum)
{
    return FormatString("%s%s",
                        HOME_DIR,
                        ConvertToLuaFilename(std::to_string(roomVnum)).c_str());
}

static void PushResident(lua_State *L, size_t idx, std::shared_ptr<Resident> resident)
{
    lua_pushinteger(L, idx);
    lua_newtable(L);
    LuaSetfieldString(L, "Name", resident->Name);
    LuaPushFlags(L, resident->Flags, ResidentFlags, "Flags");
    lua_settable(L, -3);
}

static void PushHome(lua_State *L, const std::shared_ptr<Home> &home)
{
    lua_pushinteger(L, 1);
    lua_newtable(L);

    auto room = GetRoom(home->Vnum());
    LuaSetfieldString(L, "Vnum", VnumOrTag(room));
    LuaSetfieldString(L, "RoomName", home->RoomName());
    LuaSetfieldString(L, "Description", home->Description());
    
    LuaPushObjects(L, room->Objects());
    LuaPushCollection(L, home->Residents(), "Residents", PushResident);
    LuaPushFlags(L, home->Flags, HomeFlags, "Flags");
    LuaPushFlags(L, home->ExtraRoomFlags, RoomFlags, "ExtraRoomFlags");
    lua_setglobal(L, "home");
}

static void LoadResident(lua_State *L, size_t idx, std::shared_ptr<Home> home)
{
    auto resident = std::make_shared<Resident>();
    LuaGetfieldString(L, "Name", &resident->Name);
    resident->Flags = LuaLoadFlags(L, "Flags");
    home->Add(resident);
}

static int L_HomeEntryFull(lua_State *L)
{
    vnum_t vnum = INVALID_VNUM;
    LuaGetfieldLong(L, "Vnum", &vnum);
    auto room = GetRoom(vnum);

    if(room != nullptr)
    {
        auto home = Homes->FindByVnum(vnum);

        if(home != nullptr)
        {
            auto objectsToExtract = room->Objects();

            for (auto obj : objectsToExtract)
            {
                ExtractObject(obj);
            }

            auto objects = LuaLoadObjects(L, "Objects");

            for(auto obj : objects)
            {
                ObjectToRoom(obj, room);
            }

            LuaGetfieldString(L, "Description",
                              [home](const auto &desc)
                              {
                                  home->Description(desc);
                              });
            home->Flags = LuaLoadFlags(L, "Flags");
            home->ExtraRoomFlags = LuaLoadFlags(L, "ExtraRoomFlags");
            home->ExtraRoomFlags.set(Flag::Room::Hotel);
        }
    }

    return 0;
}

static int L_HomeEntryMeta(lua_State *L)
{
    std::shared_ptr<Room> room;
    LuaGetfieldString(L, "Vnum",
                      [&room](const auto &vnumOrTag)
                      {
                          room = GetRoom(vnumOrTag);
                      });

    if(room != nullptr)
    {
        auto home = std::make_shared<Home>(room->Vnum);
        LuaGetfieldString(L, "RoomName",
                          [home](const auto &name)
                          {
                              home->RoomName(name);
                          });
        Homes->Add(home);
        LuaLoadArray(L, "Residents", LoadResident, home);
    }
    else
    {
        Log->Bug("%s: room == nullptr", __FUNCTION__);
    }
    
    return 0;
}

///////////////////////////////////////////////////////
std::shared_ptr<HomeRepository> NewLuaHomeRepository()
{
    return std::make_shared<LuaHomeRepository>();
}
