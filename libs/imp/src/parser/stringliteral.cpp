#include "imp/parser/stringliteral.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    struct StringLiteral::Impl
    {
        std::string Value;
    };

    StringLiteral::StringLiteral(int n)
        : Atom(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    StringLiteral::~StringLiteral()
    {

    }

    std::shared_ptr<StringLiteral> StringLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto stringLiteral = std::make_shared<StringLiteral>(s->CurLineNum());
        stringLiteral->pImpl->Value = s->CurToken()->StringLit();
        Skip(s, TokenKind::StringToken);
        return stringLiteral;
    }

    std::shared_ptr<RuntimeValue> StringLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<StringValue>(pImpl->Value);
    }
}
