#include "imp/parser/andtest.hpp"
#include "imp/parser/nottest.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/runtimevalue.hpp"

namespace Imp
{
    AndTest::AndTest(int n)
        : ImpSyntax(n)
    {
    }

    std::shared_ptr<AndTest> AndTest::Parse(std::shared_ptr<Scanner> s)
    {
        auto at = std::make_shared<AndTest>(s->CurLineNum());

        while(true)
        {
            at->NotTests.push_back(NotTest::Parse(s));

            if(s->CurToken()->Kind() != TokenKind::AndToken)
            {
                break;
            }

            Skip(s, TokenKind::AndToken);
        }

        return at;
    }

    std::shared_ptr<RuntimeValue> AndTest::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto v = NotTests[0]->Eval(curScope);

        for(int i = 1; i < NotTests.size(); ++i)
        {
            if(!v->GetBoolValue("and operand", this))
            {
                return v;
            }

            v = NotTests[i]->Eval(curScope);
        }

        return v;
    }
}