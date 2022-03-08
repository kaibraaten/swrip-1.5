#include <algorithm>
#include <vector>
#include <fstream>
#include <iostream>
#include "imp/parser/fromstmt.hpp"
#include "imp/parser/name.hpp"
#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/listvalue.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/parser/program.hpp"

namespace Imp
{
    static std::string ConvertToFilePath(const std::string &original)
    {
        std::string output = original;
        std::transform(original.begin(), original.end(), output.begin(), [](const auto &c) { return c == '.' ? '/' : c; });
        return output;
    }

    static std::vector<std::string> LoadScript(const std::string &filename, bool &fileWasOpened)
    {
        std::vector<std::string> code;
        std::ifstream file(filename);

        if(file.is_open())
        {
            fileWasOpened = true;
            std::string line;

            while(std::getline(file, line))
            {
                // std::getline doesn't remove carriage return.
                if(!line.empty() && line.ends_with('\r'))
                {
                    line.erase(line.end() - 1);
                }

                code.push_back(line);
            }
        }

        return code;
    }

    struct FromStmt::Impl
    {
        std::string ModuleName;
    };

    FromStmt::FromStmt(const std::string &scriptname, int n)
        : SmallStmt(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    FromStmt::~FromStmt()
    {

    }

    std::shared_ptr<RuntimeValue> FromStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        pImpl->ModuleName = ConvertToFilePath(pImpl->ModuleName);
        auto filename = pImpl->ModuleName + ".py";
        bool fileWasOpened = false;
        auto code = LoadScript(filename, fileWasOpened);
        
        if(!fileWasOpened)
        {
            auto paths = std::dynamic_pointer_cast<ListValue>(curScope->Find("__scriptpath__", this))->Value();

            for(auto p : paths)
            {
                auto pathPrefix = p->GetStringValue("__scriptpath__", this);

                if(!pathPrefix.empty() && pathPrefix[pathPrefix.size() - 1] != '/')
                {
                    pathPrefix += "/";
                }

                code = LoadScript(pathPrefix + filename, fileWasOpened);

                if(fileWasOpened)
                {
                    break;
                }
            }
        }

        if(fileWasOpened)
        {
            auto scanner = std::make_shared<Imp::Scanner>(filename, code);
            auto prog = Program::Parse(scanner);
            prog->Eval(curScope);
            return std::make_shared<NoneValue>();
        }
        else
        {
            RuntimeValue::RuntimeError("Could not open file " + filename, this);
            return nullptr;
        }
    }

    std::shared_ptr<FromStmt> FromStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto fromStmt = std::make_shared<FromStmt>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::FromToken);
        fromStmt->pImpl->ModuleName = Name::Parse(s)->GetName();
        Skip(s, TokenKind::ImportToken);
        Skip(s, TokenKind::AstToken);

        return fromStmt;;
    }
}
