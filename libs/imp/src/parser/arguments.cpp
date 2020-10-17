#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/arguments.hpp"

namespace Imp
{
    Arguments::Arguments(int n)
        : PrimarySuffix(n)
    {

    }

    void Arguments::PrettyPrint(std::ostream &out)
    {
        out << TokenName(TokenKind::LeftParToken);
        int nPrinted = 0;

        for(auto expr : exprs)
        {
            if(nPrinted > 0)
            {
                out << ", ";
            }

            expr->PrettyPrint(out);
            ++nPrinted;
        }

        out << TokenName(TokenKind::RightParToken);
    }

    std::shared_ptr<Arguments> Arguments::Parse(std::shared_ptr<Scanner> s)
    {
        auto args = std::make_shared<Arguments>(s->CurLineNum());
        Skip(s, TokenKind::LeftParToken);

        if(s->CurToken()->Kind() != TokenKind::RightParToken)
        {
            while(true)
            {
                args->exprs.push_back(Expr::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::RightParToken);
        return args;
    }
}
