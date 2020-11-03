#include "imp/parser/returnstmt.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/returnvalue.hpp"

namespace Imp
{
    struct ReturnStmt::Impl
    {
        std::shared_ptr<Expr> returnExpr;
    };

    ReturnStmt::ReturnStmt(const std::string &scriptname, int n)
        : SmallStmt(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    ReturnStmt::~ReturnStmt()
    {

    }

    std::shared_ptr<RuntimeValue> ReturnStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        std::shared_ptr<RuntimeValue> value;

        if(pImpl->returnExpr != nullptr)
        {
            value = pImpl->returnExpr->Eval(curScope);
        }
        else
        {
            value = std::make_shared<NoneValue>();
        }

        throw ReturnValue(value, 0);
    }

    std::shared_ptr<ReturnStmt> ReturnStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto returnStmt = std::make_shared<ReturnStmt>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::ReturnToken);

        if(s->CurToken()->Kind() != TokenKind::NewLineToken)
        {
            returnStmt->pImpl->returnExpr = Expr::Parse(s);
        }

        return returnStmt;
    }
}
