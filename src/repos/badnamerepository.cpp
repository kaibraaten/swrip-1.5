#include "badnamerepository.hpp"
#include "badname.hpp"
#include "luascript.hpp"

std::shared_ptr<BadNameRepository> BadNames;

#define BADNAME_FILE DATA_DIR "badnames.lua"

class LuaBadNameRepository : public BadNameRepository
{
public:
    void Load() override;
    void Save() const override;

private:
    static void PushBadName(lua_State *L, const std::string &badName);
    static void PushBadNames(lua_State *L);
    static int L_BadNameEntry(lua_State *L);
};

void LuaBadNameRepository::Load()
{
    LuaLoadDataFile(BADNAME_FILE, L_BadNameEntry, "BadNameEntry");
}

void LuaBadNameRepository::Save() const
{
    LuaSaveDataFile(BADNAME_FILE, PushBadNames, "badnames");
}

std::shared_ptr<BadNameRepository> NewBadNameRepository()
{
    return std::make_shared<LuaBadNameRepository>();
}

void LuaBadNameRepository::PushBadName(lua_State *L, const std::string &badName)
{
    static int idx = 0;
    lua_pushinteger(L, ++idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", badName);

    lua_settable(L, -3);
}

void LuaBadNameRepository::PushBadNames(lua_State *L)
{
    lua_newtable(L);

    for(const auto &badName : BadNames)
    {
        PushBadName(L, badName);
    }

    lua_setglobal(L, "badnames");
}

int LuaBadNameRepository::L_BadNameEntry(lua_State *L)
{
    LuaGetfieldString(L, "Name",
                      [](const std::string &name)
                      {
                          AddBadName(name);
                      });
    return 0;
}
