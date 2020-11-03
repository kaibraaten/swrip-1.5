#ifndef _IMP_PARSER_PRIMARY_HPP_
#define _IMP_PARSER_PRIMARY_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Primary : public ImpSyntax
    {
    public:
        Primary(const std::string &scriptname, int n);
        ~Primary();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Primary> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
