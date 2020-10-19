#ifndef _IMP_PARSER_PRIMARYSUFFIX_HPP_
#define _IMP_PARSER_PRIMARYSUFFIX_HPP_

#include <memory>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    enum class TokenKind;
    class Scanner;

    class PrimarySuffix : public ImpSyntax
    {
    public:
        static std::shared_ptr<PrimarySuffix> Parse(std::shared_ptr<Scanner> s);

    protected:
        PrimarySuffix(int n);

    private:
        TokenKind bracketKind;
    };
}

#endif
