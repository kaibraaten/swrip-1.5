#include "imp/parser/noneliteral.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    NoneLiteral::NoneLiteral(int n)
        : Atom(n)
    {

    }

    std::shared_ptr<NoneLiteral> NoneLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto noneLiteral = std::make_shared<NoneLiteral>(s->CurLineNum());
        Skip(s, TokenKind::NoneToken);
        return noneLiteral;
    }

    std::shared_ptr<RuntimeValue> NoneLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
