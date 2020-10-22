#ifndef _IMP_PARSER_COMPARISON_HPP_
#define _IMP_PARSER_COMPARISON_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Comparison : public ImpSyntax
    {
    public:
        Comparison(int n);
        ~Comparison();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Comparison> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
