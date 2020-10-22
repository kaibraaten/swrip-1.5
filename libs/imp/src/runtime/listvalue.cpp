#include <sstream>
#include "imp/runtime/listvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    struct ListValue::Impl
    {
        Impl(const std::deque<std::shared_ptr<RuntimeValue>> &value)
            : Value(value)
        {

        }

        std::deque<std::shared_ptr<RuntimeValue>> Value;
    };

    ListValue::ListValue(const std::deque<std::shared_ptr<RuntimeValue>> &value)
        : pImpl(std::make_unique<Impl>(value))
    {

    }

    ListValue::~ListValue()
    {

    }

    const std::deque<std::shared_ptr<RuntimeValue>> &ListValue::Value() const
    {
        return pImpl->Value;
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

        for(auto v : pImpl->Value)
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

    bool ListValue::GetBoolValue(const std::string &what, ImpSyntax *where)
    {
        return !pImpl->Value.empty();
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalNot(ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(pImpl->Value.empty());
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalSubscription(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<IntValue *>(v.get()))
        {
            int idx = v->GetIntValue("[...] operand", where);

            if(idx < 0 || idx >= pImpl->Value.size())
            {
                RuntimeError("list index out of range.", where);
            }

            return pImpl->Value[idx];
        }

        RuntimeError("Type error for [...].", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            std::deque<std::shared_ptr<RuntimeValue>> newList;
            long times = v->GetIntValue("* operand", where);

            for(int i = 0; i < times; ++i)
            {
                newList.insert(newList.end(), pImpl->Value.begin(), pImpl->Value.end());
            }

            return std::make_shared<ListValue>(newList);
        }

        RuntimeError("Type error for *.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalAdd(std::shared_ptr<RuntimeValue> rhv, ImpSyntax *where)
    {
        if(dynamic_cast<ListValue *>(rhv.get()))
        {
            auto asList = std::dynamic_pointer_cast<ListValue>(rhv);
            std::deque<std::shared_ptr<RuntimeValue>> newList;
            newList.assign(pImpl->Value.begin(), pImpl->Value.end());
            newList.insert(newList.end(), asList->pImpl->Value.begin(), asList->pImpl->Value.end());

            return std::make_shared<ListValue>(newList);
        }

        RuntimeError("Type error for +.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalLen(ImpSyntax *where)
    {
        return std::make_shared<IntValue>(pImpl->Value.size());
    }

    void ListValue::EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, ImpSyntax *where)
    {
        if(dynamic_cast<IntValue*>(inx.get()))
        {
            int subscript = inx->GetIntValue("[...] write operand", where);

            if(subscript < 0 || subscript >= pImpl->Value.size())
            {
                RuntimeError("list index out of range.", where);
            }

            pImpl->Value[subscript] = val;
        }
        else
        {
            RuntimeError("Type error for [...]", where);
        }
    }

    std::shared_ptr<RuntimeValue> ListValue::EvalStr(ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
