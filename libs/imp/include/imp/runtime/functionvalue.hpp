#ifndef _IMP_RUNTIME_FUNCTIONVALUE_HPP_
#define _IMP_RUNTIME_FUNCTIONVALUE_HPP_

#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class Suite;
    class RuntimeScope;

    class FunctionValue : public RuntimeValue
    {
    public:
        FunctionValue(const std::string &name);
        FunctionValue(const std::string &name,
                      const std::vector<std::string> &formalParams,
                      std::shared_ptr<RuntimeScope> scopeDeclared,
                      std::shared_ptr<Suite> body);
        ~FunctionValue();
        std::string TypeName() override;
        std::string ShowInfo() override;
        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams,
                                                   const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalStr(const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::string GetName() const;

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
