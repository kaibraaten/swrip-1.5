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

    bool NoneValue::GetBoolValue(const std::string &what, const ImpSyntax *where)
    {
        return false;
    }

    std::shared_ptr<RuntimeValue> NoneValue::EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(dynamic_cast<NoneValue *>(v.get()));
    }

    std::shared_ptr<RuntimeValue> NoneValue::EvalNot(const ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(true);
    }

    std::shared_ptr<RuntimeValue> NoneValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        return std::make_shared<BoolValue>((dynamic_cast<NoneValue *>(v.get())) == nullptr);
    }

    std::shared_ptr<RuntimeValue> NoneValue::EvalStr(const ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
