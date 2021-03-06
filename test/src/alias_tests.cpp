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
        _testCharacter = std::make_shared<Character>(std::make_unique<PCData>());
        MapCharacterAndDescriptor(_testCharacter, std::make_shared<NullDescriptor>());
        auto protoMob = MakeMobile(1, INVALID_VNUM, "Foo");
        _testNpc = std::make_shared<Character>(protoMob);
    }

    void TearDown() override
    {
        _testCharacter = nullptr;
        _testNpc = nullptr;
    }

    std::shared_ptr<Character> _testCharacter;
    std::shared_ptr<Character> _testNpc;
    const std::string _expectedAliasName = "alias";
    const std::string _expectedCommand = "command";
};

TEST_F(AliasTests, AllocateAlias)
{
    auto target = AllocateAlias(_expectedAliasName, _expectedCommand);

    ASSERT_NE(target, nullptr);
    EXPECT_EQ(_expectedAliasName, target->Name);
    EXPECT_EQ(_expectedCommand, target->Command);
}

TEST_F(AliasTests, AddAlias)
{
    auto alias = AllocateAlias(_expectedAliasName, _expectedCommand);
    size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases().size() + 1;

    AddAlias(_testCharacter, alias);

    EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases().size());
}

TEST_F(AliasTests, AddAliasAllowsNoDuplicates)
{
    auto alias1 = AllocateAlias(_expectedAliasName, _expectedCommand);
    auto alias2 = AllocateAlias(_expectedAliasName, _expectedCommand);
    size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases().size() + 1;

    AddAlias(_testCharacter, alias1);
    AddAlias(_testCharacter, alias2);

    EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases().size());
}

TEST_F(AliasTests, AddAliasIgnoresNpcs)
{
    auto alias = AllocateAlias(_expectedAliasName, _expectedCommand);

    AddAlias(_testNpc, alias);

    // No asserts because we'd get a segfault if test failed.
}

TEST_F(AliasTests, UnlinkAliasRemovesAlias)
{
    auto alias = AllocateAlias(_expectedAliasName, _expectedCommand);
    AddAlias(_testCharacter, alias);
    size_t expectedNumberOfAliases = _testCharacter->PCData->Aliases().size() - 1;

    UnlinkAlias(_testCharacter, alias);

    EXPECT_EQ(expectedNumberOfAliases, _testCharacter->PCData->Aliases().size());
}

TEST_F(AliasTests, UnlinkAliasIgnoresNpcs)
{
    auto alias = AllocateAlias(_expectedAliasName, _expectedCommand);

    UnlinkAlias(_testNpc, alias);

    // No asserts because we'd get a segfault if test failed.
}

TEST_F(AliasTests, FreeAliasesClearsList)
{
    auto alias = AllocateAlias(_expectedAliasName, _expectedCommand);
    AddAlias(_testCharacter, alias);

    FreeAliases(_testCharacter);

    EXPECT_TRUE(_testCharacter->PCData->Aliases().empty());
}

TEST_F(AliasTests, FindAliasFindsTheAlias)
{
    auto alias = AllocateAlias(_expectedAliasName, _expectedCommand);
    AddAlias(_testCharacter, alias);

    bool found = FindAlias(_testCharacter, _expectedAliasName) ? true : false;

    EXPECT_TRUE(found);
}

TEST_F(AliasTests, FindAliasDoesNotFindNonexistentAlias)
{
    auto alias = AllocateAlias(_expectedAliasName, _expectedCommand);
    AddAlias(_testCharacter, alias);

    bool found = FindAlias(_testCharacter, "does_not_exist") ? true : false;

    EXPECT_FALSE(found);
}

TEST_F(AliasTests, FindAliasIgnoresNpcs)
{
    FindAlias(_testNpc, "argument_does_not_matter");
}
