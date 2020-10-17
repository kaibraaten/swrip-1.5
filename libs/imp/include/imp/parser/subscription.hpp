#ifndef _IMP_PARSE_SUBSCRIPTION_HPP_
#define _IMP_PARSE_SUBSCRIPTION_HPP_

#include <memory>
#include <iostream>
#include <imp/parser/primarysuffix.hpp>

namespace Imp
{
    class Scanner;
    class Expr;

    class Subscription : public PrimarySuffix
    {
    public:
        Subscription(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Subscription> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Expr> expr;
    };
}

#endif
