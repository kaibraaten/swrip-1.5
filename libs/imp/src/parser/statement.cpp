#include "imp/parser/statement.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/compoundstmt.hpp"
#include "imp/parser/smallstmtlist.hpp"

namespace Imp
{
    Statement::Statement(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<Statement> Statement::Parse(std::shared_ptr<Scanner> s)
    {
        std::shared_ptr<Statement> stmt;

        switch(s->CurToken()->Kind())
        {
        case TokenKind::ForToken:
        case TokenKind::IfToken:
        case TokenKind::WhileToken:
        case TokenKind::DefToken:
            stmt = CompoundStmt::Parse(s);
            break;

        default:
            stmt = SmallStmtList::Parse(s);
            break;
        }

        return stmt;
    }
}
