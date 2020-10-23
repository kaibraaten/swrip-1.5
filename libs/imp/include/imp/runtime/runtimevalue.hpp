#ifndef _IMP_RUNTIME_RUNTIMEVALUE_HPP_
#define _IMP_RUNTIME_RUNTIMEVALUE_HPP_

#include <memory>
#include <string>
#include <vector>

namespace Imp
{
    class ImpSyntax;

    class RuntimeValue
    {
    public:
        static void RuntimeError(const std::string &msg, int lineNum);
        static void RuntimeError(const std::string &msg, const ImpSyntax *where);

        virtual ~RuntimeValue();
        virtual std::string TypeName() = 0;
        virtual std::string ShowInfo() = 0;

        virtual bool GetBoolValue(const std::string &what, const ImpSyntax *where);
        virtual long GetIntValue(const std::string &what, const ImpSyntax *where);
        virtual double GetFloatValue(const std::string &what, const ImpSyntax *where);
        virtual std::string GetStringValue(const std::string &what, const ImpSyntax *where);

        virtual std::shared_ptr<RuntimeValue> EvalAdd(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalDivide(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalGreater(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalIntDivide(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalLen(const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalLess(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalLessEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalModulo(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalMultiply(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalNegate(const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalNot(const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalPositive(const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalStr(const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalSubscription(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalSubtract(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where);
        virtual void EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, const ImpSyntax *where);
        virtual std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, const ImpSyntax *where);
    };
}

#endif
