#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    BoolValue::BoolValue(bool value)
        : _Value(value)
    {

    }

    std::string BoolValue::TypeName()
    {
        return "bool";
    }

    std::string BoolValue::ShowInfo()
    {
        return _Value ? "True" : "False";
    }

    bool BoolValue::GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return _Value;
    }

    std::shared_ptr<RuntimeValue> BoolValue::EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<BoolValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value);
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> BoolValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<BoolValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> BoolValue::EvalNot(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<BoolValue>(!_Value);
    }

    std::shared_ptr<RuntimeValue> BoolValue::EvalStr(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
