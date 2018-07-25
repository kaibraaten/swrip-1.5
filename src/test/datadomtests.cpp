#include <array>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/datadom.hpp>
#include <lua.hpp>
#include "mud.hpp"

struct FakeStringField : public DataDOM::PrimitiveField
{
  FakeStringField(lua_State *L, const std::string &name, std::string &targetField)
    : PrimitiveField(L, name),
      TargetField(targetField)
  {

  }

  void Push() const override
  {

  }

  void Get() override
  {
    TargetField = "FOO123";
  }

  std::string &TargetField;

protected:
  void AssignFromLuaToField(int) override
  {
    // nothing to do
  }
};

class Foo
{
public:
  std::string SomeStringField;
  int SomeIntegerField = 0;
  double SomeDoubleField = 0.0;
  bool SomeBooleanField = false;
  unsigned long Flags = 0;
};

class DataDOMTests : public ::testing::Test
{
protected:
  void SetUp() override
  {
    L =  luaL_newstate();
    luaL_openlibs( L );
    char path[MAX_STRING_LENGTH];
    sprintf( path, "../../%s?.lua;;", SCRIPT_DIR );
    lua_getglobal( L, "package" );
    lua_pushstring( L, path );
    lua_setfield( L, -2, "path" );
    lua_pop( L, 1 );
  }

  void TearDown() override
  {
    /*
    if(L != nullptr)
      {
        lua_close(L);
        L = nullptr;
      }
    */
  }

  //private:
  lua_State *L = nullptr;
  const std::array<const char * const, 32> FlagNameArray = { "Flag0", "Flag1", "Flag2", "Flag3", "Flag4", "Flag5", "Flag6", "Flag7", "Flag8", "Flag9", "Flag10", "Flag11", "Flag12", "Flag13", "Flag14", "Flag15", "Flag16", "Flag17", "Flag18", "Flag19", "Flag20", "Flag21", "Flag22", "Flag23", "Flag24", "Flag25", "Flag26", "Flag27", "Flag28", "Flag29", "Flag30", "Flag31" };
};

TEST_F(DataDOMTests, CreatingFieldObjectCompiles)
{
  Foo myFoo;
  std::shared_ptr<DataDOM::Data> data = std::make_shared<DataDOM::StringField>(L, "SomeStringField", myFoo.SomeStringField);

  EXPECT_NE(nullptr, data);
}

TEST_F(DataDOMTests, TargetFieldCanBeModified)
{
  // Arrange
  Foo myFoo;
  std::shared_ptr<DataDOM::Data> data = std::make_shared<FakeStringField>(L, "SomeStringField", myFoo.SomeStringField);

  // Act
  data->Get();

  // Assert
  EXPECT_EQ("FOO123", myFoo.SomeStringField);
}

TEST_F(DataDOMTests, PushData)
{
  Foo myFoo
  {
    SomeStringField: "My foo",
    SomeIntegerField: 123,
    SomeDoubleField: 3.14,
    SomeBooleanField: true,
      Flags: 1 << 0 | 1 << 13
  };

  //myFoo.Flags = 0;

  //SetBit(myFoo.Flags, BV00);
  //SetBit(myFoo.Flags, BV13);

  DataDOM::LuaDocument doc(L, "foo", "foo.lua");
  doc.Add(new DataDOM::StringField(L, "SomeStringField", myFoo.SomeStringField));
  doc.Add(new DataDOM::IntegerField(L, "SomeIntegerField", myFoo.SomeIntegerField));
  doc.Add(new DataDOM::DoubleField(L, "SomeDoubleField", myFoo.SomeDoubleField));
  doc.Add(new DataDOM::BooleanField(L, "SomeBooleanField", myFoo.SomeBooleanField));
  doc.Add(new DataDOM::Flags(L, "Flags", myFoo.Flags, FlagNameArray));
  doc.Save();
}
