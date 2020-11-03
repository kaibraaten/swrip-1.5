#include "imp/parser/integerliteral.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/intvalue.hpp"

namespace Imp
{
    struct IntegerLiteral::Impl
    {
        int64_t Value = 0;
    };

    IntegerLiteral::IntegerLiteral(const std::string &scriptname, int n)
        : Atom(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    IntegerLiteral::~IntegerLiteral()
    {

    }

    std::shared_ptr<IntegerLiteral> IntegerLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto integerLiteral = std::make_shared<IntegerLiteral>(s->ScriptName(), s->CurLineNum());
        integerLiteral->pImpl->Value = s->CurToken()->IntegerLit();
        Skip(s, TokenKind::IntegerToken);
        return integerLiteral;
    }

    std::shared_ptr<RuntimeValue> IntegerLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<IntValue>(pImpl->Value);
    }
}
