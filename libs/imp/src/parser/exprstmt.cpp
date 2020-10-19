#include "imp/parser/exprstmt.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    ExprStmt::ExprStmt(int n)
        : SmallStmt(n)
    {

    }

     std::shared_ptr<RuntimeValue> ExprStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }

    std::shared_ptr<ExprStmt> ExprStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto exprStmt = std::make_shared<ExprStmt>(s->CurLineNum());
        exprStmt->expr = Expr::Parse(s);
        return exprStmt;
    }
}
