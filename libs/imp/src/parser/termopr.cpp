#include "imp/parser/termopr.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/scanner/scanner.hpp"

namespace Imp
{
    TermOpr::TermOpr(int n)
        : ImpSyntax(n),
        opr(TokenKind::PlusToken)
    {

    }

    void TermOpr::PrettyPrint(std::ostream &out)
    {
        out << TokenName(opr);
    }

    std::shared_ptr<TermOpr> TermOpr::Parse(std::shared_ptr<Scanner> s)
    {
        auto termOpr = std::make_shared<TermOpr>(s->CurLineNum());
        TokenKind kind = s->CurToken()->Kind();

        if(kind == TokenKind::PlusToken
           || kind == TokenKind::MinusToken)
        {
            termOpr->opr = kind;
            Skip(s, termOpr->opr);
        }
        else
        {
            ParserError("Expected a term operator but found a " + TokenName(kind) + "!", s->CurLineNum());
        }

        return termOpr;
    }

    std::shared_ptr<RuntimeValue> TermOpr::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
