#ifndef _IMP_PARSER_TERM_HPP_
#define _IMP_PARSER_TERM_HPP_

#include <vector>
#include <memory>
#include <iostream>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Term : public ImpSyntax
    {
    public:
        Term(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<Term> Parse(std::shared_ptr<Scanner> s);

    private:
        struct FactorData
        {
            class Factor;
            class TermOpr;

            std::shared_ptr<Factor> factor;
            std::shared_ptr<TermOpr> termOpr;

            FactorData(std::shared_ptr<Factor> f)
            {
                factor = f;
            }

            FactorData()
            {

            }
        };

        std::vector<FactorData> factors;
    };
}

#endif
