#include <vector>
#include "imp/parser/smallstmtlist.hpp"
#include "imp/parser/smallstmt.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    struct SmallStmtList::Impl
    {
        std::list<std::shared_ptr<SmallStmt>> smallStatements;
    };

    SmallStmtList::SmallStmtList(int n)
        : Statement(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    SmallStmtList::~SmallStmtList()
    {

    }

    std::shared_ptr<RuntimeValue> SmallStmtList::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        for(auto statement : pImpl->smallStatements)
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
            smallStmtList->pImpl->smallStatements.push_back(SmallStmt::Parse(s));

            if(s->CurToken()->Kind() != TokenKind::SemicolonToken)
                break;

            Skip(s, TokenKind::SemicolonToken);
        }

        Skip(s, TokenKind::NewLineToken);
        return smallStmtList;
    }
}
