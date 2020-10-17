#ifndef _IMP_PARSER_ANDTEST_HPP_
#define _IMP_PARSER_ANDTEST_HPP_

#include <vector>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class NotTest;

    class AndTest : public ImpSyntax
    {
    public:
        AndTest(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<AndTest> Parse(std::shared_ptr<Scanner> s);

    private:
        std::vector<std::shared_ptr<NotTest>> NotTests;
    };
}

#endif
