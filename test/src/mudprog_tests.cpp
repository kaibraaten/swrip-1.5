#include <string>
#include <vector>
#include <list>
#include <unordered_map>
#include <iterator>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/utility.hpp>
#include "mprog_ext.hpp"
#include "repos/macrorepository.hpp"

class HardcodedMacroRepository : public MacroRepository
{
public:
    HardcodedMacroRepository()
    {
        static const std::vector<std::shared_ptr<MudProgMacroCode>> macros =
        {
            std::make_shared<MudProgMacroCode>(
                "def singelline\n"
                "    mpecho Foo bar baz.\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def multiline\n"
                "    mpecho Foo bar baz.\n"
                "    say Hey you.\n"
                "    -- Comment here\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def witharguments\n"
                "    mpecho One: $1. Two: $2. Three: $3.\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def inner1\n"
                "    mpecho This is inner 1\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def inner2\n"
                "    mpecho This is inner 2\n"
                "    macro inner1\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def nestedmacro\n"
                "    macro inner2\n"
                "    mpecho This is outer macro.\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def innerwithargs\n"
                "    mpecho This is inner with arg $1.\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def nestedmacrowithargs\n"
                "    macro innerwithargs $1\n"
                "    macro innerwithargs $2\n"
                "    macro innerwithargs $3\n"
                "    macro innerwithargs $4\n"
                "    mpecho This is outer macro.\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def macrowithcirculardependency1\n"
                "    macro macrowithcirculardependency2\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def macrowithcirculardependency2\n"
                "    macro macrowithcirculardependency1\n"
                "enddef\n"
                ),
            std::make_shared<MudProgMacroCode>(
                "def firstingroup\n"
                "    mpecho first\n"
                "enddef\n"
                "def secondingroup\n"
                "    mpecho second\n"
                "enddef\n"
                )
        };

        for(auto m : macros)
        {
            Add(m);
        }
    }

    void Load() override
    {

    }

    void Save() const override
    {

    }
};

class MudProgTests : public ::testing::Test
{
public:
    MudProgTests()
        : _env({ std::make_shared<RewriteElIfs>(),
               std::make_shared<RewriteIfAnd>(),
               std::make_shared<DiscardComments>(),
               std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>()) })
    {

    }

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

    MudProgEnvironment _env;
};

TEST_F(MudProgTests, SplitIntoLines_LineCountIsCorrect)
{
    auto actual = SplitIntoVector(_original);

    EXPECT_EQ(_expected.size(), actual.size());
}

TEST_F(MudProgTests, SplitIntoLines_FirstLineIsCorrect)
{
    auto actual = SplitIntoList(_original);

    EXPECT_EQ(_expected.front(), actual.front());
}

TEST_F(MudProgTests, SplitIntoLines_EverythingIsCorrect)
{
    auto actual = SplitIntoList(_original);

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
    auto actual = SplitIntoList(original);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, DiscardComments_Works)
{
    auto actual = SplitIntoVector(_original);
    auto pp = std::make_shared<DiscardComments>();
    pp->Process(actual);

    std::list<std::string> actualAsList(actual.begin(), actual.end());
    EXPECT_EQ(_expectedWithoutComments, actualAsList);
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
    const std::vector<std::string> expected =
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
    auto actual = SplitIntoVector(original);
    auto pp = std::make_shared<RewriteElIfs>();
    pp->Process(actual);
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
    const std::vector<std::string> expected =
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
    auto actual = SplitIntoVector(original);
    auto pp = std::make_shared<RewriteIfAnd>();
    pp->Process(actual);

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
    const std::vector<std::string> expected =
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

    std::string com_list = original;
    _env.PreprocessScript(com_list);
    auto actual = SplitIntoVector(com_list);

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

TEST_F(MudProgTests, ExpandMacros_SingleLineMacroExpanded)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro singelline",
        "endif"
    };
    const std::vector<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho Foo bar baz.",
        "endif"
    };

    auto actual = script;

    auto pp = std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>());
    pp->Process(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_MultiLineMacroExpanded)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro multiline",
        "endif"
    };
    const std::vector<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho Foo bar baz.",
        "say Hey you.",
        "-- Comment here",
        "endif"
    };

    auto actual = script;
    auto pp = std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>());
    pp->Process(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_ArgumentsSubstituted)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro witharguments Foo Bar Baz",
        "endif"
    };
    const std::vector<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho One: Foo. Two: Bar. Three: Baz.",
        "endif"
    };

    auto actual = script;
    auto pp = std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>());
    pp->Process(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_ThrowsExceptionOnInvalidMacroname)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro nosuchmacro",
        "endif"
    };

    EXPECT_THROW(
        {
            try
            {
                auto actual = script;
                auto pp = std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>());
                pp->Process(actual);
            }
            catch(const MudProgException &ex)
            {
                EXPECT_STREQ("Unknown macro 'nosuchmacro'", ex.what());
                throw;
            }
        }, MudProgException);
}

TEST_F(MudProgTests, ExpandMacros_NestedMacros)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro nestedmacro",
        "endif"
    };
    const std::vector<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho This is inner 2",
        "mpecho This is inner 1",
        "mpecho This is outer macro.",
        "endif"
    };

    auto actual = script;
    auto pp = std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>());
    pp->Process(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_NestedMacrosWithArguments)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro nestedmacrowithargs one two 3 four",
        "endif"
    };
    const std::vector<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho This is inner with arg one.",
        "mpecho This is inner with arg two.",
        "mpecho This is inner with arg 3.",
        "mpecho This is inner with arg four.",
        "mpecho This is outer macro.",
        "endif"
    };

    auto actual = script;
    auto pp = std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>());
    pp->Process(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_CircularDependencyThrowsException)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro macrowithcirculardependency1",
        "endif"
    };

    EXPECT_THROW(
        {
            try
            {
                auto actual = script;
                auto pp = std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>());
                pp->Process(actual);
            }
            catch(const MudProgException &ex)
            {
                EXPECT_STREQ("Too many macro expansions. Circular dependency likely.", ex.what());
                throw;
            }
        }, MudProgException);
}

TEST_F(MudProgTests, ExpandMacros_GroupedMacros)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro firstingroup",
        "macro secondingroup",
        "endif"
    };
    const std::vector<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho first",
        "mpecho second",
        "endif"
    };

    auto text = JoinAsString(script);
    _env.PreprocessScript(text);
    auto actual = SplitIntoVector(text);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_LocalMacros)
{
    const std::vector<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro local",
        "endif",
        "def local",
        "  mpecho local",
        "enddef"
    };
    const std::vector<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho local",
        "endif"
    };

    auto actual = script;
    auto pp = std::make_shared<ExpandMacros>(std::make_shared<HardcodedMacroRepository>());
    pp->Process(actual);

    EXPECT_EQ(expected, actual);
}
