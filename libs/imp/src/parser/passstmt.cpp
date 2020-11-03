#include "imp/parser/passstmt.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    PassStmt::PassStmt(const std::string &scriptname, int n)
        : SmallStmt(scriptname, n)
    {

    }

    std::shared_ptr<RuntimeValue> PassStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<PassStmt> PassStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto passStmt = std::make_shared<PassStmt>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::PassToken);
        return passStmt;
    }
}
