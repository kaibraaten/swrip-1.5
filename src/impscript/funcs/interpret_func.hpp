#ifndef _SWRIP_IMPSCRIPT_INTERPRET_FUNC_HPP_
#define _SWRIP_IMPSCRIPT_INTERPRET_FUNC_HPP_

#include <imp/runtime/functionvalue.hpp>

class InterpretFunc : public Imp::FunctionValue
{
public:
    InterpretFunc();
    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where) override;
};

#endif
