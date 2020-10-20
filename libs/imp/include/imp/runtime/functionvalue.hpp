#ifndef _IMP_RUNTIME_FUNCTIONVALUE_HPP_
#define _IMP_RUNTIME_FUNCTIONVALUE_HPP_

#include <string>
#include <vector>
#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class ImpSyntax;
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
        std::string TypeName() override;
        std::string ShowInfo() override;
        std::shared_ptr<RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams,
                                                   std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalStr(std::shared_ptr<ImpSyntax> where) override;

    private:
        std::string _Name;
        std::vector<std::string> _FormalParams;
        std::shared_ptr<RuntimeScope> _ScopeDeclared;
        std::shared_ptr<Suite> _Body;
    };
}

#endif
