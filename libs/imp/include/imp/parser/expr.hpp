#ifndef _IMP_PARSER_EXPR_HPP_
#define _IMP_PARSER_EXPR_HPP_

#include <vector>
#include <memory>
#include <iostream>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class AndTest;
    class Scanner;

    class Expr : public ImpSyntax
    {
    public:
        Expr(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Expr> Parse(std::shared_ptr<Scanner> s);

    private:
        std::vector<std::shared_ptr<AndTest>> andTests;
    };
}

#endif
