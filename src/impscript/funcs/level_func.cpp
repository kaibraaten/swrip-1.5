#include <imp/utility.hpp>
#include <imp/runtime/intvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/level_func.hpp"
#include "character.hpp"

LevelFunc::LevelFunc()
    : Imp::FunctionValue("level")
{

}

// If 1st param is Character, echo to that character.
std::shared_ptr<Imp::RuntimeValue> LevelFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "level", where);
    auto arg1 = actualParams[0];

    
    if((dynamic_cast<ImpCharacter*>(arg1.get())))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);
        int level = GetTrustLevel(ch);
        return std::make_shared<Imp::IntValue>(level);
    }
    
    Imp::RuntimeValue::RuntimeError("Type error in level().", where);
    return nullptr;
}
