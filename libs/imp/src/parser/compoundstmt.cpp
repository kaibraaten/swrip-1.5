#include "imp/parser/compoundstmt.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/forstmt.hpp"
#include "imp/parser/ifstmt.hpp"
#include "imp/parser/whilestmt.hpp"
#include "imp/parser/funcdef.hpp"

namespace Imp
{
    CompoundStmt::CompoundStmt(int n)
        : Statement(n)
    {

    }

    std::shared_ptr<CompoundStmt> CompoundStmt::Parse(std::shared_ptr<Scanner> s)
    {
        std::shared_ptr<CompoundStmt> compoundStmt;

        switch(s->CurToken()->Kind())
        {
        case TokenKind::ForToken:
            compoundStmt = ForStmt::Parse(s);
            break;

        case TokenKind::IfToken:
            compoundStmt = IfStmt::Parse(s);
            break;

        case TokenKind::WhileToken:
            compoundStmt = WhileStmt::Parse(s);
            break;

        case TokenKind::DefToken:
            compoundStmt = FuncDef::Parse(s);
            break;

        default:
            ParserError("Expected a compound statement but found a " +
                        TokenName(s->CurToken()->Kind()) + "!", s->CurLineNum());
            break;
        }

        return compoundStmt;
    }
}
