#ifndef _IMP_PARSER_NONELITERAL_HPP_
#define _IMP_PARSER_NONELITERAL_HPP_

#include <iostream>
#include <memory>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;

    class NoneLiteral : public Atom
    {
    public:
        NoneLiteral(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<NoneLiteral> Parse(std::shared_ptr<Scanner> s);
    };
}

#endif
