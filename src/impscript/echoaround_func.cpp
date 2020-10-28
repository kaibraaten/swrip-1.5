#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/improom.hpp"
#include "impscript/impobject.hpp"
#include "impscript/echoaround_func.hpp"
#include "constants.hpp"
#include "act.hpp"
#include "mud.hpp"
#include "object.hpp"

EchoAroundFunc::EchoAroundFunc()
    : Imp::FunctionValue("echoaround")
{

}

std::shared_ptr<Imp::RuntimeValue> EchoAroundFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "echoaround", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    std::string message;
    
    if(dynamic_cast<Imp::StringValue *>(arg2.get()))
    {
        message = arg2->GetStringValue("echoaround() param 2", where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in echoaround() param 2.", where);
    }

    
    if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);
        Act(AT_PLAIN, message, ch, nullptr, nullptr, ActTarget::Room);
    }
    else if(dynamic_cast<ImpObject*>(arg1.get()))
    {
        auto obj = std::dynamic_pointer_cast<ImpObject>(arg1)->Entity(where);

        if(obj->InRoom)
        {
            EchoToRoom(AT_PLAIN, obj->InRoom, Capitalize(message));
        }
        else if(obj->CarriedBy)
        {
            Act(AT_PLAIN, message, obj->CarriedBy, nullptr, nullptr, ActTarget::Char);
        }
        else
        {
            Imp::RuntimeValue::RuntimeError("Object not carried or in room in echoaround() param 1.", where);
        }
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in echoaround() param 1.", where);
    }
    
    return std::make_shared<Imp::NoneValue>();
}
