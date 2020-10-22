#include <vector>
#include "imp/parser/funcdef.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/suite.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/name.hpp"
#include "imp/runtime/functionvalue.hpp"
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    struct FuncDef::Impl
    {
        std::shared_ptr<Name> name;
        std::shared_ptr<Suite> body;
        std::vector<std::shared_ptr<Name>> arguments;
    };

    FuncDef::FuncDef(int n)
        : CompoundStmt(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    FuncDef::~FuncDef()
    {

    }

    std::shared_ptr<RuntimeValue> FuncDef::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        std::vector<std::string> formalArgs;

        for(auto n : pImpl->arguments)
        {
            formalArgs.push_back(n->GetName());
        }

        auto func = std::make_shared<FunctionValue>(pImpl->name->GetName(), formalArgs, curScope, pImpl->body);
        curScope->Assign(pImpl->name->GetName(), func);
        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<FuncDef> FuncDef::Parse(std::shared_ptr<Scanner> s)
    {
        auto funcDef = std::make_shared<FuncDef>(s->CurLineNum());
        Skip(s, TokenKind::DefToken);
        funcDef->pImpl->name = Name::Parse(s);
        Skip(s, TokenKind::LeftParToken);

        if(s->CurToken()->Kind() != TokenKind::RightParToken)
        {
            while(true)
            {
                funcDef->pImpl->arguments.push_back(Name::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::RightParToken);
        Skip(s, TokenKind::ColonToken);
        funcDef->pImpl->body = Suite::Parse(s);

        return funcDef;
    }
}
