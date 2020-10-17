#ifndef _IMP_PARSER_STATEMENT_HPP_
#define _IMP_PARSER_STATEMENT_HPP_

#include <memory>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Scanner;

    class Statement : public ImpSyntax
    {
    public:
        Statement(int n);
        static std::shared_ptr<Statement> Parse(std::shared_ptr<Scanner> s);

    private:

    };
}

#endif
