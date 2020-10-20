#ifndef _IMP_PARSER_BOOLEANLITERAL_HPP_
#define _IMP_PARSER_BOOLEANLITERAL_HPP_

#include <memory>
#include <imp/parser/atom.hpp>

namespace Imp
{
    class Scanner;

    class BooleanLiteral : public Atom
    {
    public:
        BooleanLiteral(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<BooleanLiteral> Parse(std::shared_ptr<Scanner> s);

    private:
        bool _Value = false;
    };
}

#endif
