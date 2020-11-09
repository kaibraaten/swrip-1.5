#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/funcs/log_func.hpp"
#include "log.hpp"

LogFunc::LogFunc()
    : Imp::FunctionValue("log")
{

}

std::shared_ptr<Imp::RuntimeValue> LogFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "log", where);
    auto errorMessage = actualParams[0];
    
    if(dynamic_cast<Imp::StringValue*>(errorMessage.get()))
    {
        Log->Script("%s", errorMessage->GetStringValue("log() param 1", where).c_str());
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in log() param 1.", where);
    }
    
    return std::make_shared<Imp::NoneValue>();
}
