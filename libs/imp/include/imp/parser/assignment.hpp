#ifndef _IMP_PARSER_ASSIGNMENT_HPP_
#define _IMP_PARSER_ASSIGNMENT_HPP_

#include <imp/parser/smallstmt.hpp>

namespace Imp
{
    class Assignment : public SmallStmt
    {
    public:
        Assignment(const std::string &scriptname, int n);
        ~Assignment();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<Assignment> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
