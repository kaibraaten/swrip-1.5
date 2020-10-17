#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/subscription.hpp"

namespace Imp
{
    Subscription::Subscription(int n)
        : PrimarySuffix(n)
    {

    }

    void Subscription::PrettyPrint(std::ostream &out)
    {
        out << " ";
        expr->PrettyPrint(out);
        out << " ";
    }

    std::shared_ptr<Subscription> Subscription::Parse(std::shared_ptr<Scanner> s)
    {
        auto sub = std::make_shared<Subscription>(s->CurLineNum());
        Skip(s, TokenKind::LeftBracketToken);
        sub->expr = Expr::Parse(s);
        Skip(s, TokenKind::RightBracketToken);

        return sub;
    }
}
