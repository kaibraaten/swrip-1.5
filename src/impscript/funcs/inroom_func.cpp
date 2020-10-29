#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include <imp/runtime/intvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/improom.hpp"
#include "impscript/impobject.hpp"
#include "impscript/funcs/inroom_func.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "room.hpp"

InRoomFunc::InRoomFunc()
    : Imp::FunctionValue("inroom")
{

}

std::shared_ptr<Imp::RuntimeValue> InRoomFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "inroom", where);
    auto entity = actualParams[0];
    std::shared_ptr<Imp::RuntimeValue> result;
    
    if((dynamic_cast<ImpCharacter*>(entity.get())))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(entity);
        result = std::make_shared<ImpRoom>(ch->Entity(where)->InRoom);
    }
    else if((dynamic_cast<ImpObject*>(entity.get())))
    {
        auto impobj = std::dynamic_pointer_cast<ImpObject>(entity);
        auto obj = impobj->Entity(where);

        if(obj->InRoom)
        {
            result = std::make_shared<ImpRoom>(obj->InRoom);
        }
        else
        {
            result = std::make_shared<Imp::NoneValue>();
        }
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in inroom() param 1.", where);
    }
    
    return result;
}
