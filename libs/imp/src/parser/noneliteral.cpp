#include "imp/parser/noneliteral.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    NoneLiteral::NoneLiteral(int n)
        : Atom(n)
    {

    }

    void NoneLiteral::PrettyPrint(std::ostream &out)
    {
        out << "None";
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
