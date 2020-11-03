#ifndef _IMP_PARSER_FACTOROPR_HPP_
#define _IMP_PARSER_FACTOROPR_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class FactorOpr : public ImpSyntax
    {
    public:
        FactorOpr(const std::string &scriptname, int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<FactorOpr> Parse(std::shared_ptr<Scanner> s);

        TokenKind opr;
    };
}

#endif
