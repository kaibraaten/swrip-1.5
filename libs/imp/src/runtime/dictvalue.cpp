#include <sstream>
#include <deque>
#include <unordered_map>
#include "imp/runtime/dictvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/listvalue.hpp"

namespace Imp
{
    struct DictValue::Impl
    {
        Impl(const std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> &dict)
            : Value(dict)
        {

        }

        std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> Value;
    };

    DictValue::DictValue(const std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> &dict)
        : pImpl(std::make_unique<Impl>(dict))
    {

    }
    
    DictValue::~DictValue()
    {

    }

    std::string DictValue::TypeName()
    {
        return "dict";
    }
    
    std::string DictValue::ShowInfo()
    {
        std::ostringstream output;
        output << "{";

        bool firstElement = true;

        for(const auto &pair : pImpl->Value)
        {
            if(!firstElement)
            {
                output << ", ";
            }

            output << "'" << pair.first << "': ";
            output << pair.second->ShowInfo();;
            firstElement = false;
        }

        output << "}";
        return output.str();
    }

    bool DictValue::GetBoolValue(const std::string &what, const ImpSyntax *where)
    {
        return !pImpl->Value.empty();
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalNot(const ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(!GetBoolValue("not operator", where));
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalSubscription(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            const auto &iter = pImpl->Value.find(v->GetStringValue("[...] operand", where));

            if(iter != pImpl->Value.end())
            {
                return iter->second;
            }
            else
            {
                return std::make_shared<NoneValue>();
            }
        }

        RuntimeError("Type error for [...].", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    void DictValue::EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, const ImpSyntax *where)
    {
        if(dynamic_cast<StringValue *>(inx.get()))
        {
            std::string subscript = inx->GetStringValue("[...] index", where);
            pImpl->Value[subscript] = val;
        }

        RuntimeError("Type error for [...]", where);
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalLen(const ImpSyntax *where)
    {
        return std::make_shared<IntValue>(pImpl->Value.size());
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalStr(const ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalList(const ImpSyntax *where)
    {
        std::deque<std::shared_ptr<RuntimeValue>> data;

        for(const auto &p : pImpl->Value)
        {
            data.push_back(std::make_shared<StringValue>(p.first));
        }

        return std::make_shared<ListValue>(data);
    }
}
