#ifndef _IMP_PARSER_FACTOROPR_HPP_
#define _IMP_PARSER_FACTOROPR_HPP_

#include <iostream>
#include <memory>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Scanner;
    enum class TokenKind;

    class FactorOpr : public ImpSyntax
    {
    public:
        FactorOpr(int n);
        void PrettyPrint(std::ostream &out) override;
        static std::shared_ptr<FactorOpr> Parse(std::shared_ptr<Scanner> s);

        TokenKind opr;
    };
}

#endif
