#ifndef _IMP_PARSER_RETURNSTMT_HPP_
#define _IMP_PARSER_RETURNSTMT_HPP_

#include <iostream>
#include <memory>
#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class Scanner;
    class Expr;
    class RuntimeValue;
    class RuntimeScope;

    class ReturnStmt : public SmallStmt
    {
    public:
        ReturnStmt(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<ReturnStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Expr> returnExpr;
    };
}

#endif
