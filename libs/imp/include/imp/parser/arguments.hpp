#ifndef _IMP_PARSE_ARGUMENTS_HPP_
#define _IMP_PARSE_ARGUMENTS_HPP_

#include <imp/parser/primarysuffix.hpp>

namespace Imp
{
    class Arguments : public PrimarySuffix
    {
    public:
        Arguments(const std::string &scriptname, int n);
        ~Arguments();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Arguments> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
