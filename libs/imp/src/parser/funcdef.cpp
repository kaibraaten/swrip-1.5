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
    FuncDef::FuncDef(int n)
        : CompoundStmt(n)
    {

    }

    std::shared_ptr<RuntimeValue> FuncDef::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        std::vector<std::string> formalArgs;

        for(auto n : arguments)
        {
            formalArgs.push_back(n->GetName());
        }

        auto func = std::make_shared<FunctionValue>(name->GetName(), formalArgs, curScope, body);
        curScope->Assign(name->GetName(), func);
        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<FuncDef> FuncDef::Parse(std::shared_ptr<Scanner> s)
    {
        auto funcDef = std::make_shared<FuncDef>(s->CurLineNum());
        Skip(s, TokenKind::DefToken);
        funcDef->name = Name::Parse(s);
        Skip(s, TokenKind::LeftParToken);

        if(s->CurToken()->Kind() != TokenKind::RightParToken)
        {
            while(true)
            {
                funcDef->arguments.push_back(Name::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::RightParToken);
        Skip(s, TokenKind::ColonToken);
        funcDef->body = Suite::Parse(s);

        return funcDef;
    }
}
