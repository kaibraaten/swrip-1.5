#ifndef _IMP_PARSE_SUBSCRIPTION_HPP_
#define _IMP_PARSE_SUBSCRIPTION_HPP_

#include <imp/parser/primarysuffix.hpp>

namespace Imp
{
    class Subscription : public PrimarySuffix
    {
    public:
        Subscription(const std::string &scriptname, int n);
        ~Subscription();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Subscription> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
