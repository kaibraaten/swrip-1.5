#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

class AliasDataTests : public ::testing::Test
{
protected:
  void SetUp() override
  {
    _testCharacter = new Character();
    _testCharacter->PCData = new PCData();
  }

  void TearDown() override
  {
    delete _testCharacter;
    _testCharacter = nullptr;
  }

  Character *_testCharacter = nullptr;
  static constexpr char *_expectedAliasName = "alias";
  static constexpr char *_expectedCommand = "command";
};

TEST_F(AliasDataTests, TestAllocateAlias)
{
  Alias *target = AllocateAlias(_expectedAliasName, _expectedCommand);

  ASSERT_NE(target, nullptr);
  EXPECT_STREQ(_expectedAliasName, target->Name);
  EXPECT_STREQ(_expectedCommand, target->Command);
}

TEST_F(AliasDataTests, TestAddAlias)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases.size() + 1;
  
  AddAlias(_testCharacter, alias);
  
  EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases.size());
}

TEST_F(AliasDataTests, TestAddAliasAllowsNoDuplicates)
{
  Alias *alias1 = AllocateAlias(_expectedAliasName, _expectedCommand);
  Alias *alias2 = AllocateAlias(_expectedAliasName, _expectedCommand);
  size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases.size() + 1;

  AddAlias(_testCharacter, alias1);
  AddAlias(_testCharacter, alias2);
  
  EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases.size());
}

TEST_F(AliasDataTests, TestAddAliasIgnoresNpcs)
{
  Character *npc = new Character();
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);

  AddAlias(npc, alias);

  // No asserts because we'd get a segfault if test failed.
}

TEST_F(AliasDataTests, TestUnlinkAliasRemovesAlias)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  AddAlias(_testCharacter, alias);
  size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases.size() - 1;

  UnlinkAlias(_testCharacter, alias);

  EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases.size());
}

TEST_F(AliasDataTests, TestUnlinkAliasIgnoresNpcs)
{
  Character *npc = new Character();
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);

  UnlinkAlias(npc, alias);

  // No asserts because we'd get a segfault if test failed.
}

TEST_F(AliasDataTests, TestFreeAliasesIgnoresNpcs)
{
  Character *npc = new Character();
  
  FreeAliases(npc);

  // No asserts because we'd get a segfault if test failed.
}

TEST_F(AliasDataTests, TestFreeAliasesClearsList)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  AddAlias(_testCharacter, alias);

  FreeAliases(_testCharacter);

  EXPECT_TRUE(_testCharacter->PCData->Aliases.empty());
}

TEST_F(AliasDataTests, TestFindAliasFindsTheAlias)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  AddAlias(_testCharacter, alias);

  bool found = FindAlias(_testCharacter, _expectedAliasName);

  EXPECT_TRUE(found);
}

TEST_F(AliasDataTests, TestFindAliasDoesNotFindNonexistentAlias)
{
  Alias *alias = AllocateAlias(_expectedAliasName, _expectedCommand);
  AddAlias(_testCharacter, alias);

  bool found = FindAlias(_testCharacter, "does_not_exist");

  EXPECT_FALSE(found);
}

TEST_F(AliasDataTests, TestFindAliasIgnoresNpcs)
{
  Character *npc = new Character();

  FindAlias(npc, "argument_does_not_matter");
}
