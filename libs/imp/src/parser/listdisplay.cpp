#include "imp/parser/listdisplay.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    ListDisplay::ListDisplay(int n)
        : Atom(n)
    {

    }

    void ListDisplay::PrettyPrint(std::ostream &out)
    {
        out << TokenName(TokenKind::LeftBracketToken);
        int nPrinted = 0;

        for(auto expr : exprs)
        {
            if(nPrinted > 0)
                out << ", ";

            expr->PrettyPrint(out);
            ++nPrinted;
        }

        out << TokenName(TokenKind::RightBracketToken);
    }

    std::shared_ptr<ListDisplay> ListDisplay::Parse(std::shared_ptr<Scanner> s)
    {
        auto listDisplay = std::make_shared<ListDisplay>(s->CurLineNum());
        Skip(s, TokenKind::LeftBracketToken);

        if(s->CurToken()->Kind() != TokenKind::RightBracketToken)
        {
            while(true)
            {
                listDisplay->exprs.push_back(Expr::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::RightBracketToken);
        return listDisplay;
    }

    std::shared_ptr<RuntimeValue> ListDisplay::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
