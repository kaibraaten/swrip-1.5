#include <imp/utility.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/funcs/type_func.hpp"

TypeFunc::TypeFunc()
    : Imp::FunctionValue("type")
{

}

std::shared_ptr<Imp::RuntimeValue> TypeFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "type", where);
    auto arg1 = actualParams[0];
    return std::make_shared<Imp::StringValue>(arg1->TypeName());
}
