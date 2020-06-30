#include <string>
#include <vector>
#include <list>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/utility.hpp>
#include "mprog.hpp"

class MudProgTests : public ::testing::Test
{
protected:
    void SetUp() override
    {

    }

    void TearDown() override
    {

    }

    const char *_original =
        "-- Comments are discarded\r\n"
        "if isimmort($n)\r\n"
        "  mpecho $n You're immortal.\n\r"
        "\n"
        "-- It's another comment\r\n"
        "endif\n"
        "";
    const std::list<std::string> _expected =
    {
        "-- Comments are discarded",
        "if isimmort($n)",
        "mpecho $n You're immortal.",
        "-- It's another comment",
        "endif"
    };
    const std::list<std::string> _expectedWithoutComments =
    {
        "if isimmort($n)",
        "mpecho $n You're immortal.",
        "endif"
    };
};

TEST_F(MudProgTests, SplitIntoLines_LineCountIsCorrect)
{
    auto actual = SplitIntoLines(_original);

    EXPECT_EQ(_expected.size(), actual.size());
}

TEST_F(MudProgTests, SplitIntoLines_FirstLineIsCorrect)
{
    auto actual = SplitIntoLines(_original);

    EXPECT_EQ(_expected.front(), actual.front());
}

TEST_F(MudProgTests, SplitIntoLines_EverythingIsCorrect)
{
    auto actual = SplitIntoLines(_original);

    EXPECT_EQ(_expected, actual);
}

TEST_F(MudProgTests, SplitIntoLines_HandlesCaseWhereNoNewlineAtEnd)
{
    const char *original =
        "-- Comments are discarded\r\n"
        "if isimmort($n)\r\n"
        "  mpecho $n You're immortal.\n\r"
        "\n"
        "-- It's another comment\r\n"
        "endif";
    const std::list<std::string> expected =
    {
        "-- Comments are discarded",
        "if isimmort($n)",
        "mpecho $n You're immortal.",
        "-- It's another comment",
        "endif"
    };
    auto actual = SplitIntoLines(original);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, DiscardComments_Works)
{
    auto actual = SplitIntoLines(_original);
    DiscardComments(actual);

    EXPECT_EQ(_expectedWithoutComments, actual);
}

TEST_F(MudProgTests, RewriteElIfs_Works)
{
    const char *original =
        "if isimmort($n)\r\n"
        "  something\r\n"
        "elif class($n) == combat\r\n"
        "  somethingelse\r\n"
        "elif foo($n)\r\n"
        "  yetsomethingelse\r\n"
        "endif";
    const std::list<std::string> expected =
    {
        "if isimmort($n)",
        "something",
        "else",
        "if class($n) == combat",
        "somethingelse",
        "else",
        "if foo($n)",
        "yetsomethingelse",
        "endif",
        "endif",
        "endif"
    };
    auto actual = SplitIntoLines(original);
    RewriteElIfs(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, RewriteIfAnd_Works)
{
    const char *original =
        "if isimmort($n)\n"
        "    and level($n) > 10\n"
        "    and race($n) != wookiee\n"
        "    something\n"
        "else\n"
        "    somethingelse\n"
        "endif\n";
    const std::list<std::string> expected =
    {
        "if isimmort($n)",
        "if level($n) > 10",
        "if race($n) != wookiee",
        "something",
        "endif",
        "endif",
        "else",
        "somethingelse",
        "endif"
    };
    auto actual = SplitIntoLines(original);
    RewriteIfAnd(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ComplexExample_Works)
{
    const char *original =
        "if isimmort($n)\n"
        "  and level($n) > 10\n"
        "  and race($n) != wookiee\n"
        "    something\n"
        "elif class($n) == combat\n"
        "    -- Combatants get special treatment\n"
        "    somethingelse\n"
        "elif foo($n)\n"
        "  or bar($n)\n"
        "    yetsomethingelse\n"
        "endif\n";
    const std::list<std::string> expected =
    {
        "if isimmort($n)",
        "if level($n) > 10",
        "if race($n) != wookiee",
        "something",
        "endif",
        "endif",
        "else",
        "if class($n) == combat",
        "somethingelse",
        "else",
        "if foo($n)",
        "or bar($n)",
        "yetsomethingelse",
        "endif",
        "endif",
        "endif"
    };
    auto actual = SplitIntoLines(original);
    DiscardComments(actual);
    RewriteElIfs(actual);
    RewriteIfAnd(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, JoinAsString_Works)
{
    const char *expected =
        "if isimmort($n)\r\n"
        "if level($n) > 10\r\n"
        "if race($n) != wookiee\r\n"
        "something\r\n"
        "endif\r\n"
        "endif\r\n"
        "else\r\n"
        "somethingelse\r\n"
        "endif\r\n";
    const std::list<std::string> original =
    {
        "if isimmort($n)",
        "if level($n) > 10",
        "if race($n) != wookiee",
        "something",
        "endif",
        "endif",
        "else",
        "somethingelse",
        "endif"
    };

    auto actual = JoinAsString(original);

    EXPECT_EQ(expected, actual);
}
