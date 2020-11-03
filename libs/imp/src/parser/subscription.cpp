#include "imp/scanner/all.hpp"
#include "imp/parser/subscription.hpp"
#include "imp/parser/expr.hpp"

namespace Imp
{
    struct Subscription::Impl
    {
        std::shared_ptr<Expr> expr;
    };

    Subscription::Subscription(const std::string &scriptname, int n)
        : PrimarySuffix(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Subscription::~Subscription()
    {

    }

    std::shared_ptr<Subscription> Subscription::Parse(std::shared_ptr<Scanner> s)
    {
        auto sub = std::make_shared<Subscription>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::LeftBracketToken);
        sub->pImpl->expr = Expr::Parse(s);
        Skip(s, TokenKind::RightBracketToken);

        return sub;
    }

    std::shared_ptr<RuntimeValue> Subscription::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return pImpl->expr->Eval(curScope);
    }
}
