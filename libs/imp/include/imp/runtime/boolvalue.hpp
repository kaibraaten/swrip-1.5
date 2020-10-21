#ifndef _IMP_RUNTIME_BOOLVALUE_HPP_
#define _IMP_RUNTIME_BOOLVALUE_HPP_

#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class BoolValue : public RuntimeValue
    {
    public:
        BoolValue(bool value);
        std::string TypeName() override;
        std::string ShowInfo() override;
        bool GetBoolValue(const std::string &what, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNot(ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalStr(ImpSyntax *where) override;

    private:
        bool _Value;
    };
}

#endif