#include "imp/parser/passstmt.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    PassStmt::PassStmt(int n)
        : SmallStmt(n)
    {

    }

    void PassStmt::PrettyPrint(std::ostream &out)
    {
        out << TokenName(TokenKind::PassToken);
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
