#include "imp/parser/termopr.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    TermOpr::TermOpr(const std::string &scriptname, int n)
        : ImpSyntax(scriptname, n),
        opr(TokenKind::PlusToken)
    {

    }

    std::shared_ptr<TermOpr> TermOpr::Parse(std::shared_ptr<Scanner> s)
    {
        auto termOpr = std::make_shared<TermOpr>(s->ScriptName(), s->CurLineNum());
        TokenKind kind = s->CurToken()->Kind();

        if(kind == TokenKind::PlusToken
           || kind == TokenKind::MinusToken)
        {
            termOpr->opr = kind;
            Skip(s, termOpr->opr);
        }
        else
        {
            ParserError("Expected a term operator but found a " + TokenName(kind) + "!",
                        s->ScriptName(), s->CurLineNum());
        }

        return termOpr;
    }

    std::shared_ptr<RuntimeValue> TermOpr::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<NoneValue>();
    }
}
