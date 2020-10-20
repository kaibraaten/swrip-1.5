#include "imp/parser/factorprefix.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    FactorPrefix::FactorPrefix(int n)
        : ImpSyntax(n),
        opr(TokenKind::PlusToken)
    {
        
    }

    std::shared_ptr<FactorPrefix> FactorPrefix::Parse(std::shared_ptr<Scanner> s)
    {
        auto factorPrefix = std::make_shared<FactorPrefix>(s->CurLineNum());
        TokenKind kind = s->CurToken()->Kind();

        switch(kind)
        {
        case TokenKind::PlusToken:
        case TokenKind::MinusToken:
            factorPrefix->opr = kind;
            break;

        default:
            ParserError("Expected a factor prefix but found a " + TokenName(kind) + "!", s->CurLineNum());
            break;
        }

        Skip(s, factorPrefix->opr);
        return factorPrefix;
    }

    std::shared_ptr<RuntimeValue> FactorPrefix::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<NoneValue>();
    }
}
