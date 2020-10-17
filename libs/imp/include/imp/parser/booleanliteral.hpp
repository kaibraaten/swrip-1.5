#ifndef _IMP_PARSER_BOOLEANLITERAL_HPP_
#define _IMP_PARSER_BOOLEANLITERAL_HPP_

#include <iostream>
#include <memory>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;

    class BooleanLiteral : public Atom
    {
    public:
        BooleanLiteral(int n);
        void PrettyPrint(std::ostream &out) override;
        static std::shared_ptr<BooleanLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        bool boolValue = false;
    };
}

#endif
