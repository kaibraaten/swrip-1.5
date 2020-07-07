#include <string>
#include <vector>
#include <list>
#include <unordered_map>
#include <iterator>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/utility.hpp>
#include "mprog.hpp"

static const std::vector<std::string> GlobalMacros =
{
        "def singelline\n"
        "    mpecho Foo bar baz.\n"
        "enddef\n",

        "def multiline\n"
        "    mpecho Foo bar baz.\n"
        "    say Hey you.\n"
        "    -- Comment here\n"
        "enddef\n",

        "def witharguments\n"
        "    mpecho One: $1. Two: $2. Three: $3.\n"
        "enddef\n",

        "def inner1\n"
        "    mpecho This is inner 1\n"
        "enddef\n",

        "def inner2\n"
        "    mpecho This is inner 2\n"
        "    macro inner1\n"
        "enddef\n",

        "def nestedmacro\n"
        "    macro inner2\n"
        "    mpecho This is outer macro.\n"
        "enddef\n",

        "def innerwithargs\n"
        "    mpecho This is inner with arg $1.\n"
        "enddef\n",

        "def nestedmacrowithargs\n"
        "    macro innerwithargs $1\n"
        "    macro innerwithargs $2\n"
        "    macro innerwithargs $3\n"
        "    macro innerwithargs $4\n"
        "    mpecho This is outer macro.\n"
        "enddef\n",

        "def macrowithcirculardependency1\n"
        "    macro macrowithcirculardependency2\n"
        "enddef\n",

        "def macrowithcirculardependency2\n"
        "    macro macrowithcirculardependency1\n"
        "enddef\n",

    "def firstingroup\n"
    "    mpecho first\n"
    "enddef\n"
    "def secondingroup\n"
    "    mpecho second\n"
    "enddef\n"
};

class MudProgException : public std::runtime_error
{
public:
    MudProgException(const std::string &message = "Unknown MudProg error")
        : std::runtime_error(message)
    {

    }
};

class MudProgEnvironment
{
public:
    MudProgEnvironment(const std::vector<std::string> &macros);
    void PreprocessScript(std::string &com_list);
    void ExpandMacros(std::list<std::string> &script);
    void DiscardComments(std::vector<std::string> &document);
    void RewriteElIfs(std::vector<std::string> &document);
    void RewriteIfAnd(std::vector<std::string> &document);
    std::vector<std::string> SplitIntoLines(std::string input);

private:
    void SubstituteArguments(std::vector<std::string> &script, const std::string &args);
    std::map<std::string, std::string> BindArguments(std::string args);
    std::vector<std::string> GetMacroBody(const std::string &macroname);
    bool ScriptCallsMacros(std::list<std::string> &script);
    void AddMacro(std::string code);
    std::string GetMacro(const std::string &name);
    void RegisterLocalMacros(std::list<std::string> &script);

    std::vector<std::string> _globalMacros;
    std::vector<std::string> _localMacros;
};

MudProgEnvironment::MudProgEnvironment(const std::vector<std::string> &macros)
    : _globalMacros(macros)
{

}

void MudProgEnvironment::PreprocessScript(std::string &com_list)
{
    auto script = SplitIntoLines(com_list);
    DiscardComments(script);
    RewriteElIfs(script);
    //RewriteIfAnd(script);
    com_list = JoinAsString(script);
}

void MudProgEnvironment::ExpandMacros(std::list<std::string> &script)
{
    constexpr int MAX_EXPANSIONS = 100;
    int expansionCount = 0;

    RegisterLocalMacros(script);

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

void MudProgEnvironment::DiscardComments(std::vector<std::string> &document)
{
    for(auto it = document.begin(); it != document.end(); )
    {
        if(StringPrefix("--", *it) == 0)
        {
            it = document.erase(it);
        }
        else
        {
            ++it;
        }
    }
}

void MudProgEnvironment::RewriteElIfs(std::vector<std::string> &document)
{
    std::list<std::string> docAsList(document.begin(), document.end());

    for(auto i = docAsList.begin(); i != docAsList.end(); ++i)
    {
        if(StringPrefix("elif ", *i) == 0)
        {
            std::string ifcheck = (*i).substr(2);
            *i = "else";

            for(auto endifIter = i; endifIter != docAsList.end(); ++endifIter)
            {
                if(*endifIter == "endif")
                {
                    docAsList.insert(endifIter, "endif");
                    break;
                }
            }

            ++i;
            docAsList.insert(i, ifcheck);
        }
    }

    document.assign(docAsList.begin(), docAsList.end());
}

void MudProgEnvironment::RewriteIfAnd(std::vector<std::string> &document)
{
    std::list<std::string> docAsList(document.begin(), document.end());

    for(auto i = docAsList.begin(); i != docAsList.end(); ++i)
    {
        if(StringPrefix("and ", *i) == 0)
        {
            *i = "if" + (*i).substr(3);

            for(auto endblockIter = i; endblockIter != docAsList.end(); ++endblockIter)
            {
                if(*endblockIter == "endif" || *endblockIter == "else" || *endblockIter == "elif")
                {
                    docAsList.insert(endblockIter, "endif");
                    break;
                }
            }
        }
    }

    document.assign(docAsList.begin(), docAsList.end());
}

void MudProgEnvironment::RegisterLocalMacros(std::list<std::string> &script)
{
    for(std::list<std::string>::iterator i = script.begin();
        i != script.end(); ++i)
    {
        std::string line = *i;

        if(StringPrefix("def ", line) == 0)
        {
            auto end = find(i, script.end(), "enddef");

            if(end != script.end())
            {
                auto eraseAt = i;
                --i;
                ++end;
                AddMacro(JoinAsString(eraseAt, end));
                script.erase(eraseAt, end);
            }
            else
            {
                std::string macroname;
                std::string def;
                line = OneArgument(line, def);
                line = OneArgument(line, macroname);
                throw MudProgException(FormatString("Local macro '%s' missing enddef", macroname.c_str()));
            }
        }
    }
}

std::string MudProgEnvironment::GetMacro(const std::string &name)
{
    for(auto i : _globalMacros)
    {
        auto entry = SplitIntoLines(i);
        auto start = std::find(entry.begin(), entry.end(), "def " + name);

        if(start != entry.end())
        {
            auto end = std::find(start, entry.end(), "enddef");

            if(end != entry.end())
            {
                ++end;
                return JoinAsString(start, end);
            }
            else
            {
                throw MudProgException("def macro lacks matching enddef");
            }
        }
    }

    for(auto i : _localMacros)
    {
        auto entry = SplitIntoLines(i);
        auto start = std::find(entry.begin(), entry.end(), "def " + name);

        if(start != entry.end())
        {
            auto end = std::find(start, entry.end(), "enddef");

            if(end != entry.end())
            {
                ++end;
                return JoinAsString(start, end);
            }
            else
            {
                throw MudProgException("def macro lacks matching enddef");
            }
        }
    }

    std::string message = FormatString("Unknown macro '%s'", name.c_str());
    throw MudProgException(message);
}

void MudProgEnvironment::AddMacro(std::string code)
{
    code = StripCarriageReturn(code);
    _localMacros.push_back(code);
}

bool MudProgEnvironment::ScriptCallsMacros(std::list<std::string> &script)
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

std::vector<std::string> MudProgEnvironment::GetMacroBody(const std::string &macroname)
{
    auto macro = SplitIntoLines(GetMacro(macroname));
    std::vector<std::string> body(macro.begin(), macro.end());
    body.erase(body.begin());
    body.erase(body.end() - 1);
    return body;
}

std::map<std::string, std::string> MudProgEnvironment::BindArguments(std::string args)
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

void MudProgEnvironment::SubstituteArguments(std::vector<std::string> &script, const std::string &args)
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

std::vector<std::string> MudProgEnvironment::SplitIntoLines(std::string input)
{
    std::vector<std::string> output;

    if(!input.empty())
    {
        input = StripCarriageReturn(input);

        if(input[input.size() - 1] != '\n')
        {
            input += '\n';
        }

        size_t start = 0;
        size_t end = 0;

        while((end = input.find('\n', start)) != std::string::npos)
        {
            std::string line = TrimString(input.substr(start, end - start));

            if(!line.empty())
            {
                output.push_back(line);
            }

            start = end + 1;
        }
    }

    return output;
}

class MudProgTests : public ::testing::Test
{
public:
    MudProgTests()
        : _env(GlobalMacros)
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
    auto actual = _env.SplitIntoLines(_original);

    EXPECT_EQ(_expected.size(), actual.size());
}

TEST_F(MudProgTests, SplitIntoLines_FirstLineIsCorrect)
{
    auto actual = _env.SplitIntoLines(_original);

    std::list<std::string> actualAsList(actual.begin(), actual.end());
    EXPECT_EQ(_expected.front(), actualAsList.front());
}

TEST_F(MudProgTests, SplitIntoLines_EverythingIsCorrect)
{
    auto actual = _env.SplitIntoLines(_original);

    std::list<std::string> actualAsList(actual.begin(), actual.end());
    EXPECT_EQ(_expected, actualAsList);
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
    auto actual = _env.SplitIntoLines(original);

    std::list<std::string> actualAsList(actual.begin(), actual.end());
    EXPECT_EQ(expected, actualAsList);
}

TEST_F(MudProgTests, DiscardComments_Works)
{
    auto actual = _env.SplitIntoLines(_original);
    _env.DiscardComments(actual);

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
    auto actual = _env.SplitIntoLines(original);
    _env.RewriteElIfs(actual);

    std::list<std::string> actualAsList(actual.begin(), actual.end());
    EXPECT_EQ(expected, actualAsList);
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
    auto actual = _env.SplitIntoLines(original);
    _env.RewriteIfAnd(actual);

    std::list<std::string> actualAsList(actual.begin(), actual.end());
    EXPECT_EQ(expected, actualAsList);
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
    auto actual = _env.SplitIntoLines(original);
    _env.DiscardComments(actual);
    _env.RewriteElIfs(actual);
    _env.RewriteIfAnd(actual);

    std::list<std::string> actualAsList(actual.begin(), actual.end());
    EXPECT_EQ(expected, actualAsList);
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
    _env.ExpandMacros(actual);

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
    _env.ExpandMacros(actual);

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
    _env.ExpandMacros(actual);

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
                _env.ExpandMacros(actual);
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
    _env.ExpandMacros(actual);

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
    _env.ExpandMacros(actual);

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
                _env.ExpandMacros(actual);
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
    const std::list<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro firstingroup",
        "macro secondingroup",
        "endif"
    };
    const std::list<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho first",
        "mpecho second",
        "endif"
    };

    auto actual = script;
    _env.ExpandMacros(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(MudProgTests, ExpandMacros_LocalMacros)
{
    const std::list<std::string> script =
    {
        "if test(1)",
        "mpecho lol",
        "macro local",
        "endif",
        "def local",
        "  mpecho local",
        "enddef"
    };
    const std::list<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho local",
        "endif"
    };

    auto actual = script;
    _env.ExpandMacros(actual);

    EXPECT_EQ(expected, actual);
}

/*
TEST_F(MudProgTests, ExpandMacros_LocalMacrosAtStartOfScript)
{
    const std::list<std::string> script =
    {
        "def local",
        "  mpecho local",
        "enddef",
        "if test(1)",
        "mpecho lol",
        "macro local",
        "endif"
    };
    const std::list<std::string> expected =
    {
        "if test(1)",
        "mpecho lol",
        "mpecho local",
        "endif"
    };

    auto actual = script;
    MudProgEnvironment env(macros);
    env.ExpandMacros(actual);

    EXPECT_EQ(expected, actual);
}
*/
