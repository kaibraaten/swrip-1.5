#ifndef _IMP_PARSER_FORSTMT_HPP_
#define _IMP_PARSER_FORSTMT_HPP_

#include <memory>
#include <imp/parser/compoundstmt.hpp>

namespace Imp
{
    class Scanner;
    class Name;
    class Expr;
    class Suite;
    class RuntimeValue;
    class RuntimeScope;

    class ForStmt : public CompoundStmt
    {
    public:
        ForStmt(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<ForStmt> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Name> name;
        std::shared_ptr<Expr> expr;
        std::shared_ptr<Suite> body;
    };
}

#endif
