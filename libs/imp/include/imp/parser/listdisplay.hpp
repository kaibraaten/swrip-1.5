#ifndef _IMP_PARSER_LISTDISPLAY_HPP_
#define _IMP_PARSER_LISTDISPLAY_HPP_

#include <list>
#include <memory>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;
    class Expr;

    class ListDisplay : public Atom
    {
    public:
        ListDisplay(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<ListDisplay> Parse(std::shared_ptr<Scanner> s);

    private:
        std::list<std::shared_ptr<Expr>> exprs;
    };
}

#endif
