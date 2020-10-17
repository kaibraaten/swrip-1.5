#include "imp/parser/innerexpr.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/scanner.hpp"

namespace Imp
{
    InnerExpr::InnerExpr(int n)
        : Atom(n)
    {

    }

    void InnerExpr::PrettyPrint(std::ostream &out)
    {
        out << TokenName(TokenKind::LeftParToken);
        expr->PrettyPrint(out);
        out << TokenName(TokenKind::RightParToken);
    }

    std::shared_ptr<InnerExpr> InnerExpr::Parse(std::shared_ptr<Scanner> s)
    {
        auto innerExpr = std::make_shared<InnerExpr>(s->CurLineNum());
        Skip(s, TokenKind::LeftParToken);
        innerExpr->expr = Expr::Parse(s);
        Skip(s, TokenKind::RightParToken);
        return innerExpr;
    }
}
