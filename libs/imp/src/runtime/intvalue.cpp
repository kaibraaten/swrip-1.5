#include <cmath>
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/floatvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    struct IntValue::Impl
    {
        Impl(long v)
            : Value(v)
        {

        }

        long Value = 0;
    };

    IntValue::IntValue(long v)
        : pImpl(std::make_unique<Impl>(v))
    {
        
    }

    IntValue::~IntValue()
    {

    }

    std::string IntValue::TypeName()
    {
        return "int";
    }

    std::string IntValue::ShowInfo()
    {
        return std::to_string(pImpl->Value);
    }

    bool IntValue::GetBoolValue(const std::string &what, const ImpSyntax *where)
    {
        return pImpl->Value != 0;
    }

    long IntValue::GetIntValue(const std::string &what, const ImpSyntax *where)
    {
        return pImpl->Value;
    }

    double IntValue::GetFloatValue(const std::string &what, const ImpSyntax *where)
    {
        return pImpl->Value;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalNegate(const ImpSyntax *where)
    {
        return std::make_shared<IntValue>(-pImpl->Value);
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalPositive(const ImpSyntax *where)
    {
        return std::make_shared<IntValue>(pImpl->Value);
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalAdd(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            return std::make_shared<IntValue>(pImpl->Value + v->GetIntValue("+ operand", where));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            return std::make_shared<FloatValue>(pImpl->Value + v->GetFloatValue("+ operand", where));
        }

        RuntimeError("Type error for +.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalSubtract(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            return std::make_shared<IntValue>(pImpl->Value - v->GetIntValue("- operand", where));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            return std::make_shared<FloatValue>(pImpl->Value - v->GetFloatValue("- operand", where));
        }

        RuntimeError("Type error for -.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            return std::make_shared<IntValue>(pImpl->Value * v->GetIntValue("* operand", where));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            return std::make_shared<FloatValue>(pImpl->Value * v->GetFloatValue("* operand", where));
        }

        RuntimeError("Type error for *.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalDivide(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue*>(v.get())
           || dynamic_cast<IntValue*>(v.get()))
        {
            double divisor = v->GetFloatValue("/ operand", where);

            if(divisor == 0.0)
            {
                RuntimeError("Division by zero for /.", where);
            }

            return std::make_shared<FloatValue>(pImpl->Value / divisor);
        }

        RuntimeError("Type error for /.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalIntDivide(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            long divisor = v->GetIntValue("// operand", where);

            if(divisor == 0)
            {
                RuntimeError("Division by zero for //.", where);
            }

            return std::make_shared<IntValue>(floor((double)pImpl->Value / (double)divisor));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            double divisor = v->GetFloatValue("// operand", where);

            if(divisor == 0.0)
            {
                RuntimeError("Division by zero for //.", where);
            }

            return std::make_shared<FloatValue>(floor(pImpl->Value / divisor));
        }

        RuntimeError("Type error for //.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalModulo(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            long divisor = v->GetIntValue("% operand", where);

            if(divisor == 0)
            {
                RuntimeError("Division by zero for %.", where);
            }

            return std::make_shared<IntValue>(fmod(pImpl->Value, divisor));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            double divisor = v->GetFloatValue("% operand", where);

            if(divisor == 0.0)
            {
                RuntimeError("Division by zero for %.", where);
            }

            return std::make_shared<FloatValue>(pImpl->Value - divisor * floor(pImpl->Value / divisor));
        }

        RuntimeError("Type error for %.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }
        else if(dynamic_cast<FloatValue*>(v.get())
                || dynamic_cast<IntValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value == v->GetFloatValue("== operand", where));
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }


    std::shared_ptr<RuntimeValue> IntValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }
        else if(dynamic_cast<FloatValue *>(v.get())
                || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value != v->GetFloatValue("!= operand", where));
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalLess(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value < v->GetFloatValue("< operand", where));
        }

        RuntimeError("Type error for <.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalLessEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value <= v->GetFloatValue("<= operand", where));
        }

        RuntimeError("Type error for <=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalGreater(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value > v->GetFloatValue("> operand", where));
        }

        RuntimeError("Type error for >.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value >= v->GetFloatValue(">= operand", where));
        }

        RuntimeError("Type error for >=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalNot(const ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(pImpl->Value == 0);
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalStr(const ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
