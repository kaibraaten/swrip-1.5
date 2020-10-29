#include <imp/utility.hpp>
#include <imp/runtime/boolvalue.hpp>
#include "impscript/impobject.hpp"
#include "impscript/funcs/equipped_func.hpp"
#include "mud.hpp"
#include "object.hpp"

EquippedFunc::EquippedFunc()
    : Imp::FunctionValue("equipped")
{

}

std::shared_ptr<Imp::RuntimeValue> EquippedFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "equipped", where);
    auto arg1 = actualParams[0];
    
    if((dynamic_cast<ImpObject*>(arg1.get())))
    {
        auto obj = std::dynamic_pointer_cast<ImpObject>(arg1)->Entity(where);
        bool isEquipped = obj->WearLoc != WEAR_NONE && obj->CarriedBy != nullptr;
        return std::make_shared<Imp::BoolValue>(isEquipped);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in equipped() param 1.", where);
    }
    
    return nullptr;
}
