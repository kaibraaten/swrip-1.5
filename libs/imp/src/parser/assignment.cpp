#include "imp/parser/assignment.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/name.hpp"
#include "imp/parser/subscription.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    Assignment::Assignment(int n)
        : SmallStmt(n)
    {

    }

    std::shared_ptr<RuntimeValue> Assignment::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
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
