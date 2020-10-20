#ifndef _IMP_PARSER_NAME_HPP_
#define _IMP_PARSER_NAME_HPP_

#include <memory>
#include <string>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;

    class Name : public Atom
    {
    public:
        Name(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Name> Parse(std::shared_ptr<Scanner> s);
        std::string GetName() const;

    private:
        std::string _Name;
    };
}

#endif
