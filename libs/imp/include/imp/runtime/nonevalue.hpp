#ifndef _IMP_RUNTIME_NONEVALUE_HPP_
#define _IMP_RUNTIME_NONEVALUE_HPP_

#include <string>
#include <memory>
#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class ImpSyntax;

    class NoneValue : public RuntimeValue
    {
    public:
        std::string TypeName() override;
        std::string ShowInfo() override;
        bool GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalNot(std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalStr(std::shared_ptr<ImpSyntax> where) override;
    };
}

#endif
