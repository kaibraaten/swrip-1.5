#include <imp/utility.hpp>
#include <imp/runtime/boolvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/isfighting_func.hpp"
#include "character.hpp"
#include "mud.hpp"

IsFightingFunc::IsFightingFunc()
    : Imp::FunctionValue("isfighting")
{

}

std::shared_ptr<Imp::RuntimeValue> IsFightingFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "isfighting", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    
    if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        auto actor = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);

        if(dynamic_cast<ImpCharacter*>(arg2.get()))
        {
            auto enemy = std::dynamic_pointer_cast<ImpCharacter>(arg2)->Entity(where);
            bool areFighting = WhoFighting(actor) == enemy;
            return std::make_shared<Imp::BoolValue>(areFighting);
        }
    }
    
    Imp::RuntimeValue::RuntimeError("Type error in isfighting().", where);
    return nullptr;
}
