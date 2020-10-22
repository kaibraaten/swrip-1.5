#ifndef _IMP_PARSER_SUITE_HPP_
#define _IMP_PARSER_SUITE_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Suite : public ImpSyntax
    {
    public:
        Suite(int n);
        ~Suite();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Suite> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
