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
        bool GetBoolValue(const std::string &what, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalNot(std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalSubscription(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalNotEqual(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalMultiply(std::shared_ptr<RuntimeValue> v, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalLen(std::shared_ptr<ImpSyntax> where) override;
        void EvalAssignElem(std::shared_ptr<RuntimeValue> inx, std::shared_ptr<RuntimeValue> val, std::shared_ptr<ImpSyntax> where) override;
        std::shared_ptr<RuntimeValue> EvalStr(std::shared_ptr<ImpSyntax> where) override;

    private:
        std::deque<std::shared_ptr<RuntimeValue>> _Value;
    };
}

#endif
