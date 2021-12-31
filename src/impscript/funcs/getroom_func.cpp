#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/intvalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/impobject.hpp"
#include "impscript/improom.hpp"
#include "impscript/funcs/getroom_func.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "room.hpp"

GetRoomFunc::GetRoomFunc()
    : Imp::FunctionValue("getroom")
{

}

std::shared_ptr<Imp::RuntimeValue> GetRoomFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "getroom", where);
    auto arg1 = actualParams[0];
    std::shared_ptr<Imp::RuntimeValue> result;

    if(dynamic_cast<Imp::IntValue*>(arg1.get()))
    {
        vnum_t vnum = arg1->GetIntValue("getroom() param", where);
        result = std::make_shared<ImpRoom>(GetRoom(vnum));
    }
    else if(dynamic_cast<Imp::StringValue*>(arg1.get()))
    {
        std::string tag = arg1->GetStringValue("getroom() param", where);
        result = std::make_shared<ImpRoom>(GetRoom(tag));
    }
    else if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(arg1);
        result = std::make_shared<ImpRoom>(ch->Entity(where)->InRoom);
    }
    else if(dynamic_cast<ImpObject*>(arg1.get()))
    {
        auto impobj = std::dynamic_pointer_cast<ImpObject>(arg1);
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
        Imp::RuntimeValue::RuntimeError("Type error in getroom() param 1.", where);
    }

    if(result == nullptr)
    {
        Imp::RuntimeValue::RuntimeError("Invalid vnum in getroom() param 1.", where);
    }
    
    return result;
}
