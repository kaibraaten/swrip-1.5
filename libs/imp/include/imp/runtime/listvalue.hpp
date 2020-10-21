#ifndef _IMP_RUNTIME_LISTVALUE_HPP_
#define _IMP_RUNTIME_LISTVALUE_HPP_

#include <deque>
#include <memory>
#include <string>
#include <imp/runtime/runtimevalue.hpp>

namespace Imp
{
    class ImpSyntax;

    class ListValue : public RuntimeValue
    {
    public:
        ListValue(const std::deque<std::shared_ptr<RuntimeValue>> &value);
        const std::deque<std::shared_ptr<RuntimeValue>> &Value() const;
        std::string TypeName() override;
        std::string ShowInfo() override;
        bool GetBoolValue(const std::string &what, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNot(ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalSubscription(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalAdd(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalMultiply(std::shared_ptr<RuntimeValue> v, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalLen(ImpSyntax *where) override;
        void EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, ImpSyntax *where) override;
        std::shared_ptr<RuntimeValue> EvalStr(ImpSyntax *where) override;

    private:
        std::deque<std::shared_ptr<RuntimeValue>> _Value;
    };
}

#endif
