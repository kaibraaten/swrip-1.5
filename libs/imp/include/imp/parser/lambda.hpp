#ifndef _IMP_PARSER_LAMBDA_HPP_
#define _IMP_PARSER_LAMBDA_HPP_

#include <iostream>
#include <list>
#include <memory>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Expr;
    class Name;
    class Scanner;

    class Lambda : public Atom
    {
    public:
        Lambda(int n);
        void PrettyPrint(std::ostream &out) override;
        static std::shared_ptr<Lambda> Parse(std::shared_ptr<Scanner> s);

    private:
        std::list<std::shared_ptr<Name>> formalParams;
        std::shared_ptr<Expr> body;
    };
}

#endif
