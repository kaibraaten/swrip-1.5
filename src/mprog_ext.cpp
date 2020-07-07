#include <map>
#include <utility/utility.hpp>
#include "mprog_ext.hpp"

std::list<std::string> SplitIntoList(std::string input)
{
    std::list<std::string> output;

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

std::vector<std::string> SplitIntoVector(std::string input)
{
    auto asList = SplitIntoList(input);
    return { asList.begin(), asList.end() };
}

void RewriteElIfs::Process(std::vector<std::string> &script)
{
    std::list<std::string> docAsList(script.begin(), script.end());

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

    script.assign(docAsList.begin(), docAsList.end());
}

void RewriteIfAnd::Process(std::vector<std::string> &document)
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

void DiscardComments::Process(std::vector<std::string> &document)
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

class ExpandMacros::Impl
{
public:
    Impl(std::shared_ptr<MacroRepository> repos);
    void Process(std::vector<std::string> &script);

private:
    void SubstituteArguments(std::vector<std::string> &script, const std::string &args);
    std::map<std::string, std::string> BindArguments(std::string args);
    std::vector<std::string> GetMacroBody(const std::string &macroname);
    bool ScriptCallsMacros(std::list<std::string> &script);
    void AddMacro(std::string code);
    std::string GetMacro(const std::string &name);
    void RegisterLocalMacros(std::list<std::string> &script);

    std::shared_ptr<MacroRepository> _repos;
    std::vector<std::shared_ptr<MudProgMacroCode>> _localMacros;
};

ExpandMacros::Impl::Impl(std::shared_ptr<MacroRepository> repos)
    : _repos(repos)
{

}

void ExpandMacros::Impl::Process(std::vector<std::string> &script)
{
    constexpr int MAX_EXPANSIONS = 100;
    int expansionCount = 0;
    std::list<std::string> scriptAsList(script.begin(), script.end());

    RegisterLocalMacros(scriptAsList);

    while(ScriptCallsMacros(scriptAsList))
    {
        if(++expansionCount == MAX_EXPANSIONS)
        {
            throw MudProgException("Too many macro expansions. Circular dependency likely.");
        }

        for(std::list<std::string>::iterator i = scriptAsList.begin();
            i != scriptAsList.end(); ++i)
        {
            std::string line = *i;

            if(StringPrefix("macro ", line) == 0)
            {
                std::string args = line.substr(strlen("macro "));
                std::string macroname;
                args = OneArgument(args, macroname);

                auto linesToInsert = GetMacroBody(macroname);

                SubstituteArguments(linesToInsert, args);

                i = scriptAsList.insert(i, linesToInsert.begin(), linesToInsert.end());
                std::advance(i, std::distance(linesToInsert.begin(), linesToInsert.end()) - 1);
                auto eraseAt = i;
                ++eraseAt;
                scriptAsList.erase(eraseAt);
            }
        }
    }

    script.assign(scriptAsList.begin(), scriptAsList.end());
}

void ExpandMacros::Impl::RegisterLocalMacros(std::list<std::string> &script)
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

std::string ExpandMacros::Impl::GetMacro(const std::string &name)
{
    for(auto i : _repos)
    {
        auto entry = SplitIntoVector(i->Text);
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
        auto entry = SplitIntoVector(i->Text);
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

void ExpandMacros::Impl::AddMacro(std::string code)
{
    code = StripCarriageReturn(code);
    _localMacros.push_back(std::make_shared<MudProgMacroCode>(code));
}

bool ExpandMacros::Impl::ScriptCallsMacros(std::list<std::string> &script)
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

std::vector<std::string> ExpandMacros::Impl::GetMacroBody(const std::string &macroname)
{
    auto body = SplitIntoVector(GetMacro(macroname));
    body.erase(body.begin());
    body.erase(body.end() - 1);
    return body;
}

std::map<std::string, std::string> ExpandMacros::Impl::BindArguments(std::string args)
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

void ExpandMacros::Impl::SubstituteArguments(std::vector<std::string> &script, const std::string &args)
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

ExpandMacros::ExpandMacros(std::shared_ptr<MacroRepository> repos)
    : pImpl(std::make_unique<Impl>(repos))
{

}

ExpandMacros::~ExpandMacros()
{

}

void ExpandMacros::Process(std::vector<std::string> &script)
{
    pImpl->Process(script);
}

MudProgEnvironment::MudProgEnvironment(std::initializer_list<std::shared_ptr<MudProgPreprocessor>> preprocessors)
    : _preprocessors(preprocessors)
{

}

void MudProgEnvironment::PreprocessScript(std::string &com_list)
{
    auto script = SplitIntoVector(com_list);

    for(auto pp : _preprocessors)
    {
        pp->Process(script);
    }

    com_list = JoinAsString(std::cbegin(script), std::cend(script));
}
