#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/andtest.hpp"
#include "imp/parser/expr.hpp"

namespace Imp
{
    Expr::Expr(int n)
        : ImpSyntax(n)
    {

    }

    void Expr::PrettyPrint(std::ostream &out)
    {
        int nPrinted = 0;

        for(auto aat : andTests)
        {
            if(nPrinted > 0)
                out << " or ";

            aat->PrettyPrint(out);
            ++nPrinted;
        }
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
        return nullptr;
    }
}
