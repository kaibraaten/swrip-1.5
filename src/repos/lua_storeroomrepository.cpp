#include "mud.hpp"
#include "lua_storeroomrepository.hpp"
#include "room.hpp"
#include "luascript.hpp"

#define STOREROOM_DIR   DATA_DIR "storeroom/"

static int L_StoreroomEntry(lua_State *L);
static void ExecuteStoreroomFile(const std::string &filename);
static std::string ToString(long number);
static void PushStoreroom(lua_State *L, const std::shared_ptr<Room> &storeroom);

class LuaStoreroomRepository : public StoreroomRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(const std::shared_ptr<Room> &storeroom) const override;
};

void LuaStoreroomRepository::Load()
{
    ForEachLuaFileInDir(STOREROOM_DIR, ExecuteStoreroomFile);
}

void LuaStoreroomRepository::Save() const
{
    // No-op
}

void LuaStoreroomRepository::Save(const std::shared_ptr<Room> &storeroom) const
{
    std::string filename = FormatString("%s%s",
                                        STOREROOM_DIR,
                                        ConvertToLuaFilename(ToString(storeroom->Vnum)).c_str());
    LuaSaveDataFile(filename, PushStoreroom, "storeroom", storeroom);
}

//////////////////////////////////////////////////////////////

static int L_StoreroomEntry(lua_State *L)
{
    std::shared_ptr<Room> storeroom;
    LuaGetfieldString(L, "Vnum",
                      [&storeroom](const auto &vnumOrTag)
                      {
                          storeroom = GetRoom(vnumOrTag);
                      });
    
    if(storeroom != nullptr)
    {
        auto objects = LuaLoadObjects(L, "Contents");

        for(auto obj : objects)
        {
            ObjectToRoom(obj, storeroom);
        }
    }

    return 0;
}

static void ExecuteStoreroomFile(const std::string &filename)
{
    LuaLoadDataFile(filename, L_StoreroomEntry, "StoreroomEntry");
}

static std::string ToString(long number)
{
    return FormatString("%ld", number);
}

static void PushStoreroom(lua_State *L, const std::shared_ptr<Room> &storeroom)
{
    lua_pushinteger(L, 1);
    lua_newtable(L);

    LuaSetfieldString(L, "Vnum", VnumOrTag(storeroom));
    LuaPushObjects(L, storeroom->Objects(), "Contents");

    lua_setglobal(L, "storeroom");
}

std::shared_ptr<StoreroomRepository> NewLuaStoreroomRepository()
{
    return std::make_shared<LuaStoreroomRepository>();
}
