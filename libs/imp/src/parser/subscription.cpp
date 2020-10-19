#include "imp/scanner/all.hpp"
#include "imp/parser/subscription.hpp"
#include "imp/parser/expr.hpp"

namespace Imp
{
    Subscription::Subscription(int n)
        : PrimarySuffix(n)
    {

    }

    std::shared_ptr<Subscription> Subscription::Parse(std::shared_ptr<Scanner> s)
    {
        auto sub = std::make_shared<Subscription>(s->CurLineNum());
        Skip(s, TokenKind::LeftBracketToken);
        sub->expr = Expr::Parse(s);
        Skip(s, TokenKind::RightBracketToken);

        return sub;
    }

    std::shared_ptr<RuntimeValue> Subscription::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
