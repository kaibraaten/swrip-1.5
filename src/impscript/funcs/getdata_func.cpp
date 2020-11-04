#include <imp/utility.hpp>
#include <imp/runtime/stringvalue.hpp>
#include <imp/runtime/runtimescope.hpp>
#include <imp/runtime/nonevalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/getdata_func.hpp"
#include "character.hpp"

GetDataFunc::GetDataFunc()
    : Imp::FunctionValue("getdata")
{

}

std::shared_ptr<Imp::RuntimeValue> GetDataFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "getdata", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    std::shared_ptr<Character> ch;
    std::string key;
    
    if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in getdata() param 1.", where);
    }

    if(dynamic_cast<Imp::StringValue*>(arg2.get()))
    {
        key = arg2->GetStringValue("getdata() param 2", where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in getdata() param 2.", where);
    }

    if(ch->RuntimeData()->Exists(key))
    {
        return ch->RuntimeData()->Find(key, where);
    }
    else
    {
        return std::make_shared<Imp::NoneValue>();
    }
}
