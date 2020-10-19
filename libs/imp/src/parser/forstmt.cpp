#include "imp/parser/forstmt.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/name.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/suite.hpp"

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
        return nullptr;
    }
}
