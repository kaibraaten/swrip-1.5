#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/datadom.hpp>
#include <lua.hpp>

struct FakeStringField : public DataDOM::Field
{
  FakeStringField(const std::string &name, std::string &targetField)
    : Field(name),
      TargetField(targetField)
  {

  }

  void Push(lua_State *L) const override
  {

  }

  void Get(lua_State *L, int idx) override
  {
    TargetField = "FOO123";
  }

  std::string &TargetField;
};

class Foo
{
public:
  std::string SomeStringField;
};

class DataDOMTests : public ::testing::Test
{
protected:

};

TEST_F(DataDOMTests, CreatingFieldObjectCompiles)
{
  Foo myFoo;
  std::shared_ptr<DataDOM::Field> field = std::make_shared<DataDOM::StringField>("SomeStringField", myFoo.SomeStringField);

  EXPECT_NE(nullptr, field);
}

TEST_F(DataDOMTests, TargetFieldCanBeModified)
{
  // Arrange
  Foo myFoo;
  std::shared_ptr<DataDOM::Field> field = std::make_shared<FakeStringField>("SomeStringField", myFoo.SomeStringField);

  // Act
  field->Get(nullptr, 0);

  // Assert
  EXPECT_EQ("FOO123", myFoo.SomeStringField);
}
