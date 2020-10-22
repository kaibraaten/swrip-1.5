#ifndef _IMP_PARSER_PROGRAM_HPP_
#define _IMP_PARSER_PROGRAM_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Program : public ImpSyntax
    {
    public:
        Program(int);
        ~Program();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Program> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
