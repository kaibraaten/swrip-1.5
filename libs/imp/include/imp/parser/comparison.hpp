#ifndef _IMP_PARSER_COMPARISON_HPP_
#define _IMP_PARSER_COMPARISON_HPP_

#include <memory>
#include <vector>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Scanner;
    class Term;
    class CompOpr;

    class Comparison : public ImpSyntax
    {
    public:
        Comparison(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Comparison> Parse(std::shared_ptr<Scanner> s);

    private:
        struct CompTerm
        {
            std::shared_ptr<Term> term;
            std::shared_ptr<CompOpr> compOpr;

            CompTerm(std::shared_ptr<Term> t)
            {
                term = t;
            }
        };

        std::vector<CompTerm> terms;
    };
}

#endif
