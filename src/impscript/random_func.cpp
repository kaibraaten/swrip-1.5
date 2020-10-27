#include <utility/random.hpp>
#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/listvalue.hpp>
#include "impscript/random_func.hpp"

RandomFunc::RandomFunc()
    : Imp::FunctionValue("random")
{

}

std::shared_ptr<Imp::RuntimeValue> RandomFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "random", where);
    auto impList = actualParams[0];
    
    if((dynamic_cast<Imp::ListValue*>(impList.get())))
    {
        auto lst = std::dynamic_pointer_cast<Imp::ListValue>(impList)->Value();

        if(!lst.empty())
        {
            auto idx = GetRandomNumberFromRange(0, lst.size() - 1);
            return lst[idx];
        }
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in random() param 1.", where);
    }
    
    return std::make_shared<Imp::NoneValue>();
}
