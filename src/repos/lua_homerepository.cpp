#include <filesystem>
#include "lua_homerepository.hpp"
#include "script.hpp"
#include "room.hpp"
#include "mud.hpp"

#define HOME_DIR DATA_DIR "homes/"

namespace fs = std::filesystem;

static std::string GetHomeFilename(vnum_t roomVnum);
static void PushHome(lua_State *L, const void *userData);
static int L_HomeEntry(lua_State *L);

class LuaHomeRepository : public HomeRepository
{
public:
    void Load() override;
    void Save() const override;
    void Load(std::shared_ptr<Room> room) override;
    void Save(std::shared_ptr<Room> room) const override;
};

void LuaHomeRepository::Load()
{

}

void LuaHomeRepository::Save() const
{

}

void LuaHomeRepository::Load(std::shared_ptr<Room> room)
{
    auto filename = GetHomeFilename(room->Vnum);
    LuaLoadDataFile(filename, L_HomeEntry, "HomeEntry");
}

void LuaHomeRepository::Save(std::shared_ptr<Room> room) const
{
    auto filename = GetHomeFilename(room->Vnum);
    LuaSaveDataFile(filename, PushHome, "home", room.get());
}

static std::string ToString(long number)
{
    return FormatString("%ld", number);
}

static std::string GetHomeFilename(vnum_t roomVnum)
{
    return FormatString("%s%s",
                        HOME_DIR,
                        ConvertToLuaFilename(ToString(roomVnum)).c_str());
}

static void PushHome(lua_State *L, const void *userData)
{
    const auto room = (const Room*)userData;
    lua_pushinteger(L, 1);
    lua_newtable(L);

    LuaSetfieldNumber(L, "Vnum", room->Vnum);
    LuaPushObjects(L, room->Objects());

    lua_setglobal(L, "home");
}

static int L_HomeEntry(lua_State *L)
{
    vnum_t vnum = INVALID_VNUM;
    LuaGetfieldLong(L, "Vnum", &vnum);
    auto room = GetRoom(vnum);

    if(room != nullptr)
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
    }

    return 0;
}

///////////////////////////////////////////////////////
std::shared_ptr<HomeRepository> NewLuaHomeRepository()
{
    return std::make_shared<LuaHomeRepository>();
}
