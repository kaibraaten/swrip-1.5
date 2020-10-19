#ifndef _IMP_PARSER_SMALLSTATEMENTLIST_HPP_
#define _IMP_PARSER_SMALLSTATEMENTLIST_HPP_

#include <list>
#include <memory>
#include <imp/parser/statement.hpp>

namespace Imp
{
    class SmallStmt;
    class RuntimeValue;
    class RuntimeScope;
    class Scanner;

    class SmallStmtList : public Statement
    {
    public:
        SmallStmtList(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<SmallStmtList> Parse(std::shared_ptr<Scanner> s);

    private:
        std::list<std::shared_ptr<SmallStmt>> smallStatements;
    };
}

#endif
