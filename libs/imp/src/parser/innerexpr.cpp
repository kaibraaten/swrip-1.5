#include "imp/parser/innerexpr.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/expr.hpp"

namespace Imp
{
    struct InnerExpr::Impl
    {
        std::shared_ptr<Expr> expr;
    };

    InnerExpr::InnerExpr(const std::string &scriptname, int n)
        : Atom(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    InnerExpr::~InnerExpr()
    {

    }

    std::shared_ptr<InnerExpr> InnerExpr::Parse(std::shared_ptr<Scanner> s)
    {
        auto innerExpr = std::make_shared<InnerExpr>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::LeftParToken);
        innerExpr->pImpl->expr = Expr::Parse(s);
        Skip(s, TokenKind::RightParToken);
        return innerExpr;
    }

    std::shared_ptr<RuntimeValue> InnerExpr::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return pImpl->expr->Eval(curScope);
    }
}
