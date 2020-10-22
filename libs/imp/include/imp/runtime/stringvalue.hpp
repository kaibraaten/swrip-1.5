#ifndef _IMP_RUNTIME_STRINGVALUE_HPP_
#define _IMP_RUNTIME_STRINGVALUE_HPP_

#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class StringValue : public RuntimeValue
    {
    public:
        StringValue(const std::string &value);
        ~StringValue();
        std::string TypeName() override;
        std::string ShowInfo() override;
        bool GetBoolValue(const std::string &what, ImpSyntax *where) override;
        std::string GetStringValue(const std::string &what, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalSubscription(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalAdd(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalMultiply(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalLess(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalGreater(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalLessEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalGreaterEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNot(ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalLen(ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalStr(ImpSyntax *where) override;

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
