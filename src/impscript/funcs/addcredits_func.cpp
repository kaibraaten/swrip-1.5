#include <imp/utility.hpp>
#include <imp/runtime/intvalue.hpp>
#include <imp/runtime/nonevalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/addcredits_func.hpp"
#include "mud.hpp"
#include "character.hpp"

AddCreditsFunc::AddCreditsFunc()
    : Imp::FunctionValue("addcredits")
{

}

std::shared_ptr<Imp::RuntimeValue> AddCreditsFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "addcredits", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    std::shared_ptr<Character> ch;
    long credits = 0;
    
    if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in addcredits() param 1.", where);
    }

    if(dynamic_cast<Imp::IntValue*>(arg2.get()))
    {
        credits = arg2->GetIntValue("addcredits() param 2", where);

        if(credits <= 0)
        {
            Imp::RuntimeValue::RuntimeError("Credits value in addcredits() param 2 must be > 0.", where);
        }
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in addcredits() param 2.", where);
    }

    ch->Gold += credits;
    return std::make_shared<Imp::NoneValue>();
}
