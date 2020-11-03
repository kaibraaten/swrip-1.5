#ifndef _IMP_PARSER_EXPRSTMT_HPP_
#define _IMP_PARSER_EXPRSTMT_HPP_

#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class ExprStmt : public SmallStmt
    {
    public:
        ExprStmt(const std::string &scriptname, int n);
        ~ExprStmt();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<ExprStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
