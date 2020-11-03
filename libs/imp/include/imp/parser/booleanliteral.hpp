#ifndef _IMP_PARSER_BOOLEANLITERAL_HPP_
#define _IMP_PARSER_BOOLEANLITERAL_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class BooleanLiteral : public Atom
    {
    public:
        BooleanLiteral(const std::string &scriptname, int n);
        ~BooleanLiteral();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<BooleanLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
