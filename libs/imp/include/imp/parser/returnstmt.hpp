#ifndef _IMP_PARSER_RETURNSTMT_HPP_
#define _IMP_PARSER_RETURNSTMT_HPP_

#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class ReturnStmt : public SmallStmt
    {
    public:
        ReturnStmt(int n);
        ~ReturnStmt();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<ReturnStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
