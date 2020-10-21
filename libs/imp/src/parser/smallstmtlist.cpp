#include "imp/parser/smallstmtlist.hpp"
#include "imp/parser/smallstmt.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    SmallStmtList::SmallStmtList(int n)
        : Statement(n)
    {

    }

    std::shared_ptr<RuntimeValue> SmallStmtList::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        for(auto statement : smallStatements)
        {
            statement->Eval(curScope);
        }

        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<SmallStmtList> SmallStmtList::Parse(std::shared_ptr<Scanner> s)
    {
        auto smallStmtList = std::make_shared<SmallStmtList>(s->CurLineNum());

        while(s->CurToken()->Kind() != TokenKind::NewLineToken)
        {
            smallStmtList->smallStatements.push_back(SmallStmt::Parse(s));

            if(s->CurToken()->Kind() != TokenKind::SemicolonToken)
                break;

            Skip(s, TokenKind::SemicolonToken);
        }

        Skip(s, TokenKind::NewLineToken);
        return smallStmtList;
    }
}