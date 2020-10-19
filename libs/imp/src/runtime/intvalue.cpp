#include <cmath>
#include "imp/runtime/intvalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/runtime/floatvalue.hpp"
#include "imp/runtime/nonevalue.hpp"

namespace Imp
{
    IntValue::IntValue(long v)
    {
        _Value = v;
    }

    std::string IntValue::TypeName()
    {
        return "int";
    }

    std::string IntValue::ShowInfo()
    {
        return std::to_string(_Value);
    }

    bool IntValue::GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return _Value != 0;
    }

    long IntValue::GetIntValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return _Value;
    }

    double IntValue::GetFloatValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        return _Value;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalNegate(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<IntValue>(-_Value);
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalPositive(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<IntValue>(_Value);
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalAdd(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            return std::make_shared<IntValue>(_Value + v->GetIntValue("+ operand", where));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            return std::make_shared<FloatValue>(_Value + v->GetFloatValue("+ operand", where));
        }

        RuntimeError("Type error for +.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalSubtract(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            return std::make_shared<IntValue>(_Value - v->GetIntValue("- operand", where));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            return std::make_shared<FloatValue>(_Value - v->GetFloatValue("- operand", where));
        }

        RuntimeError("Type error for -.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            return std::make_shared<IntValue>(_Value * v->GetIntValue("* operand", where));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            return std::make_shared<FloatValue>(_Value * v->GetFloatValue("* operand", where));
        }

        RuntimeError("Type error for *.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalDivide(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
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

    std::shared_ptr<RuntimeValue> IntValue::EvalIntDivide(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            long divisor = v->GetIntValue("// operand", where);

            if(divisor == 0)
            {
                RuntimeError("Division by zero for //.", where);
            }

            return std::make_shared<IntValue>(floor((double)_Value / (double)divisor));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
        {
            double divisor = v->GetFloatValue("// operand", where);

            if(divisor == 0.0)
            {
                RuntimeError("Division by zero for //.", where);
            }

            return std::make_shared<FloatValue>(floor(_Value / divisor));
        }

        RuntimeError("Type error for //.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalModulo(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<IntValue*>(v.get()))
        {
            long divisor = v->GetIntValue("% operand", where);

            if(divisor == 0)
            {
                RuntimeError("Division by zero for %.", where);
            }

            return std::make_shared<IntValue>(fmod(_Value, divisor));
        }
        else if(dynamic_cast<FloatValue*>(v.get()))
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

    std::shared_ptr<RuntimeValue> IntValue::EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<NoneValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }
        else if(dynamic_cast<FloatValue*>(v.get())
                || dynamic_cast<IntValue*>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value == v->GetFloatValue("== operand", where));
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }


    std::shared_ptr<RuntimeValue> IntValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }
        else if(dynamic_cast<FloatValue *>(v.get())
                || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value != v->GetFloatValue("!= operand", where));
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalLess(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value < v->GetFloatValue("< operand", where));
        }

        RuntimeError("Type error for <.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalLessEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value <= v->GetFloatValue("<= operand", where));
        }

        RuntimeError("Type error for <=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalGreater(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value > v->GetFloatValue("> operand", where));
        }

        RuntimeError("Type error for >.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        if(dynamic_cast<FloatValue *>(v.get())
           || dynamic_cast<IntValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(_Value >= v->GetFloatValue(">= operand", where));
        }

        RuntimeError("Type error for >=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> IntValue::EvalNot(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<BoolValue>(_Value == 0);
    }
}
