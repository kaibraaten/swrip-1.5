#include "imp/runtime/returnvalue.hpp"

namespace Imp
{
    struct ReturnValue::Impl
    {
        Impl(std::shared_ptr<RuntimeValue> value, int lineNum)
            : Value(value),
            LineNum(lineNum)
        {

        }

        std::shared_ptr<RuntimeValue> Value;
        int LineNum = 0;
    };

    ReturnValue::ReturnValue(std::shared_ptr<RuntimeValue> value, int lineNum)
        : pImpl(std::make_unique<Impl>(value, lineNum))
    {

    }

    ReturnValue::~ReturnValue()
    {

    }

    std::shared_ptr<RuntimeValue> ReturnValue::Value() const
    {
        return pImpl->Value;
    }

    int ReturnValue::LineNum() const
    {
        return pImpl->LineNum;
    }
}
