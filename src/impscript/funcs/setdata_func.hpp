#ifndef _SWRIP_IMPSCRIPT_SETDATA_FUNC_HPP_
#define _SWRIP_IMPSCRIPT_SETDATA_FUNC_HPP_

#include <imp/runtime/functionvalue.hpp>

class SetDataFunc : public Imp::FunctionValue
{
public:
    SetDataFunc();
    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where) override;
};

#endif
