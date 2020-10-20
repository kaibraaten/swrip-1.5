#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    std::string NoneValue::TypeName()
    {
        return "None";
    }

    std::string NoneValue::ShowInfo()
    {
        return "None";
    }

    bool NoneValue::GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return false;
    }

    std::shared_ptr<RuntimeValue> NoneValue::EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<BoolValue>(dynamic_cast<NoneValue *>(v.get()));
    }

    std::shared_ptr<RuntimeValue> NoneValue::EvalNot(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<BoolValue>(true);
    }

    std::shared_ptr<RuntimeValue> NoneValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<BoolValue>((dynamic_cast<NoneValue *>(v.get())) == nullptr);
    }

    std::shared_ptr<RuntimeValue> NoneValue::EvalStr(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
