#ifndef _IMP_PARSER_FROMSTMT_HPP_
#define _IMP_PARSER_FROMSTMT_HPP_

#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class FromStmt : public SmallStmt
    {
    public:
        FromStmt(int n);
        ~FromStmt();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<FromStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
