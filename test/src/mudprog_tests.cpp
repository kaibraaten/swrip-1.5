#include <string>
#include <vector>
#include <list>
#include <unordered_map>
#include <iterator>
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

const std::unordered_map<std::string, std::string> macros =
{
    {
        "singelline",
        "def macro singelline\n"
        "    mpecho Foo bar baz.\n"
        "enddef\n"
    },
    {
        "multiline",
        "def macro multiline\n"
        "    mpecho Foo bar baz.\n"
        "    say Hey you.\n"
        "    -- Comment here\n"
        "enddef\n"
    },
    {
        "witharguments",
        "def macro witharguments\n"
        "    mpecho One: $1. Two: $2. Three: $3.\n"
        "endef\n"
    },
    {
        "inner1",
        "def macro inner1\n"
        "    mpecho This is inner 1\n"
        "enddef\n"
    },
    {
        "inner2",
        "def macro inner2\n"
        "    mpecho This is inner 2\n"
        "    macro inner1\n"
        "enddef\n"
    },
    {
        "nestedmacro",
        "def nestedmacro\n"
        "    macro inner2\n"
        "    mpecho This is outer macro.\n"
        "enddef\n"
    },
    {
        "innerwithargs",
        "def innerwithargs\n"
        "    mpecho This is inner with arg $1.\n"
        "enddef\n"
    },
    {
        "nestedmacrowithargs",
        "def nestedmacrowithargs\n"
        "    macro innerwithargs $1\n"
        "    macro innerwithargs $2\n"
        "    macro innerwithargs $3\n"
        "    macro innerwithargs $4\n"
        "    mpecho This is outer macro.\n"
        "enddef\n"
    },
    {
        "macrowithcirculardependency1",
        "def macrowithcirculardependency1\n"
        "    macro macrowithcirculardependency2\n"
        "enddef\n"
    },
    {
        "macrowithcirculardependency2",
        "def macrowithcirculardependency2\n"
        "    macro macrowithcirculardependency1\n"
        "enddef\n"
    }
};

class MudProgException : public std::runtime_error
{
public:
    MudProgException(const std::string &message = "Unknown MudProg error")
        : std::runtime_error(message)
    {

    }
};

static std::string GetMacro(const std::string &key)
{
    auto i = macros.find(key);

    if(i != macros.end())
    {
        return i->second;
    }
    else
    {
        std::string message = FormatString("Unknown macro '%s'", key.c_str());
        throw MudProgException(message);
    }
}

template<typename ContainerT>
static bool ScriptCallsMacros(const ContainerT &script)
{
    for(auto line : script)
    {
        if(StringPrefix("macro ", line) == 0)
        {
            return true;
        }
    }

    return false;
}

std::vector<std::string> GetMacroBody(const std::string &macroname)
{
    auto macro = SplitIntoLines(GetMacro(macroname));
    std::vector<std::string> body(macro.begin(), macro.end());
    body.erase(body.begin());
    body.erase(body.end() - 1);
    return body;
}

static std::map<std::string, std::string> BindArguments(std::string args)
{
    std::map<std::string, std::string> arguments;
    int counter = 0;
    
    while(!args.empty())
    {
        ++counter;
        std::string current;
        args = OneArgument(args, current);

        arguments.insert(std::make_pair(FormatString("$%d", counter), current));
    }

    return arguments;
}

static void SubstituteArguments(std::vector<std::string> &script, const std::string &args)
{
    auto arguments = BindArguments(args);
    
    for(auto i = script.begin(); i != script.end(); ++i)
    {
        std::string current = *i;

        for(auto tuple : arguments)
        {
            size_t posOfArg;

            while((posOfArg = current.find(tuple.first)) != std::string::npos)
            {
                current.replace(posOfArg, tuple.first.size(), tuple.second);
            }
        }

        *i = current;
    }
}

void ExpandMacros(std::list<std::string> &script)
{
    constexpr int MAX_EXPANSIONS = 100;
    int expansionCount = 0;
    
    while(ScriptCallsMacros(script))
    {
        if(++expansionCount == MAX_EXPANSIONS)
        {
            throw MudProgException("Too many macro expansions. Circular dependency likely.");
        }
        
        for(std::list<std::string>::iterator i = script.begin();
            i != script.end(); ++i)
        {
            std::string line = *i;

            if(StringPrefix("macro ", line) == 0)
            {
                std::string args = line.substr(strlen("macro "));
                std::string macroname;
                args = OneArgument(args, macroname);

                auto linesToInsert = GetMacroBody(macroname);

                SubstituteArguments(linesToInsert, args);

                i = script.insert(i, linesToInsert.begin(), linesToInsert.end());
                std::advance(i, std::distance(linesToInsert.begin(), linesToInsert.end()) - 1);
                auto eraseAt = i;
                ++eraseAt;
                script.erase(eraseAt);
            }
        }
    }
}

TEST_F(MudProgTests, ExpandMacros_SingleLineMacroExpanded)
{
    const std::list<std::string> script =
        {
            "if test(1)",
            "mpecho lol",
            "macro singelline",
            "endif"
        };
    const std::list<std::string> expected =
        {
            "if test(1)",
            "mpecho lol",
            "mpecho Foo bar baz.",
            "endif"
        };

    auto actual = script;
    ExpandMacros(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_MultiLineMacroExpanded)
{
    const std::list<std::string> script =
        {
            "if test(1)",
            "mpecho lol",
            "macro multiline",
            "endif"
        };
    const std::list<std::string> expected =
        {
            "if test(1)",
            "mpecho lol",
            "mpecho Foo bar baz.",
            "say Hey you.",
            "-- Comment here",
            "endif"
        };

    auto actual = script;
    ExpandMacros(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_ArgumentsSubstituted)
{
    const std::list<std::string> script =
        {
            "if test(1)",
            "mpecho lol",
            "macro witharguments Foo Bar Baz",
            "endif"
        };
    const std::list<std::string> expected =
        {
            "if test(1)",
            "mpecho lol",
            "mpecho One: Foo. Two: Bar. Three: Baz.",
            "endif"
        };

    auto actual = script;
    ExpandMacros(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_ThrowsExceptionOnInvalidMacroname)
{
    const std::list<std::string> script =
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
                ExpandMacros(actual);
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
    const std::list<std::string> script =
        {
            "if test(1)",
            "mpecho lol",
            "macro nestedmacro",
            "endif"
        };
    const std::list<std::string> expected =
        {
            "if test(1)",
            "mpecho lol",
            "mpecho This is inner 2",
            "mpecho This is inner 1",
            "mpecho This is outer macro.",
            "endif"
        };

    auto actual = script;
    ExpandMacros(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_NestedMacrosWithArguments)
{
    const std::list<std::string> script =
        {
            "if test(1)",
            "mpecho lol",
            "macro nestedmacrowithargs one two 3 four",
            "endif"
        };
    const std::list<std::string> expected =
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
    ExpandMacros(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_CircularDependencyThrowsException)
{
    const std::list<std::string> script =
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
                ExpandMacros(actual);
            }
            catch(const MudProgException &ex)
            {
                EXPECT_STREQ("Too many macro expansions. Circular dependency likely.", ex.what());
                throw;
            }
        }, MudProgException);
}
