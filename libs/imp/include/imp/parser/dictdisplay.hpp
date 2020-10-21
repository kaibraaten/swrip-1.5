#ifndef _IMP_PARSER_DICTDISPLAY_HPP_
#define _IMP_PARSER_DICTDISPLAY_HPP_

#include <memory>
#include <utility>
#include <list>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class StringLiteral;
    class Expr;
    class Scanner;

    class DictDisplay : public Atom
    {
    public:
        DictDisplay(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<DictDisplay> Parse(std::shared_ptr<Scanner> s);

    private:
        std::list<std::pair<std::shared_ptr<StringLiteral>, std::shared_ptr<Expr>>> elements;
    };
}

#endif