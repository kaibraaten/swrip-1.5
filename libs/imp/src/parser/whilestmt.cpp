#include "imp/parser/whilestmt.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/suite.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    struct WhileStmt::Impl
    {
        std::shared_ptr<Expr> test;
        std::shared_ptr<Suite> body;
    };

    WhileStmt::WhileStmt(const std::string &scriptname, int n)
        : CompoundStmt(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    WhileStmt::~WhileStmt()
    {

    }

    std::shared_ptr<RuntimeValue> WhileStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        while(pImpl->test->Eval(curScope)->GetBoolValue("while expression", this))
        {
            pImpl->body->Eval(curScope);
        }

        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<WhileStmt> WhileStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto aws = std::make_shared<WhileStmt>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::WhileToken);
        aws->pImpl->test = Expr::Parse(s);
        Skip(s, TokenKind::ColonToken);
        aws->pImpl->body = Suite::Parse(s);
        return aws;
    }
}
