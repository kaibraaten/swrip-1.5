#ifndef _IMP_RUNTIME_INTVALUE_HPP_
#define _IMP_RUNTIME_INTVALUE_HPP_

#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class IntValue : public RuntimeValue
    {
    public:
        IntValue(long v);
        ~IntValue();
        std::string TypeName() override;
        std::string ShowInfo() override;
        bool GetBoolValue(const std::string &what, const ImpSyntax *where) override;
        double GetFloatValue(const std::string &what, const ImpSyntax *where) override;
        long GetIntValue(const std::string &what, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNegate(const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalPositive(const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalAdd(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalSubtract(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalMultiply(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalDivide(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalIntDivide(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalModulo(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalLess(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalLessEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalGreater(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNot(const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalStr(const ImpSyntax *where) override;

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
