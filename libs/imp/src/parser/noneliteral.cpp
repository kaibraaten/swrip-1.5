#include "imp/parser/noneliteral.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    NoneLiteral::NoneLiteral(const std::string &scriptname, int n)
        : Atom(scriptname, n)
    {

    }

    std::shared_ptr<NoneLiteral> NoneLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto noneLiteral = std::make_shared<NoneLiteral>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::NoneToken);
        return noneLiteral;
    }

    std::shared_ptr<RuntimeValue> NoneLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<NoneValue>();
    }
}
