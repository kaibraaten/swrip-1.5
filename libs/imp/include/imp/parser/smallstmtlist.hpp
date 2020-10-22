#ifndef _IMP_PARSER_SMALLSTATEMENTLIST_HPP_
#define _IMP_PARSER_SMALLSTATEMENTLIST_HPP_

#include <imp/parser/statement.hpp>

namespace Imp
{
    class SmallStmtList : public Statement
    {
    public:
        SmallStmtList(int n);
        ~SmallStmtList();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<SmallStmtList> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
