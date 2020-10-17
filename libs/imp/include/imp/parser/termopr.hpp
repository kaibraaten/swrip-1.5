#ifndef _IMP_PARSER_TERMOPR_HPP_
#define _IMP_PARSER_TERMOPR_HPP_

#include <memory>
#include <iostream>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    enum class TokenKind;
    class Scanner;

    class TermOpr : public ImpSyntax
    {
    public:
        TermOpr(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<TermOpr> Parse(std::shared_ptr<Scanner> s);

        TokenKind opr;

    private:

    };
}

#endif
