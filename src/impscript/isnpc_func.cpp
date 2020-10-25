#include <imp/utility.hpp>
#include <imp/runtime/boolvalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/isnpc_func.hpp"
#include "character.hpp"

IsNpcFunc::IsNpcFunc()
    : Imp::FunctionValue("isnpc")
{

}

// If 1st param is Character, echo to that character.
std::shared_ptr<Imp::RuntimeValue> IsNpcFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "isnpc", where);
    auto ch = actualParams[0];

    
    if((dynamic_cast<ImpCharacter*>(ch.get())))
    {
        auto npc = std::dynamic_pointer_cast<ImpCharacter>(ch);
        return std::make_shared<Imp::BoolValue>(npc->Entity(where)->IsNpc());
    }
    
    Imp::RuntimeValue::RuntimeError("Type error in isnpc().", where);
    return nullptr;
}
