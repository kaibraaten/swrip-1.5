#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/say_func.hpp"
#include "character.hpp"
#include "mud.hpp"

SayFunc::SayFunc()
    : Imp::FunctionValue("say")
{

}

// If 1st param is Character, echo to that character.
std::shared_ptr<Imp::RuntimeValue> SayFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "say", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    std::shared_ptr<Character> mob;
    std::string message;
    
    if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        mob = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);

        if(!mob->InRoom)
        {
            Imp::RuntimeValue::RuntimeError("Error in say() param 1: Actor is not in a room.",
                                            where);
        }
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in say() param 1.", where);
    }

    if(dynamic_cast<Imp::StringValue*>(arg2.get()))
    {
        message = arg2->GetStringValue("say() param 2", where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in say() param 2.", where);
    }

    do_say(mob, message);
    return std::make_shared<Imp::NoneValue>();
}
