#include "imp/runtime/returnvalue.hpp"

namespace Imp
{
    ReturnValue::ReturnValue(std::shared_ptr<RuntimeValue> value, int lineNum)
        : _Value(value),
        _LineNum(lineNum)
    {

    }

    std::shared_ptr<RuntimeValue> ReturnValue::Value() const
    {
        return _Value;
    }

    int ReturnValue::LineNum() const
    {
        return _LineNum;
    }
}
