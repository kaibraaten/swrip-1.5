#include "imp/parser/whilestmt.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/suite.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    WhileStmt::WhileStmt(int n)
        : CompoundStmt(n)
    {

    }

    void WhileStmt::PrettyPrint(std::ostream &out)
    {
        out << "while ";
        test->PrettyPrint(out);
        out << ":";
        body->PrettyPrint(out);
    }

    std::shared_ptr<RuntimeValue> WhileStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }

    std::shared_ptr<WhileStmt> WhileStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto aws = std::make_shared<WhileStmt>(s->CurLineNum());
        Skip(s, TokenKind::WhileToken);
        aws->test = Expr::Parse(s);
        Skip(s, TokenKind::ColonToken);
        aws->body = Suite::Parse(s);
        return aws;
    }
}
