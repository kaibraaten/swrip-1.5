#ifndef _IMP_PARSER_PRIMARY_HPP_
#define _IMP_PARSER_PRIMARY_HPP_

#include <vector>
#include <memory>
#include <iostream>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Atom;
    class PrimarySuffix;
    class Scanner;

    class Primary : public ImpSyntax
    {
    public:
        Primary(int n);
        void PrettyPrint(std::ostream &out) override;
        static std::shared_ptr<Primary> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Atom> atom;
        std::vector<PrimarySuffix> suffices;
    };
}

#endif
