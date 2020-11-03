#ifndef _IMP_PARSER_LAMBDA_HPP_
#define _IMP_PARSER_LAMBDA_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class Lambda : public Atom
    {
    public:
        Lambda(const std::string &scriptname, int n);
        ~Lambda();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Lambda> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
