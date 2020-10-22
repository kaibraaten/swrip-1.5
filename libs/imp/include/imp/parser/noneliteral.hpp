#ifndef _IMP_PARSER_NONELITERAL_HPP_
#define _IMP_PARSER_NONELITERAL_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class NoneLiteral : public Atom
    {
    public:
        NoneLiteral(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<NoneLiteral> Parse(std::shared_ptr<Scanner> s);
    };
}

#endif
