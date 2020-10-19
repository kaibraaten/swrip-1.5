#ifndef _IMP_PARSE_ARGUMENTS_HPP_
#define _IMP_PARSE_ARGUMENTS_HPP_

#include <vector>
#include <memory>
#include <imp/parser/primarysuffix.hpp>

namespace Imp
{
    class Scanner;
    class Expr;

    class Arguments : public PrimarySuffix
    {
    public:
        Arguments(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Arguments> Parse(std::shared_ptr<Scanner> s);

    private:
        std::vector<std::shared_ptr<Expr>> exprs;
    };
}

#endif
