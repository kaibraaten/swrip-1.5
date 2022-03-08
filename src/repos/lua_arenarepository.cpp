#include "arena.hpp"
#include "luascript.hpp"

#define HALL_OF_FAME_FILE DATA_DIR "halloffame.lua"

static int L_HallOfFameEntry(lua_State *L)
{
    HallOfFameElement fameNode;

    LuaGetfieldString(L, "Name", &fameNode.Name);
    LuaGetfieldLong(L, "Date",
                    [&fameNode](time_t fameDate)
                    {
                        fameNode.Date = fameDate;
                    });
    LuaGetfieldInt(L, "Award", &fameNode.Award);

    FameList.push_front(fameNode);

    return 0;
}

void LoadHallOfFame()
{
    LuaLoadDataFile(HALL_OF_FAME_FILE, L_HallOfFameEntry, "HallOfFameEntry");
}

static void PushFameElement(lua_State *L, const HallOfFameElement &fame)
{
    static int idx = 0;
    lua_pushinteger(L, ++idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", fame.Name);
    LuaSetfieldNumber(L, "Award", fame.Award);
    LuaSetfieldNumber(L, "Date", fame.Date);

    lua_settable(L, -3);
}

static void PushHallOfFame(lua_State *L)
{
    lua_newtable(L);

    for(const auto &fameElement : FameList)
    {
        PushFameElement(L, fameElement);
    }

    lua_setglobal(L, "halloffame");
}

void SaveHallOfFame()
{
    LuaSaveDataFile(HALL_OF_FAME_FILE, PushHallOfFame, "halloffame");
}
