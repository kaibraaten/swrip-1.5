#ifndef _IMP_RUNTIME_LAMBDAVALUE_HPP_
#define _IMP_RUNTIME_LAMBDAVALUE_HPP_

#include <vector>
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
        std::string TypeName() override;
        std::string ShowInfo() override;
        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams,
                                                   std::shared_ptr<ImpSyntax> where) override;

    private:
        std::vector<std::string> _FormalParams;
        std::shared_ptr<Expr> _Body;
        std::shared_ptr<RuntimeScope> _ScopeDeclared;
    };
}

#endif
