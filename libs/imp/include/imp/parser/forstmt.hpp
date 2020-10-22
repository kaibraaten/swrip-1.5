#ifndef _IMP_PARSER_FORSTMT_HPP_
#define _IMP_PARSER_FORSTMT_HPP_

#include <imp/parser/compoundstmt.hpp>

namespace Imp
{
    class ForStmt : public CompoundStmt
    {
    public:
        ForStmt(int n);
        ~ForStmt();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<ForStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
