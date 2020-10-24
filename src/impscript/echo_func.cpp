#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/echo_func.hpp"
#include "constants.hpp"
#include "act.hpp"

EchoFunc::EchoFunc()
    : Imp::FunctionValue("echo")
{

}

// If 1st param is Character, echo to that character.
// If 1st param is Room, echo to everyone in that room.
// If 1st param is Ship, echo to every room in that ship.
std::shared_ptr<Imp::RuntimeValue> EchoFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "echo", where);
    auto recipient = actualParams[0];
    auto msg = actualParams[1];

    if((dynamic_cast<Imp::StringValue *>(msg.get())) == nullptr)
    {
        Imp::RuntimeValue::RuntimeError("Type error in echo() param 2.", where);
    }

    auto message = msg->GetStringValue("echo() param 2", where);
    
    if((dynamic_cast<ImpCharacter*>(recipient.get())))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(recipient);
        Act(AT_PLAIN, message, ch->Char(where), nullptr, nullptr, ActTarget::Char);
        return std::make_shared<Imp::NoneValue>();
    }
    
    Imp::RuntimeValue::RuntimeError("Type error in echo() param 1.", where);
    return nullptr;
}
