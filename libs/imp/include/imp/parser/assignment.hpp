#ifndef _IMP_PARSER_ASSIGNMENT_HPP_
#define _IMP_PARSER_ASSIGNMENT_HPP_

#include <vector>
#include <memory>
#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class Name;
    class Expr;
    class Subscription;
    class RuntimeValue;
    class RuntimeScope;
    class Scanner;

    class Assignment : public SmallStmt
    {
    public:
        Assignment(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Assignment> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Name> name;
        std::shared_ptr<Expr> expr;
        std::vector<std::shared_ptr<Subscription>> subscriptions;
    };
}

#endif
