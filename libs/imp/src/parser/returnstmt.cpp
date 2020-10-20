#include "imp/parser/returnstmt.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/returnvalue.hpp"

namespace Imp
{
    ReturnStmt::ReturnStmt(int n)
        : SmallStmt(n)
    {

    }

    std::shared_ptr<RuntimeValue> ReturnStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        std::shared_ptr<RuntimeValue> value;

        if(returnExpr != nullptr)
        {
            value = returnExpr->Eval(curScope);
        }
        else
        {
            value = std::make_shared<NoneValue>();
        }

        throw ReturnValue(value, 0);
    }

    std::shared_ptr<ReturnStmt> ReturnStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto returnStmt = std::make_shared<ReturnStmt>(s->CurLineNum());
        Skip(s, TokenKind::ReturnToken);

        if(s->CurToken()->Kind() != TokenKind::NewLineToken)
        {
            returnStmt->returnExpr = Expr::Parse(s);
        }

        return returnStmt;
    }
}
