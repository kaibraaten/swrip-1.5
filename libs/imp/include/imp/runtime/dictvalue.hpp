#ifndef _IMP_RUNTIME_DICTVALUE_HPP_
#define _IMP_RUNTIME_DICTVALUE_HPP_

#include <string>
#include <unordered_map>
#include <memory>
#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class DictValue : public RuntimeValue
    {
    public:
        DictValue(const std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> &dict);
        std::string TypeName() override;
        std::string ShowInfo() override;
        bool GetBoolValue(const std::string &what, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNot(ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalSubscription(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        void EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalLen(ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalStr(ImpSyntax *where) override;

    private:
        std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> _Value;
    };
}

#endif
