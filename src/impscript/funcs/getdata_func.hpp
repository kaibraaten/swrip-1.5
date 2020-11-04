#ifndef _SWRIP_IMPSCRIPT_GETDATA_FUNC_HPP_
#define _SWRIP_IMPSCRIPT_GETDATA_FUNC_HPP_

#include <imp/runtime/functionvalue.hpp>

class GetDataFunc : public Imp::FunctionValue
{
public:
    GetDataFunc();
    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where) override;
};

#endif
