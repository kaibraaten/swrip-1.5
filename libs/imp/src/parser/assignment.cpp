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
    Assignment::Assignment(int n)
        : SmallStmt(n)
    {

    }

    std::shared_ptr<RuntimeValue> Assignment::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto result = expr->Eval(curScope); // New value to store

        if(subscriptions.empty())
        {
            std::string id = name->GetName();
            curScope->Assign(id, result);
        }
        else
        {
            auto whereToAssign = name->Eval(curScope); // The object to store in
            auto index = subscriptions[0]->Eval(curScope); // Index in above object

            for(int i = 1; i < subscriptions.size(); ++i)
            {
                whereToAssign = whereToAssign->EvalSubscription(index, this);
                index = subscriptions[i]->Eval(curScope);
            }

            whereToAssign->EvalAssignElem(index, result, this); // Assign the new value
        }

        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<Assignment> Assignment::Parse(std::shared_ptr<Scanner> s)
    {
        auto assignment = std::make_shared<Assignment>(s->CurLineNum());

        assignment->name = Name::Parse(s);

        while(s->CurToken()->Kind() == TokenKind::LeftBracketToken)
        {
            assignment->subscriptions.push_back(Subscription::Parse(s));
        }

        Skip(s, TokenKind::EqualToken);
        assignment->expr = Expr::Parse(s);

        return assignment;
    }
}
