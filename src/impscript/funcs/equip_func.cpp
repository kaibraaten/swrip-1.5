#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include "impscript/impobject.hpp"
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/equip_func.hpp"
#include "mud.hpp"
#include "object.hpp"
#include "character.hpp"

EquipFunc::EquipFunc()
    : Imp::FunctionValue("equip")
{

}

std::shared_ptr<Imp::RuntimeValue> EquipFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "equip", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    std::shared_ptr<Character> ch;
    std::shared_ptr<Object> obj;
    
    if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in equip() param 1.", where);
    }

    if(dynamic_cast<ImpObject*>(arg2.get()))
    {
        obj = std::dynamic_pointer_cast<ImpObject>(arg2)->Entity(where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in equip() param 2.", where);
    }

    if(obj->CarriedBy != ch)
    {
        Imp::RuntimeValue::RuntimeError("Object isn't carried by actor in equip().", where);
    }

    if(obj->WearLoc != WEAR_NONE)
    {
        Imp::RuntimeValue::RuntimeError("Object has already been equipped in equip().", where);
    }
    
    WearObj(ch, obj);
    
    return std::make_shared<Imp::NoneValue>();
}

