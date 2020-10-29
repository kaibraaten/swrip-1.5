#ifndef _SWRIP_IMPSCRIPT_GETROOM_FUNC_HPP_
#define _SWRIP_IMPSCRIPT_GETROOM_FUNC_HPP_

#include <imp/runtime/functionvalue.hpp>

class GetRoomFunc : public Imp::FunctionValue
{
public:
    GetRoomFunc();
    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where) override;
};

#endif
