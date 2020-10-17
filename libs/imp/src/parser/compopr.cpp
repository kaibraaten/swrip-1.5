#include "imp/parser/compopr.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/scanner/scanner.hpp"

namespace Imp
{
    CompOpr::CompOpr(int n)
        : ImpSyntax(n),
        opr(TokenKind::DoubleEqualToken)
    {

    }

    void CompOpr::PrettyPrint(std::ostream &out)
    {
        out << TokenName(opr);
    }

    std::shared_ptr<CompOpr> CompOpr::Parse(std::shared_ptr<Scanner> s)
    {
        auto compOpr = std::make_shared<CompOpr>(s->CurLineNum());
        TokenKind kind = s->CurToken()->Kind();

        if(kind == TokenKind::LessToken
           || kind == TokenKind::GreaterToken
           || kind == TokenKind::DoubleEqualToken
           || kind == TokenKind::GreaterEqualToken
           || kind == TokenKind::LessEqualToken
           || kind == TokenKind::NotEqualToken)
        {
            compOpr->opr = kind;
            Skip(s, compOpr->opr);
        }
        else
        {
            ParserError("Expected a comparison operator but found a " + TokenName(kind) + "!", s->CurLineNum());
        }

        return compOpr;
    }
}
