#ifndef _IMP_PARSER_PRIMARYSUFFIX_HPP_
#define _IMP_PARSER_PRIMARYSUFFIX_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class PrimarySuffix : public ImpSyntax
    {
    public:
        ~PrimarySuffix();
        static std::shared_ptr<PrimarySuffix> Parse(std::shared_ptr<Scanner> s);
        TokenKind BracketKind() const;

    protected:
        PrimarySuffix(const std::string &scriptname, int n);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
