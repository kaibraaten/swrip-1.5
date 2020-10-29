#ifndef _SWRIP_IMPSCRIPT_WAIT_FUNC_HPP_
#define _SWRIP_IMPSCRIPT_WAIT_FUNC_HPP_

#include <imp/runtime/functionvalue.hpp>

class WaitFunc : public Imp::FunctionValue
{
public:
    WaitFunc();
    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where, std::shared_ptr<Imp::RuntimeScope> curScope) override;
};

#endif
