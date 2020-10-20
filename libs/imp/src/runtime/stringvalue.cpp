#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/boolvalue.hpp"

namespace Imp
{
    StringValue::StringValue(const std::string &value)
        : _Value(value)
    {

    }

    std::string StringValue::TypeName()
    {
        return "string";
    }

    std::string StringValue::ShowInfo()
    {
        if(_Value.find('\'') != std::string::npos)
            return '"' + _Value + '"';
        else
            return "'" + _Value + "'";
    }

    bool StringValue::GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return !_Value.empty();
    }

    std::string StringValue::GetStringValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return _Value;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalSubscription(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        int subscript = v->GetIntValue("[...] index", where);

        if(subscript < _Value.size() && subscript >= 0)
        {
            return std::make_shared<StringValue>(std::string(1, _Value[subscript]));
        }
        else
        {
            RuntimeError("string index out of range.", where);
        }

        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalAdd(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<StringValue*>(v.get()))
        {
            return std::make_shared<StringValue>(_Value + v->GetStringValue("+ operand", where));
        }

        RuntimeError("Type error for +.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            long times = v->GetIntValue("* operand", where);
            std::string output = "";

            for(int i = 0; i < times; ++i)
            {
                output += _Value;
            }
            return std::make_shared<StringValue>(output);
        }

        RuntimeError("Type error for *.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<NoneValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }
        else if(dynamic_cast<StringValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value == v->GetStringValue("== operand", where));
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }
        else if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value != v->GetStringValue("!= operand", where));
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalLess(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value < v->GetStringValue("< operand", where));
        }

        RuntimeError("Type error for <.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalGreater(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value > v->GetStringValue("> operand", where));
        }

        RuntimeError("Type error for >.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalLessEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value <= v->GetStringValue("<= operand", where));
        }

        RuntimeError("Type error for <=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value >= v->GetStringValue(">= operand", where));
        }

        RuntimeError("Type error for >=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalNot(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<BoolValue>(_Value.empty());
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalLen(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<IntValue>(_Value.size());
    }

    std::shared_ptr<RuntimeValue> StringValue::EvalStr(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<StringValue>(_Value);
    }
}
