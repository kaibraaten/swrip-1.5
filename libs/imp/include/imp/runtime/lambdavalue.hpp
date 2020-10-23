#ifndef _IMP_RUNTIME_LAMBDAVALUE_HPP_
#define _IMP_RUNTIME_LAMBDAVALUE_HPP_

#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class Expr;
    class RuntimeScope;

    class LambdaValue : public RuntimeValue
    {
    public:
        LambdaValue(const std::vector<std::string> &args,
                    std::shared_ptr<Expr> body,
                    std::shared_ptr<RuntimeScope> scope);
        ~LambdaValue();
        std::string TypeName() override;
        std::string ShowInfo() override;
        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams,
                                                   const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalStr(const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, const ImpSyntax *where) override;

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
