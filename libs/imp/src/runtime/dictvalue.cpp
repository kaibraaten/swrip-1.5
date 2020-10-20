#include <sstream>

#include "imp/runtime/dictvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    DictValue::DictValue(const std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> &dict)
        : _Value(dict)
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

        for(const auto &pair : _Value)
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

    bool DictValue::GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return !_Value.empty();
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalNot(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<BoolValue>(!GetBoolValue("not operator", where));
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalSubscription(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<StringValue *>(v.get()))
        {
            const auto &iter = _Value.find(v->GetStringValue("[...] operand", where));

            if(iter != _Value.end())
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

    std::shared_ptr<RuntimeValue> DictValue::EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    void DictValue::EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<StringValue *>(inx.get()))
        {
            std::string subscript = inx->GetStringValue("[...] index", where);
            _Value[subscript] = val;
        }

        RuntimeError("Type error for [...]", where);
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalLen(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<IntValue>(_Value.size());
    }

    std::shared_ptr<RuntimeValue> DictValue::EvalStr(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
