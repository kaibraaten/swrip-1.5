#include "imp/parser/atom.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/booleanliteral.hpp"
#include "imp/parser/floatliteral.hpp"
#include "imp/parser/integerliteral.hpp"
#include "imp/parser/dictdisplay.hpp"
#include "imp/parser/listdisplay.hpp"
#include "imp/parser/innerexpr.hpp"
#include "imp/parser/name.hpp"
#include "imp/parser/noneliteral.hpp"
#include "imp/parser/stringliteral.hpp"
#include "imp/parser/lambda.hpp"

namespace Imp
{
    Atom::Atom(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<Atom> Atom::Parse(std::shared_ptr<Scanner> s)
    {
        std::shared_ptr<Atom> aa;

        switch(s->CurToken()->Kind())
        {
        case TokenKind::FalseToken:
        case TokenKind::TrueToken:
            aa = BooleanLiteral::Parse(s);
            break;

        case TokenKind::FloatToken:
            aa = FloatLiteral::Parse(s);
            break;

        case TokenKind::IntegerToken:
            aa = IntegerLiteral::Parse(s);
            break;

        case TokenKind::LeftBraceToken:
            aa = DictDisplay::Parse(s);
            break;

        case TokenKind::LeftBracketToken:
            aa = ListDisplay::Parse(s);
            break;

        case TokenKind::LeftParToken:
            aa = InnerExpr::Parse(s);
            break;

        case TokenKind::NameToken:
            aa = Name::Parse(s);
            break;

        case TokenKind::NoneToken:
            aa = NoneLiteral::Parse(s);
            break;

        case TokenKind::StringToken:
            aa = StringLiteral::Parse(s);
            break;

        case TokenKind::LambdaToken:
            aa = Lambda::Parse(s);
            break;

        default:
            ParserError("Expected an expression atom but found a " + TokenName(s->CurToken()->Kind()) + "!", s->CurLineNum());
        }

        return aa;
    }
}
