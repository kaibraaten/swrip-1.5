#include <imp/utility.hpp>
#include <imp/runtime/intvalue.hpp>
#include "impscript/impobject.hpp"
#include "impscript/funcs/count_func.hpp"
#include "mud.hpp"
#include "object.hpp"

CountFunc::CountFunc()
    : Imp::FunctionValue("count")
{

}

std::shared_ptr<Imp::RuntimeValue> CountFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "count", where);
    auto arg1 = actualParams[0];
    
    if((dynamic_cast<ImpObject*>(arg1.get())))
    {
        auto obj = std::dynamic_pointer_cast<ImpObject>(arg1)->Entity(where);
        return std::make_shared<Imp::IntValue>(obj->Count);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in count() param 1.", where);
    }
    
    return nullptr;
}
