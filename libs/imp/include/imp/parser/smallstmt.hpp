#ifndef _IMP_PARSER_SMALLSTMT_HPP_
#define _IMP_PARSER_SMALLSTMT_HPP_

#include <memory>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Scanner;

    class SmallStmt : public ImpSyntax
    {
    public:
        static std::shared_ptr<SmallStmt> Parse(std::shared_ptr<Scanner> s);

    protected:
        SmallStmt(int n);
    };
}

#endif
