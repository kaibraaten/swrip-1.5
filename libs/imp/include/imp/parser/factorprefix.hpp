#ifndef _IMP_PARSER_FACTORPREFIX_HPP_
#define _IMP_PARSER_FACTORPREFIX_HPP_

#include <memory>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    enum class TokenKind;
    class Scanner;

    class FactorPrefix : public ImpSyntax
    {
    public:
        FactorPrefix(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<FactorPrefix> Parse(std::shared_ptr<Scanner> s);

        TokenKind opr;
    };
}

#endif
