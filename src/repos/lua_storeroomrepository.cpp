#include "mud.hpp"
#include "lua_storeroomrepository.hpp"
#include "room.hpp"
#include "script.hpp"

#define STOREROOM_DIR   DATA_DIR "storeroom/"

static int L_StoreroomEntry(lua_State *L);
static void ExecuteStoreroomFile(const std::string &filename, void *userData);
static std::string ToString(long number);
static void PushStoreroom(lua_State *L, const void *userData);

class LuaStoreroomRepository : public StoreroomRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(std::shared_ptr<Room> storeroom) override;
};

void LuaStoreroomRepository::Load()
{
    ForEachLuaFileInDir(STOREROOM_DIR, ExecuteStoreroomFile, nullptr);
}

void LuaStoreroomRepository::Save() const
{
    // No-op
}

void LuaStoreroomRepository::Save(std::shared_ptr<Room> storeroom)
{
    std::string filename = FormatString("%s%s",
                                        STOREROOM_DIR,
                                        ConvertToLuaFilename(ToString(storeroom->Vnum)).c_str());
    LuaSaveDataFile(filename, PushStoreroom, "storeroom", storeroom.get());
}

//////////////////////////////////////////////////////////////

static int L_StoreroomEntry(lua_State *L)
{
    vnum_t vnum = INVALID_VNUM;
    LuaGetfieldLong(L, "Vnum", &vnum);

    auto storeroom = GetRoom(vnum);

    if(storeroom != nullptr)
    {
        auto objects = LuaLoadObjects(L, "Contents");

        for (auto obj : objects)
        {
            ObjectToRoom(obj, storeroom);
        }
    }

    return 0;
}

static void ExecuteStoreroomFile(const std::string &filename, void *userData)
{
    LuaLoadDataFile(filename, L_StoreroomEntry, "StoreroomEntry");
}

static std::string ToString(long number)
{
    return FormatString("%ld", number);
}

static void PushStoreroom(lua_State *L, const void *userData)
{
    lua_pushinteger(L, 1);
    lua_newtable(L);

    const auto storeroom = (const Room*)userData;
    LuaSetfieldNumber(L, "Vnum", storeroom->Vnum);
    LuaPushObjects(L, storeroom->Objects(), "Contents");

    lua_setglobal(L, "storeroom");
}

std::shared_ptr<StoreroomRepository> NewLuaStoreroomRepository()
{
    return std::make_shared<LuaStoreroomRepository>();
}
