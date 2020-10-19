#include "imp/parser/nottest.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/comparison.hpp"

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
        return nullptr;
    }
}
