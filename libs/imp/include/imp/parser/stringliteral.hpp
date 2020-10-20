#ifndef _IMP_PARSER_STRINGLITERAL_HPP_
#define _IMP_PARSER_STRINGLITERAL_HPP_

#include <memory>
#include <string>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;

    class StringLiteral : public Atom
    {
    public:
        StringLiteral(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<StringLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        std::string _Value;
    };
}

#endif
