#ifndef _IMP_PARSER_COMPARISON_HPP_
#define _IMP_PARSER_COMPARISON_HPP_

#include <memory>
#include <iostream>
#include <vector>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Scanner;

    class Comparison : public ImpSyntax
    {
    public:
        Comparison(int n);
        void PrettyPrint(std::ostream &out);

        static std::shared_ptr<Comparison> Parse(std::shared_ptr<Scanner> s);

    private:
        class Term;
        class CompOpr;

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
