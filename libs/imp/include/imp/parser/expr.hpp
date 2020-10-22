#ifndef _IMP_PARSER_EXPR_HPP_
#define _IMP_PARSER_EXPR_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Expr : public ImpSyntax
    {
    public:
        Expr(int n);
        ~Expr();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Expr> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
