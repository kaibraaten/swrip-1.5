#include "imp/parser/primarysuffix.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/arguments.hpp"
#include "imp/parser/subscription.hpp"

namespace Imp
{
    struct PrimarySuffix::Impl
    {
        TokenKind bracketKind;
    };

    PrimarySuffix::PrimarySuffix(const std::string &scriptname, int n)
        : ImpSyntax(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    PrimarySuffix::~PrimarySuffix()
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
            ParserError("Expected a primary suffix but found a " + TokenName(s->CurToken()->Kind()) + "!",
                        s->ScriptName(), s->CurLineNum());
            break;
        }

        suffix->pImpl->bracketKind = bracketKind;
        return suffix;
    }

    TokenKind PrimarySuffix::BracketKind() const
    {
        return pImpl->bracketKind;
    }
}
