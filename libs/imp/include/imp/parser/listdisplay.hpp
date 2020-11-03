#ifndef _IMP_PARSER_LISTDISPLAY_HPP_
#define _IMP_PARSER_LISTDISPLAY_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class ListDisplay : public Atom
    {
    public:
        ListDisplay(const std::string &scriptname, int n);
        ~ListDisplay();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<ListDisplay> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
