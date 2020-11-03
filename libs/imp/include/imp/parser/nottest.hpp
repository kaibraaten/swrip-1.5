#ifndef _IMP_PARSER_NOTTEST_HPP_
#define _IMP_PARSER_NOTTEST_HPP_

#include <imp/parser/impsyntax.hpp>

namespace Imp
{
    class NotTest : public ImpSyntax
    {
    public:
        NotTest(const std::string &scriptname, int n);
        ~NotTest();
        std::shared_ptr<RuntimeValue> Eval(std::shared_ptr<RuntimeScope> curScope) override;
        static std::shared_ptr<NotTest> Parse(std::shared_ptr<Scanner> s);

    private:        
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
