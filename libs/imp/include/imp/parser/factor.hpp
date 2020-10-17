#ifndef _IMP_PARSER_FACTOR_HPP_
#define _IMP_PARSER_FACTOR_HPP_

#include <iostream>
#include <memory>
#include <vector>
#include "imp/parser/impsyntax.hpp"

namespace Imp
{
    class Scanner;
    class Primary;
    class FactorPrefix;
    class FactorOpr;

    class Factor : public ImpSyntax
    {
    public:
        Factor(int n);
        void PrettyPrint(std::ostream &out) override;
        static std::shared_ptr<Factor> Parse(std::shared_ptr<Scanner> s);

    private:
        struct PrimaryData
        {    
            std::shared_ptr<Primary> primary;
            std::shared_ptr<FactorPrefix> prefix;
            std::shared_ptr<FactorOpr> opr;
        };

        std::vector<PrimaryData> primaries;
    };
}

#endif
