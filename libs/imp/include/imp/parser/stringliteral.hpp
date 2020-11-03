#ifndef _IMP_PARSER_STRINGLITERAL_HPP_
#define _IMP_PARSER_STRINGLITERAL_HPP_

#include <imp/parser/atom.hpp>

namespace Imp
{
    class StringLiteral : public Atom
    {
    public:
        StringLiteral(const std::string &scriptname, int n);
        ~StringLiteral();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<StringLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
