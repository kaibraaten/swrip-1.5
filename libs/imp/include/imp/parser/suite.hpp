#ifndef _IMP_PARSER_SUITE_HPP_
#define _IMP_PARSER_SUITE_HPP_

#include <memory>
#include <list>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class SmallStmtList;
    class Statement;
    class RuntimeValue;
    class RuntimeScope;
    class Scanner;

    class Suite : public ImpSyntax
    {
    public:
        Suite(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Suite> Parse(std::shared_ptr<Scanner> s);

    private:
        std::shared_ptr<SmallStmtList> smallStmtList;
        std::list<std::shared_ptr<Statement>> statements;
    };
}

#endif
