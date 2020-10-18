#ifndef _IMP_PARSER_PASSSTMT_HPP_
#define _IMP_PARSER_PASSSTMT_HPP_

#include <iostream>
#include <memory>
#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class Scanner;
    class RuntimeValue;
    class RuntimeScope;

    class PassStmt : public SmallStmt
    {
    public:
        PassStmt(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<PassStmt> Parse(std::shared_ptr<Scanner> s);
    };
}

#endif
