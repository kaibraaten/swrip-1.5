#include <iostream>
#include <string>
#include <map>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "luascript.hpp"

static std::string ErrorText;
static std::map<int, std::string> ArrayData;

constexpr char *SCRIPT =
    "AreaEntry\n"
    "{\n"
    "   SpecFuns =\n"
    "   {\n"
    "      [1] = \"spec_police_attack\",\n"
    "      [2] = \"spec_guardian\",\n"
    "   }\n"
    "}\n"
;

static lua_State *TestCreateLuaState()
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    return L;
}

static bool RunScript(const std::string &script, int(*callback)(lua_State*),
                      const std::string &callbackFunctionName)
{
    lua_State *L = TestCreateLuaState();

    lua_pushcfunction(L, callback);
    lua_setglobal(L, callbackFunctionName.c_str());

    int error = luaL_dostring(L, script.c_str());

    if(error)
    {
        ErrorText = lua_tostring(L, 1);
        return false;
    }

    lua_close(L);
    return true;
}

class LuaTests : public ::testing::Test
{
protected:
    void SetUp() override
    {
        ArrayData.clear();
    }

    void TearDown() override
    {

    }
};

static int L_NoOpFunction(lua_State *L)
{
    return 0;
}

static void GetIndices(lua_State *L, int subscript, int dummy)
{
    ArrayData[subscript] = "Test";
}

static void GetValues(lua_State *L, int subscript, int dummy)
{
    ArrayData[subscript] = lua_tostring(L, -1);
}

static int L_GetArrayIndices(lua_State *L)
{
    LuaLoadArray(L, "SpecFuns", GetIndices, 0);
    return 0;
}

static int L_GetArrayValues(lua_State *L)
{
    LuaLoadArray(L, "SpecFuns", GetValues, 0);
    return 0;
}

TEST_F(LuaTests, ScriptRuns)
{
    bool success = RunScript(SCRIPT, L_NoOpFunction, "AreaEntry");

    if(!success)
    {
        EXPECT_TRUE(success) << SCRIPT << "\n" << ErrorText;

    }
    else
    {
        EXPECT_TRUE(success);
    }
}

TEST_F(LuaTests, GetArrayIndices)
{
    bool success = RunScript(SCRIPT, L_GetArrayIndices, "AreaEntry");

    if(!success)
    {
        EXPECT_TRUE(success) << SCRIPT << "\n" << ErrorText;

    }
    else
    {
        EXPECT_TRUE(success);
    }

    EXPECT_TRUE(ArrayData.find(1) != ArrayData.end()) << "Index 1 not found.";
    EXPECT_TRUE(ArrayData.find(2) != ArrayData.end()) << "Index 2 not found.";
}

TEST_F(LuaTests, GetArrayValues)
{
    bool success = RunScript(SCRIPT, L_GetArrayValues, "AreaEntry");

    if(!success)
    {
        EXPECT_TRUE(success) << SCRIPT << "\n" << ErrorText;

    }
    else
    {
        EXPECT_TRUE(success);
    }

    EXPECT_EQ(ArrayData[1], "spec_police_attack");
    EXPECT_EQ(ArrayData[2], "spec_guardian");
}
