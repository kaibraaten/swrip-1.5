#ifndef _IMP_PARSER_ATOM_HPP_
#define _IMP_PARSER_ATOM_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Atom : public ImpSyntax
    {
    public:
        static std::shared_ptr<Atom> Parse(std::shared_ptr<Scanner> s);

    protected:
        Atom(int n);
    };
}

#endif
