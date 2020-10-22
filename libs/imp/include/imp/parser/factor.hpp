#ifndef _IMP_PARSER_FACTOR_HPP_
#define _IMP_PARSER_FACTOR_HPP_

#include "imp/parser/impsyntax.hpp"

namespace Imp
{
    class Factor : public ImpSyntax
    {
    public:
        Factor(int n);
        ~Factor();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Factor> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
