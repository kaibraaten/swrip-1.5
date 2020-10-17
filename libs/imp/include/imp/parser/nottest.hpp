#ifndef _IMP_PARSER_NOTTEST_HPP_
#define _IMP_PARSER_NOTTEST_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Comparison;

    class NotTest : public ImpSyntax
    {
    public:
        NotTest(int n);
        void PrettyPrint(std::ostream &out) override;
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<NotTest> Parse(std::shared_ptr<Scanner> s);

    private:        
        std::shared_ptr<Comparison> _Comparison;
        bool not = false;
    };
}

#endif
