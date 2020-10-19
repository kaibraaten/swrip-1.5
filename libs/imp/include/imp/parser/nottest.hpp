#ifndef _IMP_PARSER_NOTTEST_HPP_
#define _IMP_PARSER_NOTTEST_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class Comparison;
    class RuntimeValue;
    class RuntimeScope;
    class Scanner;

    class NotTest : public ImpSyntax
    {
    public:
        NotTest(int n);
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<NotTest> Parse(std::shared_ptr<Scanner> s);

    private:        
        std::shared_ptr<Comparison> _Comparison;
        bool not = false;
    };
}

#endif
