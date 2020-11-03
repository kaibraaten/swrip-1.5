#include "imp/parser/exprstmt.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    struct ExprStmt::Impl
    {
        std::shared_ptr<Expr> expr;
    };

    ExprStmt::ExprStmt(const std::string &scriptname, int n)
        : SmallStmt(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    ExprStmt::~ExprStmt()
    {

    }

    std::shared_ptr<RuntimeValue> ExprStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
         return pImpl->expr->Eval(curScope);
    }

    std::shared_ptr<ExprStmt> ExprStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto exprStmt = std::make_shared<ExprStmt>(s->ScriptName(), s->CurLineNum());
        exprStmt->pImpl->expr = Expr::Parse(s);
        return exprStmt;
    }
}
