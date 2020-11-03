#ifndef _IMP_PARSER_INNEREXPR_HPP_
#define _IMP_PARSER_INNEREXPR_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class InnerExpr : public Atom
    {
    public:
        InnerExpr(const std::string &scriptname, int n);
        ~InnerExpr();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<InnerExpr> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
