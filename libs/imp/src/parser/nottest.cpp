#include "imp/parser/nottest.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/comparison.hpp"
#include "imp/runtime/runtimevalue.hpp"

namespace Imp
{
    NotTest::NotTest(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<NotTest> NotTest::Parse(std::shared_ptr<Scanner> s)
    {
        auto notTest = std::make_shared<NotTest>(s->CurLineNum());

        if(s->CurToken()->Kind() == TokenKind::NotToken)
        {
            notTest->not = true;
            Skip(s, TokenKind::NotToken);
        }

        notTest->_Comparison = Comparison::Parse(s);
        return notTest;
    }

    std::shared_ptr<RuntimeValue> NotTest::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto v = _Comparison->Eval(curScope);

        if(not)
        {
            v = v->EvalNot(this);
        }

        return v;
    }
}
