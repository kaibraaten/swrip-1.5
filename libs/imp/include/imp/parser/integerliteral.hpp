#ifndef _IMP_PARSER_INTEGERLITERAL_HPP_
#define _IMP_PARSER_INTEGERLITERAL_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class IntegerLiteral : public Atom
    {
    public:
        IntegerLiteral(int n);
        ~IntegerLiteral();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<IntegerLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
