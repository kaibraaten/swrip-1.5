#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include <imp/runtime/intvalue.hpp>
#include <imp/runtime/floatvalue.hpp>
#include <imp/runtime/boolvalue.hpp>
#include <imp/runtime/listvalue.hpp>
#include <imp/runtime/dictvalue.hpp>
#include <imp/runtime/runtimescope.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/setdata_func.hpp"
#include "character.hpp"

static bool IsLegalType(std::shared_ptr<Imp::RuntimeValue> value, const Imp::ImpSyntax *where);

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

    if(!IsLegalType(value, where))
    {
        Imp::RuntimeValue::RuntimeError("Type error in setdata() param 3.", where);
    }

    ch->RuntimeData()->Assign(key, value);
    return std::make_shared<Imp::NoneValue>();
}

static bool ListIsValid(std::shared_ptr<Imp::ListValue> list, const Imp::ImpSyntax *where)
{
    for(auto item : list->Value())
    {
        if(!IsLegalType(item, where))
        {
            return false;
        }
    }

    return true;
}

static bool DictIsValid(std::shared_ptr<Imp::DictValue> dict, const Imp::ImpSyntax *where)
{
    auto listOfKeys = std::dynamic_pointer_cast<Imp::ListValue>(dict->EvalList(where));
    
    for(auto key : listOfKeys->Value())
    {
        auto value = dict->EvalSubscription(key, where);

        if(!IsLegalType(value, where))
        {
            return false;
        }
    }

    return true;
}

static bool IsLegalType(std::shared_ptr<Imp::RuntimeValue> value, const Imp::ImpSyntax *where)
{
    if(dynamic_cast<Imp::BoolValue*>(value.get())
       || dynamic_cast<Imp::IntValue*>(value.get())
       || dynamic_cast<Imp::FloatValue*>(value.get())
       || dynamic_cast<Imp::StringValue*>(value.get())
       || dynamic_cast<Imp::NoneValue*>(value.get()))
    {
        return true;
    }
    else if(dynamic_cast<Imp::ListValue*>(value.get()))
    {
        return ListIsValid(std::dynamic_pointer_cast<Imp::ListValue>(value), where);
    }
    else if(dynamic_cast<Imp::DictValue*>(value.get()))
    {
        return DictIsValid(std::dynamic_pointer_cast<Imp::DictValue>(value), where);
    }
    else
    {
        return false;
    }
}
