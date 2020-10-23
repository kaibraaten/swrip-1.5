#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    struct BoolValue::Impl
    {
        Impl(bool v)
            : Value(v)
        {

        }

        bool Value;
    };

    BoolValue::BoolValue(bool value)
        : pImpl(std::make_unique<Impl>(value))
    {

    }

    BoolValue::~BoolValue()
    {

    }

    std::string BoolValue::TypeName()
    {
        return "bool";
    }

    std::string BoolValue::ShowInfo()
    {
        return pImpl->Value ? "True" : "False";
    }

    bool BoolValue::GetBoolValue(const std::string &what, const ImpSyntax *where)
    {
        return pImpl->Value;
    }

    std::shared_ptr<RuntimeValue> BoolValue::EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> BoolValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> BoolValue::EvalNot(const ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(!pImpl->Value);
    }

    std::shared_ptr<RuntimeValue> BoolValue::EvalStr(const ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
