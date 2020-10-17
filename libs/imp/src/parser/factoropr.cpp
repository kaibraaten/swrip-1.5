#include "imp/parser/factoropr.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    FactorOpr::FactorOpr(int n)
        : ImpSyntax(n),
        opr(TokenKind::AstToken)
    {

    }

    void FactorOpr::PrettyPrint(std::ostream &out)
    {
        out << TokenName(opr);
    }

    std::shared_ptr<FactorOpr> FactorOpr::Parse(std::shared_ptr<Scanner> s)
    {
        auto factorOpr = std::make_shared<FactorOpr>(s->CurLineNum());
        TokenKind kind = s->CurToken()->Kind();

        switch(kind)
        {
        case TokenKind::SlashToken:
        case TokenKind::DoubleSlashToken:
        case TokenKind::AstToken:
        case TokenKind::PercentToken:
            factorOpr->opr = kind;
            break;

        default:
            ParserError("Expected a factor operator but found a " + TokenName(kind) + "!", s->CurLineNum());
            break;
        }

        Skip(s, factorOpr->opr);
        return factorOpr;
    }

    std::shared_ptr<RuntimeValue> FactorOpr::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
