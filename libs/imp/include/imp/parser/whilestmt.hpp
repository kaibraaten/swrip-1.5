#ifndef _IMP_PARSER_WHILESTMT_HPP_
#define _IMP_PARSER_WHILESTMT_HPP_

#include <imp/parser/compoundstmt.hpp>

namespace Imp
{
    class WhileStmt : public CompoundStmt
    {
    public:
        WhileStmt(int n);
        ~WhileStmt();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<WhileStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
