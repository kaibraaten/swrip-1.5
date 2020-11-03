#ifndef _IMP_PARSER_COMPOPR_HPP_
#define _IMP_PARSER_COMPOPR_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class CompOpr : public ImpSyntax
    {
    public:
        CompOpr(const std::string &scriptname, int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<CompOpr> Parse(std::shared_ptr<Scanner> s);

        TokenKind opr;
    };
}

#endif
