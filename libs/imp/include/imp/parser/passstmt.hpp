#ifndef _IMP_PARSER_PASSSTMT_HPP_
#define _IMP_PARSER_PASSSTMT_HPP_

#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class PassStmt : public SmallStmt
    {
    public:
        PassStmt(const std::string &scriptname, int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<PassStmt> Parse(std::shared_ptr<Scanner> s);
    };
}

#endif
