#include "imp/parser/nottest.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/comparison.hpp"
#include "imp/runtime/runtimevalue.hpp"

namespace Imp
{
    struct NotTest::Impl
    {
        std::shared_ptr<Comparison> _Comparison;
        bool _Not = false;
    };

    NotTest::NotTest(int n)
        : ImpSyntax(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    NotTest::~NotTest()
    {

    }

    std::shared_ptr<NotTest> NotTest::Parse(std::shared_ptr<Scanner> s)
    {
        auto notTest = std::make_shared<NotTest>(s->CurLineNum());

        if(s->CurToken()->Kind() == TokenKind::NotToken)
        {
            notTest->pImpl->_Not = true;
            Skip(s, TokenKind::NotToken);
        }

        notTest->pImpl->_Comparison = Comparison::Parse(s);
        return notTest;
    }

    std::shared_ptr<RuntimeValue> NotTest::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto v = pImpl->_Comparison->Eval(curScope);

        if(pImpl->_Not)
        {
            v = v->EvalNot(this);
        }

        return v;
    }
}
