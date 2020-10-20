#include <sstream>
#include "imp/runtime/listvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    ListValue::ListValue(const std::deque<std::shared_ptr<RuntimeValue>> &value)
        : _Value(value)
    {

    }

    const std::deque<std::shared_ptr<RuntimeValue>> &ListValue::Value() const
    {
        return _Value;
    }

    std::string ListValue::TypeName()
    {
        return "list";
    }

    std::string ListValue::ShowInfo()
    {
        std::ostringstream output;
        output << "[";
        bool firstElement = true;

        for(auto v : _Value)
        {
            if(!firstElement)
            {
                output << ", ";
            }

            output << v->ShowInfo();
            firstElement = false;
        }

        output << "]";
        return output.str();
    }

    bool ListValue::GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return !_Value.empty();
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalNot(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<BoolValue>(_Value.empty());
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalSubscription(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue *>(v.get()))
        {
            int idx = v->GetIntValue("[...] operand", where);

            if(idx < 0 || idx >= _Value.size())
            {
                RuntimeError("list index out of range.", where);
            }

            return _Value[idx];
        }

        RuntimeError("Type error for [...].", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<NoneValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            std::deque<std::shared_ptr<RuntimeValue>> newList;
            long times = v->GetIntValue("* operand", where);

            for(int i = 0; i < times; ++i)
            {
                newList.insert(newList.end(), _Value.begin(), _Value.end());
            }

            return std::make_shared<ListValue>(newList);
        }

        RuntimeError("Type error for *.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalLen(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<IntValue>(_Value.size());
    }

    void ListValue::EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue*>(inx.get()))
        {
            int subscript = inx->GetIntValue("[...] write operand", where);

            if(subscript < 0 || subscript >= _Value.size())
            {
                RuntimeError("list index out of range.", where);
            }

            _Value[subscript] = val;
            return;
        }

        RuntimeError("Type error for [...]", where);
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalStr(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
