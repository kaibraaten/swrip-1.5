#include "imp/parser/nottest.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/comparison.hpp"

namespace Imp
{
    NotTest::NotTest(int n)
        : ImpSyntax(n)
    {
    }

    void NotTest::PrettyPrint(std::ostream &out)
    {
        if(not)
        {
            out << "not ";
        }

        _Comparison->PrettyPrint(out);
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
}
