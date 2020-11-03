#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impobject.hpp"
#include "impscript/funcs/objtype_func.hpp"
#include "mud.hpp"
#include "object.hpp"

ObjTypeFunc::ObjTypeFunc()
    : Imp::FunctionValue("objtype")
{

}

std::shared_ptr<Imp::RuntimeValue> ObjTypeFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "objtype", where);
    auto arg1 = actualParams[0];
    
    if(dynamic_cast<ImpObject*>(arg1.get()))
    {
        auto obj = std::dynamic_pointer_cast<ImpObject>(arg1)->Entity(where);
        return std::make_shared<Imp::StringValue>(ToLower(GetItemTypeName(obj)));
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in objtype() param 1.", where);
    }
    
    return std::make_shared<Imp::NoneValue>();
}
