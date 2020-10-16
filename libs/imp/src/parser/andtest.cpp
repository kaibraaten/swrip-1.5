#include "imp/parser/andtest.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
namespace Imp
{
    AndTest::AndTest(int n)
        : ImpSyntax(n)
    {
    }

    void AndTest::PrettyPrint(std::ostream &out)
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
    }
}
