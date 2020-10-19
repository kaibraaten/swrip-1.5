#include "imp/runtime/runtimevalue.hpp"
#include "imp/parser/impsyntax.hpp"
#include "imp/except/runtimeexception.hpp"

namespace Imp
{
    void RuntimeValue::RuntimeError(const std::string &msg, int lineNum)
    {
        throw RuntimeException("Imp runtime error on line " + std::to_string(lineNum) + ": " + msg);
    }

    void RuntimeValue::RuntimeError(const std::string &msg, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError(msg, where->LineNum());
    }

    bool RuntimeValue::GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("Type error: " + what + " is not a Boolean!", where);
        return false;
    }

    long RuntimeValue::GetIntValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("Type error: " + what + " is not a float!", where);
        return 0;
    }

    double RuntimeValue::GetFloatValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("Type error: " + what + " is not an integer!", where);
        return 0.0;
    }

    std::string RuntimeValue::GetStringValue(const std::string &what, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("Type error: " + what + " is not a text string!", where);
        return "";
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalAdd(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'+' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalDivide(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'/' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'==' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalGreater(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'>' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'>=' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalIntDivide(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'//' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalLen(std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'len' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalLess(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'<' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalLessEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'<=' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalModulo(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'%' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalMultiply(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'*' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalNegate(std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("Unary '-' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalNot(std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'not' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'!=' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalPositive(std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("Unary '+' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalSubscription(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("Subscription '[...]' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalSubtract(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'-' undefined for " + TypeName() + "!", where);
        return nullptr;
    }

    void RuntimeValue::EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("Assigning to an element not allowed for " + TypeName() + "!", where);
    }

    std::shared_ptr<RuntimeValue> RuntimeValue::EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams,
                                                             std::shared_ptr<ImpSyntax> where)
    {
        RuntimeError("'Function call (...)' undefined for " + TypeName() + "!", where);
        return nullptr;
    }
}
