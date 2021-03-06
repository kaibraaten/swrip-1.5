#include "imp/parser/smallstmt.hpp"
#include "imp/parser/passstmt.hpp"
#include "imp/parser/returnstmt.hpp"
#include "imp/parser/assignment.hpp"
#include "imp/parser/exprstmt.hpp"
#include "imp/parser/fromstmt.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    SmallStmt::SmallStmt(const std::string &scriptname, int n)
        : ImpSyntax(scriptname, n)
    {

    }

    std::shared_ptr<SmallStmt> SmallStmt::Parse(std::shared_ptr<Scanner> s)
    {
        std::shared_ptr<SmallStmt> smallStmt;

        switch(s->CurToken()->Kind())
        {
        case TokenKind::PassToken:
            smallStmt = PassStmt::Parse(s);
            break;

        case TokenKind::ReturnToken:
            smallStmt = ReturnStmt::Parse(s);
            break;

        case TokenKind::FromToken:
            smallStmt = FromStmt::Parse(s);
            break;

        case TokenKind::NameToken:
            if(s->AnyEqualToken())
            {
                smallStmt = Assignment::Parse(s);
            }
            else
            {
                smallStmt = ExprStmt::Parse(s);
            }

            break;

        default:
            smallStmt = ExprStmt::Parse(s);
        }

        return smallStmt;
    }
}
