#include "imp/parser/ifstmt.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/suite.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    IfStmt::IfStmt(int n)
        : CompoundStmt(n)
    {

    }

    void IfStmt::PrettyPrint(std::ostream &out)
    {
        for(int i = 0; i < ifChecks.size(); ++i)
        {
            const IfCheck &ifCheck = ifChecks[i];

            if(i == 0)
            {
                out << "if ";
            }
            else
            {
                out << "elif ";
            }

            ifCheck.test->PrettyPrint(out);

            out << ": ";
            ifCheck.body->PrettyPrint(out);
        }

        if(elseBlock != nullptr)
        {
            out << "else: ";
            elseBlock->PrettyPrint(out);
        }
    }

    std::shared_ptr<RuntimeValue> IfStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }

    std::shared_ptr<IfStmt> IfStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto ifStmt = std::make_shared<IfStmt>(s->CurLineNum());
        Skip(s, TokenKind::IfToken);

        do
        {
            if(s->CurToken()->Kind() == TokenKind::ElifToken)
            {
                Skip(s, TokenKind::ElifToken);
            }

            IfCheck ifCheck;
            ifCheck.test = Expr::Parse(s);
            Skip(s, TokenKind::ColonToken);
            ifCheck.body = Suite::Parse(s);
            ifStmt->ifChecks.push_back(ifCheck);
        } while(s->CurToken()->Kind() == TokenKind::ElifToken);

        if(s->CurToken()->Kind() == TokenKind::ElseToken)
        {
            Skip(s, TokenKind::ElseToken);
            Skip(s, TokenKind::ColonToken);
            ifStmt->elseBlock = Suite::Parse(s);
        }


        return ifStmt;
    }
}
