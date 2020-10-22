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
    struct ForStmt::Impl
    {
        std::shared_ptr<Name> name;
        std::shared_ptr<Expr> expr;
        std::shared_ptr<Suite> body;
    };

    ForStmt::ForStmt(int n)
        : CompoundStmt(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    ForStmt::~ForStmt()
    {

    }

    std::shared_ptr<ForStmt> ForStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto forStmt = std::make_shared<ForStmt>(s->CurLineNum());
        Skip(s, TokenKind::ForToken);
        forStmt->pImpl->name = Name::Parse(s);
        Skip(s, TokenKind::InToken);
        forStmt->pImpl->expr = Expr::Parse(s);
        Skip(s, TokenKind::ColonToken);
        forStmt->pImpl->body = Suite::Parse(s);
        return forStmt;
    }

    std::shared_ptr<RuntimeValue> ForStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto controlExpression = pImpl->expr->Eval(curScope);

        if(dynamic_cast<ListValue*>(controlExpression.get()))
        {
            auto values = ((ListValue *)controlExpression.get())->Value();

            for(int i = 0; i < values.size(); ++i)
            {
                curScope->Assign(pImpl->name->GetName(), values[i]);
                pImpl->body->Eval(curScope);
            }
        }
        else
        {
            RuntimeValue::RuntimeError("Control expression must be a list in for statement.", this);
        }

        return std::make_shared<NoneValue>();
    }
}
