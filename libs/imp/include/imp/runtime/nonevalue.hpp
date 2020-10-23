#ifndef _IMP_RUNTIME_NONEVALUE_HPP_
#define _IMP_RUNTIME_NONEVALUE_HPP_

#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class NoneValue : public RuntimeValue
    {
    public:
        std::string TypeName() override;
        std::string ShowInfo() override;
        bool GetBoolValue(const std::string &what, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNot(const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalStr(const ImpSyntax *where) override;
    };
}

#endif
