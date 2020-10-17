#ifndef _IMP_PARSER_INTEGERLITERAL_HPP_
#define _IMP_PARSER_INTEGERLITERAL_HPP_

#include <iostream>
#include <memory>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;

    class IntegerLiteral : public Atom
    {
    public:
        IntegerLiteral(int n);
        void PrettyPrint(std::ostream &out) override;
        static std::shared_ptr<IntegerLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        long intValue = 0;
    };
}

#endif
