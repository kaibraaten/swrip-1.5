#ifndef _IMP_PARSER_ATOM_HPP_
#define _IMP_PARSER_ATOM_HPP_

#include <memory>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Scanner;

    class Atom : public ImpSyntax
    {
    public:
        Atom(int n);
        static std::shared_ptr<Atom> Parse(std::shared_ptr<Scanner> s);
    };
}

#endif
