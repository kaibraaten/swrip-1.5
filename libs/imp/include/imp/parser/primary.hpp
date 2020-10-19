#ifndef _IMP_PARSER_PRIMARY_HPP_
#define _IMP_PARSER_PRIMARY_HPP_

#include <vector>
#include <memory>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Atom;
    class PrimarySuffix;
    class Scanner;
    class RuntimeValue;
    class RuntimeScope;

    class Primary : public ImpSyntax
    {
    public:
        Primary(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Primary> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<Atom> atom;
        std::vector<std::shared_ptr<PrimarySuffix>> suffices;
    };
}

#endif
