#ifndef _IMP_PARSER_IFSTMT_HPP_
#define _IMP_PARSER_IFSTMT_HPP_

#include <iostream>
#include <memory>
#include <vector>
#include <imp/parser/compoundstmt.hpp>

namespace Imp
{
    class Scanner;
    class Expr;
    class Suite;
    class RuntimeValue;
    class RuntimeScope;

    class IfStmt : public CompoundStmt
    {
    public:
        IfStmt(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<IfStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        struct IfCheck
        {
            std::shared_ptr<Expr> test;
            std::shared_ptr<Suite> body;
        };

        std::vector<IfCheck> ifChecks;
        std::shared_ptr<Suite> elseBlock;
    };
}

#endif
