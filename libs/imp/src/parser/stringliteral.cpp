#include "imp/parser/stringliteral.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    StringLiteral::StringLiteral(int n)
        : Atom(n)
    {

    }

    void StringLiteral::PrettyPrint(std::ostream &out)
    {
        out << strValue;
    }

    std::shared_ptr<StringLiteral> StringLiteral::Parse(std::shared_ptr<Scanner> s)
    {
        auto stringLiteral = std::make_shared<StringLiteral>(s->CurLineNum());
        stringLiteral->strValue = s->CurToken()->StringLit();
        Skip(s, TokenKind::StringToken);
        return stringLiteral;
    }
}
