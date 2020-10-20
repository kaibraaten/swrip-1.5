#include <cmath>
#include "imp/runtime/floatvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    FloatValue::FloatValue(double v)
    {
        _Value = v;
    }

    std::string FloatValue::TypeName()
    {
        return "float";
    }

    std::string FloatValue::ShowInfo()
    {
        return std::to_string(_Value);
    }

    bool FloatValue::GetBoolValue(const std::string &what, ImpSyntax *where)
    {
        return _Value != 0.0;
    }

    double FloatValue::GetFloatValue(const std::string &what, ImpSyntax *where)
    {
        return _Value;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalNegate(ImpSyntax *where)
    {
        return std::make_shared<FloatValue>(-_Value);
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalPositive(ImpSyntax *where)
    {
        return std::make_shared<FloatValue>(_Value);
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalAdd(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<FloatValue>(_Value + v->GetFloatValue("+ operand", where));
        }

        RuntimeError("Type error for +.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalSubtract(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<FloatValue>(_Value - v->GetFloatValue("- operand", where));
        }

        RuntimeError("Type error for -.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<FloatValue>(_Value * v->GetFloatValue("* operand", where));
        }

        RuntimeError("Type error for *.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalDivide(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue*>(v.get())
           || dynamic_cast<IntValue*>(v.get()))
        {
            double divisor = v->GetFloatValue("/ operand", where);

            if(divisor == 0.0)
            {
                RuntimeError("Division by zero for /.", where);
            }

            return std::make_shared<FloatValue>(_Value / divisor);
        }

        RuntimeError("Type error for /.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalIntDivide(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue*>(v.get())
           || dynamic_cast<IntValue*>(v.get()))
        {
            double divisor = v->GetFloatValue("/ operand", where);

            if(divisor == 0.0)
            {
                RuntimeError("Division by zero for /.", where);
            }

            return std::make_shared<FloatValue>(floor(_Value / divisor));
        }

        RuntimeError("Type error for //.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalModulo(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            double divisor = v->GetFloatValue("% operand", where);

            if(divisor == 0.0)
            {
                RuntimeError("Division by zero for %.", where);
            }

            return std::make_shared<FloatValue>(_Value - divisor * floor(_Value / divisor));
        }

        RuntimeError("Type error for %.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }
        else if(dynamic_cast<FloatValue *>(v.get())
                || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value == v->GetFloatValue("== operand", where));
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }
        else if(dynamic_cast<FloatValue *>(v.get())
                || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value != v->GetFloatValue("!= operand", where));
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalLess(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value < v->GetFloatValue("< operand", where));
        }

        RuntimeError("Type error for <.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalLessEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value <= v->GetFloatValue("<= operand", where));
        }

        RuntimeError("Type error for <=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalGreater(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value > v->GetFloatValue("> operand", where));
        }

        RuntimeError("Type error for >.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value >= v->GetFloatValue(">= operand", where));
        }

        RuntimeError("Type error for >=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalNot(ImpSyntax *where)
    {
        return std::make_shared<BoolValue>(_Value == 0.0);
    }

    std::shared_ptr<RuntimeValue> FloatValue::EvalStr(ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}