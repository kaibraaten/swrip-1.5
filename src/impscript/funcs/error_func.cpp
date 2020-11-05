#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/funcs/error_func.hpp"

ErrorFunc::ErrorFunc()
    : Imp::FunctionValue("error")
{

}

std::shared_ptr<Imp::RuntimeValue> ErrorFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "error", where);
    auto errorMessage = actualParams[0];
    
    if(dynamic_cast<Imp::StringValue*>(errorMessage.get()))
    {
        Imp::RuntimeValue::RuntimeError(errorMessage->GetStringValue("error() param 1", where), where);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in error() param 1.", where);
    }
    
    return std::make_shared<Imp::NoneValue>();
}
