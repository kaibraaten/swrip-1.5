#ifndef _IMP_PARSER_EXPRSTMT_HPP_
#define _IMP_PARSER_EXPRSTMT_HPP_

#include <memory>
#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class Scanner;
    class Expr;
    class RuntimeValue;
    class RuntimeScope;

    class ExprStmt : public SmallStmt
    {
    public:
        ExprStmt(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<ExprStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Expr> expr;
    };
}

#endif
