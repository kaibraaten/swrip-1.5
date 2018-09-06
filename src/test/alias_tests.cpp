#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "alias.hpp"

class AliasTests : public ::testing::Test
{
protected:
  void SetUp() override
  {
    _testCharacter = new Character(new PCData(), new NullDescriptor());
    ProtoMobile *protoMob = MakeMobile(1, INVALID_VNUM, "Foo");
    _testNpc = new Character(protoMob);
  }

  void TearDown() override
  {
    delete _testCharacter->Desc;
    delete _testCharacter;
    _testCharacter = nullptr;

    delete _testNpc->Prototype;
    delete _testNpc;
    _testNpc = nullptr;
  }

  Character *_testCharacter = nullptr;
  Character *_testNpc = nullptr;
  const std::string _expectedAliasName = "alias";
  const std::string _expectedCommand = "command";
};

TEST_F(AliasTests, AllocateAlias)
{
  Alias *target = AllocateAlias(_expectedAliasName, _expectedCommand);

  ASSERT_NE(target, nullptr);
  EXPECT_EQ(_expectedAliasName, target->Name);
  EXPECT_EQ(_expectedCommand, target->Command);

  FreeAlias(target);
}

TEST_F(AliasTests, AddAlias)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases().size() + 1;
  
  AddAlias(_testCharacter, alias);
  
  EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases().size());
}

TEST_F(AliasTests, AddAliasAllowsNoDuplicates)
{
  Alias *alias1 = AllocateAlias(_expectedAliasName, _expectedCommand);
  Alias *alias2 = AllocateAlias(_expectedAliasName, _expectedCommand);
  size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases().size() + 1;

  AddAlias(_testCharacter, alias1);
  AddAlias(_testCharacter, alias2);
  
  EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases().size());
}

TEST_F(AliasTests, AddAliasIgnoresNpcs)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);

  AddAlias(_testNpc, alias);

  // No asserts because we'd get a segfault if test failed.

  FreeAlias(alias);
}

TEST_F(AliasTests, UnlinkAliasRemovesAlias)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  AddAlias(_testCharacter, alias);
  size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases().size() - 1;

  UnlinkAlias(_testCharacter, alias);

  EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases().size());

  FreeAlias(alias);
}

TEST_F(AliasTests, UnlinkAliasIgnoresNpcs)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);

  UnlinkAlias(_testNpc, alias);

  // No asserts because we'd get a segfault if test failed.

  FreeAlias(alias);
}

TEST_F(AliasTests, FreeAliasesIgnoresNpcs)
{
  FreeAliases(_testNpc);

  // No asserts because we'd get a segfault if test failed.
}

TEST_F(AliasTests, FreeAliasesClearsList)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  AddAlias(_testCharacter, alias);

  FreeAliases(_testCharacter);

  EXPECT_TRUE(_testCharacter->PCData->Aliases().empty());
}

TEST_F(AliasTests, FindAliasFindsTheAlias)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  AddAlias(_testCharacter, alias);

  bool found = FindAlias(_testCharacter, _expectedAliasName);

  EXPECT_TRUE(found);
}

TEST_F(AliasTests, FindAliasDoesNotFindNonexistentAlias)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  AddAlias(_testCharacter, alias);

  bool found = FindAlias(_testCharacter, "does_not_exist");

  EXPECT_FALSE(found);
}

TEST_F(AliasTests, FindAliasIgnoresNpcs)
{
  FindAlias(_testNpc, "argument_does_not_matter");
}
