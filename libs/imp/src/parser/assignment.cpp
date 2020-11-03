#include <vector>
#include "imp/parser/assignment.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/name.hpp"
#include "imp/parser/subscription.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    struct Assignment::Impl
    {
        std::shared_ptr<Name> name;
        std::shared_ptr<Expr> expr;
        std::vector<std::shared_ptr<Subscription>> subscriptions;
    };

    Assignment::Assignment(const std::string &scriptname, int n)
        : SmallStmt(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Assignment::~Assignment()
    {

    }

    std::shared_ptr<RuntimeValue> Assignment::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto result = pImpl->expr->Eval(curScope); // New value to store

        if(pImpl->subscriptions.empty())
        {
            std::string id = pImpl->name->GetName();
            curScope->Assign(id, result);
        }
        else
        {
            auto whereToAssign = pImpl->name->Eval(curScope); // The object to store in
            auto index = pImpl->subscriptions[0]->Eval(curScope); // Index in above object

            for(int i = 1; i < pImpl->subscriptions.size(); ++i)
            {
                whereToAssign = whereToAssign->EvalSubscription(index, this);
                index = pImpl->subscriptions[i]->Eval(curScope);
            }

            whereToAssign->EvalAssignElem(index, result, this); // Assign the new value
        }

        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<Assignment> Assignment::Parse(std::shared_ptr<Scanner> s)
    {
        auto assignment = std::make_shared<Assignment>(s->ScriptName(), s->CurLineNum());

        assignment->pImpl->name = Name::Parse(s);

        while(s->CurToken()->Kind() == TokenKind::LeftBracketToken)
        {
            assignment->pImpl->subscriptions.push_back(Subscription::Parse(s));
        }

        Skip(s, TokenKind::EqualToken);
        assignment->pImpl->expr = Expr::Parse(s);

        return assignment;
    }
}
