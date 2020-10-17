#ifndef _IMP_PARSER_INNEREXPR_HPP_
#define _IMP_PARSER_INNEREXPR_HPP_

#include <memory>
#include <iostream>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Expr;
    class Scanner;

    class InnerExpr : public Atom
    {
    public:
        InnerExpr(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<InnerExpr> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Expr> expr;
    };
}

#endif
