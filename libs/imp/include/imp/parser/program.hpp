#ifndef _IMP_PARSER_PROGRAM_HPP_
#define _IMP_PARSER_PROGRAM_HPP_

#include <memory>
#include <list>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Statement;
    class Scanner;
    class RuntimeValue;
    class RuntimeScope;

    class Program : public ImpSyntax
    {
    public:
        Program(int);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Program> Parse(std::shared_ptr<Scanner> s);

    private:
        std::list<std::shared_ptr<Statement>> stmts;
    };
}

#endif
