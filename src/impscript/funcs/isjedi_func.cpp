#include <imp/utility.hpp>
#include <imp/runtime/boolvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/isjedi_func.hpp"
#include "character.hpp"

IsJediFunc::IsJediFunc()
    : Imp::FunctionValue("isjedi")
{

}

// If 1st param is Character, echo to that character.
std::shared_ptr<Imp::RuntimeValue> IsJediFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "isjedi", where);
    auto arg1 = actualParams[0];

    
    if((dynamic_cast<ImpCharacter*>(arg1.get())))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);
        bool isJedi = IsJedi(ch) || ch->PermStats.Frc > 0;
        return std::make_shared<Imp::BoolValue>(isJedi);
    }
    
    Imp::RuntimeValue::RuntimeError("Type error in isjedi().", where);
    return nullptr;
}
