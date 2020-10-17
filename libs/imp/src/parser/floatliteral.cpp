#include "imp/parser/floatliteral.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    FloatLiteral::FloatLiteral(int n)
        : Atom(n)
    {

    }

    void FloatLiteral::PrettyPrint(std::ostream &out)
    {
        out << floatValue;
    }

    std::shared_ptr<FloatLiteral> FloatLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto floatLiteral = std::make_shared<FloatLiteral>(s->CurLineNum());
        floatLiteral->floatValue = s->CurToken()->FloatLit();
        Skip(s, TokenKind::FloatToken);
        return floatLiteral;
    }
}
