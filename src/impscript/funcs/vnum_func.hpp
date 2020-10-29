#ifndef _SWRIP_IMPSCRIPT_VNUM_FUNC_HPP_
#define _SWRIP_IMPSCRIPT_VNUM_FUNC_HPP_

#include <imp/runtime/functionvalue.hpp>

class VnumFunc : public Imp::FunctionValue
{
public:
    VnumFunc();
    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where) override;
};

#endif
