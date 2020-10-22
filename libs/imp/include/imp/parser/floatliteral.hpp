#ifndef _IMP_PARSER_FLOATLITERAL_HPP_
#define _IMP_PARSER_FLOATLITERAL_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class FloatLiteral : public Atom
    {
    public:
        FloatLiteral(int n);
        ~FloatLiteral();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<FloatLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
