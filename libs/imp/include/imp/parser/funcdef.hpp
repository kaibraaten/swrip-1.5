#ifndef _IMP_PARSER_FUNCDEF_HPP_
#define _IMP_PARSER_FUNCDEF_HPP_

#include <imp/parser/compoundstmt.hpp>

namespace Imp
{
    class FuncDef : public CompoundStmt
    {
    public:
        FuncDef(const std::string &scriptname, int n);
        ~FuncDef();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<FuncDef> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
