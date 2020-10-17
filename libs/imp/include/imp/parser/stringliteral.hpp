#ifndef _IMP_PARSER_STRINGLITERAL_HPP_
#define _IMP_PARSER_STRINGLITERAL_HPP_

#include <iostream>
#include <memory>
#include <string>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;

    class StringLiteral : public Atom
    {
    public:
        StringLiteral(int n);
        void PrettyPrint(std::ostream &out) override;
        static std::shared_ptr<StringLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        std::string strValue;
    };
}

#endif
