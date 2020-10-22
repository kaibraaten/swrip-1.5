#include "imp/parser/integerliteral.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/intvalue.hpp"

namespace Imp
{
    struct IntegerLiteral::Impl
    {
        long Value = 0;
    };

    IntegerLiteral::IntegerLiteral(int n)
        : Atom(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    IntegerLiteral::~IntegerLiteral()
    {

    }

    std::shared_ptr<IntegerLiteral> IntegerLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto integerLiteral = std::make_shared<IntegerLiteral>(s->CurLineNum());
        integerLiteral->pImpl->Value = s->CurToken()->IntegerLit();
        Skip(s, TokenKind::IntegerToken);
        return integerLiteral;
    }

    std::shared_ptr<RuntimeValue> IntegerLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<IntValue>(pImpl->Value);
    }
}
