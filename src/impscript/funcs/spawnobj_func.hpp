#ifndef _SWRIP_IMPSCRIPT_SPAWNOBJ_FUNC_HPP_
#define _SWRIP_IMPSCRIPT_SPAWNOBJ_FUNC_HPP_

#include <imp/runtime/functionvalue.hpp>

class SpawnObjFunc : public Imp::FunctionValue
{
public:
    SpawnObjFunc();
    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where) override;
};

#endif
