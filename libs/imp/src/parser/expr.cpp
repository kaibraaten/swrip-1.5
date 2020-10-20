#include "imp/scanner/all.hpp"
#include "imp/parser/andtest.hpp"
#include "imp/parser/expr.hpp"
#include "imp/runtime/runtimevalue.hpp"

namespace Imp
{
    Expr::Expr(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<Expr> Expr::Parse(std::shared_ptr<Scanner> s)
    {
        auto ae = std::make_shared<Expr>(s->CurLineNum());

        while(true)
        {
            ae->andTests.push_back(AndTest::Parse(s));

            if(s->CurToken()->Kind() != TokenKind::OrToken)
                break;

            Skip(s, TokenKind::OrToken);
        }

        return ae;
    }

    std::shared_ptr<RuntimeValue> Expr::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto v = andTests[0]->Eval(curScope);

        for(int i = 1; i < andTests.size(); ++i)
        {
            if(v->GetBoolValue("or operand", this))
            {
                return v;
            }

            v = andTests[i]->Eval(curScope);
        }

        return v;
    }
}
