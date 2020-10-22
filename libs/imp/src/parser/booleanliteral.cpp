#include "imp/parser/booleanliteral.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/boolvalue.hpp"

namespace Imp
{
    struct BooleanLiteral::Impl
    {
        bool Value = false;
    };

    BooleanLiteral::BooleanLiteral(int n)
        : Atom(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    BooleanLiteral::~BooleanLiteral()
    {

    }

    std::shared_ptr<BooleanLiteral> BooleanLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto booleanLiteral = std::make_shared<BooleanLiteral>(s->CurLineNum());
        booleanLiteral->pImpl->Value = s->CurToken()->Kind() == TokenKind::TrueToken;
        Skip(s, s->CurToken()->Kind());
        return booleanLiteral;
    }

    std::shared_ptr<RuntimeValue> BooleanLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<BoolValue>(pImpl->Value);
    }
}
