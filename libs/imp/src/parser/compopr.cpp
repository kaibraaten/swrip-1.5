#include "imp/parser/compopr.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    CompOpr::CompOpr(int n)
        : ImpSyntax(n),
        opr(TokenKind::DoubleEqualToken)
    {

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

    std::shared_ptr<RuntimeValue> CompOpr::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
