#ifndef _IMP_PARSER_DICTDISPLAY_HPP_
#define _IMP_PARSER_DICTDISPLAY_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class DictDisplay : public Atom
    {
    public:
        DictDisplay(int n);
        ~DictDisplay();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<DictDisplay> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
