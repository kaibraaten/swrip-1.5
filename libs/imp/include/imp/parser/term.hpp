#ifndef _IMP_PARSER_TERM_HPP_
#define _IMP_PARSER_TERM_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Term : public ImpSyntax
    {
    public:
        Term(int n);
        ~Term();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Term> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
