#include "imp/parser/forstmt.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/name.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/suite.hpp"
#include "imp/runtime/listvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/runtimescope.hpp"

namespace Imp
{
    ForStmt::ForStmt(int n)
        : CompoundStmt(n)
    {

    }

    std::shared_ptr<ForStmt> ForStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto forStmt = std::make_shared<ForStmt>(s->CurLineNum());
        Skip(s, TokenKind::ForToken);
        forStmt->name = Name::Parse(s);
        Skip(s, TokenKind::InToken);
        forStmt->expr = Expr::Parse(s);
        Skip(s, TokenKind::ColonToken);
        forStmt->body = Suite::Parse(s);
        return forStmt;
    }

    std::shared_ptr<RuntimeValue> ForStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto controlExpression = expr->Eval(curScope);

        if(dynamic_cast<ListValue*>(controlExpression.get()))
        {
            auto values = ((ListValue *)controlExpression.get())->Value();

            for(int i = 0; i < values.size(); ++i)
            {
                curScope->Assign(name->GetName(), values[i]);
                body->Eval(curScope);
            }
        }
        else
        {
            RuntimeValue::RuntimeError("Control expression must be a list in for statement.", this);
        }

        return std::make_shared<NoneValue>();
    }
}
