#ifndef _IMP_PARSER_IFSTMT_HPP_
#define _IMP_PARSER_IFSTMT_HPP_

#include <imp/parser/compoundstmt.hpp>

namespace Imp
{
    class IfStmt : public CompoundStmt
    {
    public:
        IfStmt(int n);
        ~IfStmt();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<IfStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
