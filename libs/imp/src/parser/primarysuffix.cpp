#include "imp/parser/primarysuffix.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/arguments.hpp"
#include "imp/parser/subscription.hpp"

namespace Imp
{
    PrimarySuffix::PrimarySuffix(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<PrimarySuffix> PrimarySuffix::Parse(std::shared_ptr<Scanner> s)
    {
        std::shared_ptr<PrimarySuffix> suffix;
        TokenKind bracketKind = s->CurToken()->Kind();

        switch(bracketKind)
        {
        case TokenKind::LeftBracketToken:
            suffix = Subscription::Parse(s);
            break;

        case TokenKind::LeftParToken:
            suffix = Arguments::Parse(s);
            break;

        default:
            ParserError("Expected a primary suffix but found a " + TokenName(s->CurToken()->Kind()) + "!", s->CurLineNum());
            break;
        }

        suffix->bracketKind = bracketKind;
        return suffix;
    }
}
