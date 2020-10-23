#include <cmath>
#include "imp/runtime/floatvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    struct FloatValue::Impl
    {
        Impl(double v)
            : Value(v)
        {

        }

        double Value;
    };

    FloatValue::FloatValue(double v)
        : pImpl(std::make_unique<Impl>(v))
    {
        
    }

    FloatValue::~FloatValue()
    {

    }

    std::string FloatValue::TypeName()
    {
        return "float";
    }

    std::string FloatValue::ShowInfo()
    {
        return std::to_string(pImpl->Value);
    }

    bool FloatValue::GetBoolValue(const std::string &what, const ImpSyntax *where)
    {
        return pImpl->Value != 0.0;
    }

    double FloatValue::GetFloatValue(const std::string &what, const ImpSyntax *where)
    {
        return pImpl->Value;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalNegate(const ImpSyntax *where)
    {
        return std::make_shared<FloatValue>(-pImpl->Value);
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalPositive(const ImpSyntax *where)
    {
        return std::make_shared<FloatValue>(pImpl->Value);
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalAdd(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<FloatValue>(pImpl->Value + v->GetFloatValue("+ operand", where));
        }

        RuntimeError("Type error for +.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalSubtract(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<FloatValue>(pImpl->Value - v->GetFloatValue("- operand", where));
        }

        RuntimeError("Type error for -.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<FloatValue>(pImpl->Value * v->GetFloatValue("* operand", where));
        }

        RuntimeError("Type error for *.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalDivide(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
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

    std::shared_ptr<RuntimeValue> FloatValue::EvalIntDivide(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue*>(v.get())
           || dynamic_cast<IntValue*>(v.get()))
        {
            double divisor = v->GetFloatValue("/ operand", where);

            if(divisor == 0.0)
            {
                RuntimeError("Division by zero for /.", where);
            }

            return std::make_shared<FloatValue>(floor(pImpl->Value / divisor));
        }

        RuntimeError("Type error for //.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalModulo(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
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

    std::shared_ptr<RuntimeValue> FloatValue::EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }
        else if(dynamic_cast<FloatValue *>(v.get())
                || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value == v->GetFloatValue("== operand", where));
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
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

    std::shared_ptr<RuntimeValue> FloatValue::EvalLess(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value < v->GetFloatValue("< operand", where));
        }

        RuntimeError("Type error for <.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalLessEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value <= v->GetFloatValue("<= operand", where));
        }

        RuntimeError("Type error for <=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalGreater(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value > v->GetFloatValue("> operand", where));
        }

        RuntimeError("Type error for >.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(pImpl->Value >= v->GetFloatValue(">= operand", where));
        }

        RuntimeError("Type error for >=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalNot(const ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(pImpl->Value == 0.0);
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalStr(const ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}