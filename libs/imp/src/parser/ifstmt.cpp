#include <vector>
#include "imp/parser/ifstmt.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/suite.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    struct IfCheck
    {
        std::shared_ptr<Expr> test;
        std::shared_ptr<Suite> body;
    };

    struct IfStmt::Impl
    {
        std::vector<IfCheck> ifChecks;
        std::shared_ptr<Suite> elseBlock;
    };

    IfStmt::IfStmt(const std::string &scriptname, int n)
        : CompoundStmt(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    IfStmt::~IfStmt()
    {

    }

    std::shared_ptr<RuntimeValue> IfStmt::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        for(int i = 0; i < pImpl->ifChecks.size(); ++i)
        {
            const auto &ifCheck = pImpl->ifChecks[i];
            auto ifValue = ifCheck.test->Eval(curScope);
            bool expressionIsTrue = ifValue->GetBoolValue("if check", this);

            if(expressionIsTrue)
            {
                ifCheck.body->Eval(curScope);
                return std::make_shared<NoneValue>();
            }
        }

        if(pImpl->elseBlock != nullptr)
        {
            pImpl->elseBlock->Eval(curScope);
        }

        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<IfStmt> IfStmt::Parse(std::shared_ptr<Scanner> s)
    {
        auto ifStmt = std::make_shared<IfStmt>(s->ScriptName(), s->CurLineNum());
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
            ifStmt->pImpl->ifChecks.push_back(ifCheck);
        } while(s->CurToken()->Kind() == TokenKind::ElifToken);

        if(s->CurToken()->Kind() == TokenKind::ElseToken)
        {
            Skip(s, TokenKind::ElseToken);
            Skip(s, TokenKind::ColonToken);
            ifStmt->pImpl->elseBlock = Suite::Parse(s);
        }

        return ifStmt;
    }
}
