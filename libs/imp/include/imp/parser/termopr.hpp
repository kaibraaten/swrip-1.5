#ifndef _IMP_PARSER_TERMOPR_HPP_
#define _IMP_PARSER_TERMOPR_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class TermOpr : public ImpSyntax
    {
    public:
        TermOpr(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<TermOpr> Parse(std::shared_ptr<Scanner> s);

        TokenKind opr;
    };
}

#endif
