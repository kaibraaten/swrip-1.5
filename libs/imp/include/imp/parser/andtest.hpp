#ifndef _IMP_PARSER_ANDTEST_HPP_
#define _IMP_PARSER_ANDTEST_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class AndTest : public ImpSyntax
    {
    public:
        AndTest(const std::string &scriptname, int n);
        ~AndTest();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<AndTest> Parse(std::shared_ptr<Scanner> s);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
