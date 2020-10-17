#ifndef _IMP_PARSER_NAME_HPP_
#define _IMP_PARSER_NAME_HPP_

#include <memory>
#include <iostream>
#include <string>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;

    class Name : public Atom
    {
    public:
        Name(int n);
        void PrettyPrint(std::ostream &out) override;
        static std::shared_ptr<Name> Parse(std::shared_ptr<Scanner> s);

    private:
        std::string name;
    };
}

#endif
