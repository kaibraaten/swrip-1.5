#include "imp/parser/passstmt.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    PassStmt::PassStmt(int n)
        : SmallStmt(n)
    {

    }

    std::shared_ptr<RuntimeValue> PassStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }

    std::shared_ptr<PassStmt> PassStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto passStmt = std::make_shared<PassStmt>(s->CurLineNum());
        Skip(s, TokenKind::PassToken);
        return passStmt;
    }
}
