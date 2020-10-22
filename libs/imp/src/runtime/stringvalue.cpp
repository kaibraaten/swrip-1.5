#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/boolvalue.hpp"

namespace Imp
{
    struct StringValue::Impl
    {
        Impl(const std::string &value)
            : Value(value)
        {

        }

        std::string Value;
    };

    StringValue::StringValue(const std::string &value)
        : pImpl(std::make_unique<Impl>(value))
    {

    }

    StringValue::~StringValue()
    {

    }

    std::string StringValue::TypeName()
    {
        return "string";
    }

    std::string StringValue::ShowInfo()
    {
        if(pImpl->Value.find('\'') != std::string::npos)
            return '"' + pImpl->Value + '"';
        else
            return "'" + pImpl->Value + "'";
    }

    bool StringValue::GetBoolValue(const std::string &what, ImpSyntax *where)
    {
        return !pImpl->Value.empty();
    }

    std::string StringValue::GetStringValue(const std::string &what, ImpSyntax *where)
    {
        return pImpl->Value;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalSubscription(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        int subscript = v->GetIntValue("[...] index", where);

        if(subscript < pImpl->Value.size() && subscript >= 0)
        {
            return std::make_shared<StringValue>(std::string(1, pImpl->Value[subscript]));
        }
        else
        {
            RuntimeError("string index out of range.", where);
        }

        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalAdd(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<StringValue*>(v.get()))
        {
            return std::make_shared<StringValue>(pImpl->Value + v->GetStringValue("+ operand", where));
        }

        RuntimeError("Type error for +.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            long times = v->GetIntValue("* operand", where);
            std::string output = "";

            for(int i = 0; i < times; ++i)
            {
                output += pImpl->Value;
            }
            return std::make_shared<StringValue>(output);
        }

        RuntimeError("Type error for *.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }
        else if(dynamic_cast<StringValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value == v->GetStringValue("== operand", where));
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }
        else if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value != v->GetStringValue("!= operand", where));
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalLess(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value < v->GetStringValue("< operand", where));
        }

        RuntimeError("Type error for <.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalGreater(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value > v->GetStringValue("> operand", where));
        }

        RuntimeError("Type error for >.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalLessEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value <= v->GetStringValue("<= operand", where));
        }

        RuntimeError("Type error for <=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value >= v->GetStringValue(">= operand", where));
        }

        RuntimeError("Type error for >=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalNot(ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(pImpl->Value.empty());
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalLen(ImpSyntax *where)
    {
        return std::make_shared<IntValue>(pImpl->Value.size());
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalStr(ImpSyntax *where)
    {
        return std::make_shared<StringValue>(pImpl->Value);
    }
}
