#ifndef _IMP_PARSER_COMPOUND_STMT_HPP_
#define _IMP_PARSER_COMPOUND_STMT_HPP_

#include <imp/parser/statement.hpp> 

namespace Imp
{
    class CompoundStmt : public Statement
    {
    public:
        static std::shared_ptr<CompoundStmt> Parse(std::shared_ptr<Scanner> s);

    protected:
        CompoundStmt(const std::string &scriptname, int n);
    };
}

#endif
