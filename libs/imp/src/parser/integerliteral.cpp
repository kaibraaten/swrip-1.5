#include "imp/parser/integerliteral.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/intvalue.hpp"

namespace Imp
{
    IntegerLiteral::IntegerLiteral(int n)
        : Atom(n)
    {

    }

    std::shared_ptr<IntegerLiteral> IntegerLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto integerLiteral = std::make_shared<IntegerLiteral>(s->CurLineNum());
        integerLiteral->_Value = s->CurToken()->IntegerLit();
        Skip(s, TokenKind::IntegerToken);
        return integerLiteral;
    }

    std::shared_ptr<RuntimeValue> IntegerLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return std::make_shared<IntValue>(_Value);
    }
}
