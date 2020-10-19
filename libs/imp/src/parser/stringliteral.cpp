#include "imp/parser/stringliteral.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    StringLiteral::StringLiteral(int n)
        : Atom(n)
    {

    }

    std::shared_ptr<StringLiteral> StringLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto stringLiteral = std::make_shared<StringLiteral>(s->CurLineNum());
        stringLiteral->strValue = s->CurToken()->StringLit();
        Skip(s, TokenKind::StringToken);
        return stringLiteral;
    }

    std::shared_ptr<RuntimeValue> StringLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
