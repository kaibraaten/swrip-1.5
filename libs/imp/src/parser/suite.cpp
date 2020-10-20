#include "imp/parser/suite.hpp"
#include "imp/parser/smallstmtlist.hpp"
#include "imp/parser/smallstmt.hpp"
#include "imp/parser/statement.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    Suite::Suite(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<RuntimeValue> Suite::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        if(smallStmtList != nullptr)
        {
            smallStmtList->Eval(curScope);
        }
        else
        {
            for(auto stmt : statements)
            {
                stmt->Eval(curScope);
            }
        }

        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<Suite> Suite::Parse(std::shared_ptr<Scanner> s)
    {
        auto suite = std::make_shared<Suite>(s->CurLineNum());

        if(s->CurToken()->Kind() == TokenKind::NewLineToken)
        {
            Skip(s, TokenKind::NewLineToken);
            Skip(s, TokenKind::IndentToken);

            do
            {
                suite->statements.push_back(Statement::Parse(s));
            } while(s->CurToken()->Kind() != TokenKind::DedentToken);

            Skip(s, TokenKind::DedentToken);
        }
        else
        {
            suite->smallStmtList = SmallStmtList::Parse(s);
        }

        return suite;
    }
}
