#include <vector>
#include "imp/scanner/all.hpp"
#include "imp/parser/andtest.hpp"
#include "imp/parser/expr.hpp"
#include "imp/runtime/runtimevalue.hpp"

namespace Imp
{
    struct Expr::Impl
    {
        std::vector<std::shared_ptr<AndTest>> AndTests;
    };

    Expr::Expr(const std::string &scriptname, int n)
        : ImpSyntax(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Expr::~Expr()
    {

    }

    std::shared_ptr<Expr> Expr::Parse(std::shared_ptr<Scanner> s)
    {
        auto ae = std::make_shared<Expr>(s->ScriptName(), s->CurLineNum());

        while(true)
        {
            ae->pImpl->AndTests.push_back(AndTest::Parse(s));

            if(s->CurToken()->Kind() != TokenKind::OrToken)
                break;

            Skip(s, TokenKind::OrToken);
        }

        return ae;
    }

    std::shared_ptr<RuntimeValue> Expr::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto v = pImpl->AndTests[0]->Eval(curScope);

        for(int i = 1; i < pImpl->AndTests.size(); ++i)
        {
            if(v->GetBoolValue("or operand", this))
            {
                return v;
            }

            v = pImpl->AndTests[i]->Eval(curScope);
        }

        return v;
    }
}
