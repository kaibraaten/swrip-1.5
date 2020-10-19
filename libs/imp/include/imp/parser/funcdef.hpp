#ifndef _IMP_PARSER_FUNCDEF_HPP_
#define _IMP_PARSER_FUNCDEF_HPP_

#include <memory>
#include <vector>
#include <imp/parser/compoundstmt.hpp>

namespace Imp
{
    class Scanner;
    class Name;
    class Suite;
    class RuntimeValue;
    class RuntimeScope;

    class FuncDef : public CompoundStmt
    {
    public:
        FuncDef(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<FuncDef> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Name> name;
        std::shared_ptr<Suite> body;
        std::vector<std::shared_ptr<Name>> arguments;
    };
}

#endif
