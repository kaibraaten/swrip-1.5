#ifndef _IMP_PARSER_NAME_HPP_
#define _IMP_PARSER_NAME_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class Name : public Atom
    {
    public:
        Name(const std::string &scriptname, int n);
        ~Name();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Name> Parse(std::shared_ptr<Scanner> s);
        std::string GetName() const;

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
