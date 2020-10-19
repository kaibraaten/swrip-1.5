#ifndef _IMP_PARSER_WHILESTMT_HPP_
#define _IMP_PARSER_WHILESTMT_HPP_

#include <memory>
#include <imp/parser/compoundstmt.hpp>

namespace Imp
{
    class Scanner;
    class Expr;
    class Suite;
    class RuntimeValue;
    class RuntimeScope;

    class WhileStmt : public CompoundStmt
    {
    public:
        WhileStmt(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<WhileStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Expr> test;
        std::shared_ptr<Suite> body;
    };
}

#endif
