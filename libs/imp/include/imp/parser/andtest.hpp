#ifndef _IMP_PARSER_ANDTEST_HPP_
#define _IMP_PARSER_ANDTEST_HPP_

#include <vector>
#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class AndTest : public ImpSyntax
    {
    public:
        AndTest(int n);
        void PrettyPrint(std::ostream &out) override;

        static std::shared_ptr<AndTest> Parse(std::shared_ptr<Scanner> s);

    private:
        class NotTest;
        std::vector<std::shared_ptr<NotTest>> NotTests;
    };
}

#endif
