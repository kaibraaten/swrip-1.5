#ifndef _IMP_RUNTIME_FLOATVALUE_HPP_
#define _IMP_RUNTIME_FLOATVALUE_HPP_

#include <string>
#include <memory>
#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class ImpSyntax;

    class FloatValue : public RuntimeValue
    {
    public:
        FloatValue(double v);
        std::string TypeName() override;
        std::string ShowInfo() override;
        bool GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where) override;
        double GetFloatValue(const std::string &what, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalNegate(std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalPositive(std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalAdd(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalSubtract(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalMultiply(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalDivide(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalIntDivide(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalModulo(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalLess(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalLessEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalGreater(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalNot(std::shared_ptr<ImpSyntax> where) override;

    private:
        double _Value;
    };
}

#endif
