#include "imp/parser/floatliteral.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    FloatLiteral::FloatLiteral(int n)
        : Atom(n)
    {

    }

    std::shared_ptr<FloatLiteral> FloatLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto floatLiteral = std::make_shared<FloatLiteral>(s->CurLineNum());
        floatLiteral->floatValue = s->CurToken()->FloatLit();
        Skip(s, TokenKind::FloatToken);
        return floatLiteral;
    }

    std::shared_ptr<RuntimeValue> FloatLiteral::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
