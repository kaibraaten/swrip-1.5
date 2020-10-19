#include "imp/parser/innerexpr.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/expr.hpp"

namespace Imp
{
    InnerExpr::InnerExpr(int n)
        : Atom(n)
    {

    }

    std::shared_ptr<InnerExpr> InnerExpr::Parse(std::shared_ptr<Scanner> s)
    {
        auto innerExpr = std::make_shared<InnerExpr>(s->CurLineNum());
        Skip(s, TokenKind::LeftParToken);
        innerExpr->expr = Expr::Parse(s);
        Skip(s, TokenKind::RightParToken);
        return innerExpr;
    }

    std::shared_ptr<RuntimeValue> InnerExpr::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
