#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include <imp/runtime/runtimescope.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/setdata_func.hpp"
#include "character.hpp"

SetDataFunc::SetDataFunc()
    : Imp::FunctionValue("setdata")
{

}

std::shared_ptr<Imp::RuntimeValue> SetDataFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 3, "setdata", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    auto value = actualParams[2];
    std::shared_ptr<Character> ch;
    std::string key;
    
    if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in setdata() param 1.", where);
    }

    if(dynamic_cast<Imp::StringValue*>(arg2.get()))
    {
        key = arg2->GetStringValue("setdata() param 2", where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in setdata() param 2.", where);
    }

    ch->RuntimeData()->Assign(key, value);
    return std::make_shared<Imp::NoneValue>();
}
