#ifndef _SWRIP_IMPSCRIPT_ADDCREDITS_FUNC_HPP_
#define _SWRIP_IMPSCRIPT_ADDCREDITS_FUNC_HPP_

#include <imp/runtime/functionvalue.hpp>

class AddCreditsFunc : public Imp::FunctionValue
{
public:
    AddCreditsFunc();
    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where) override;
};

#endif
