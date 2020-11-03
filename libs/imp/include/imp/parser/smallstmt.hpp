#ifndef _IMP_PARSER_SMALLSTMT_HPP_
#define _IMP_PARSER_SMALLSTMT_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class SmallStmt : public ImpSyntax
    {
    public:
        static std::shared_ptr<SmallStmt> Parse(std::shared_ptr<Scanner> s);

    protected:
        SmallStmt(const std::string &scriptname, int n);
    };
}

#endif
