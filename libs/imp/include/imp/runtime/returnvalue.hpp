#ifndef _IMP_RUNTIME_RETURNVALUE_HPP_
#define _IMP_RUNTIME_RETURNVALUE_HPP_

#include <memory>

namespace Imp
{
    class RuntimeValue;

    class ReturnValue
    {
    public:
        ReturnValue(std::shared_ptr<RuntimeValue> value, int lineNum);
        std::shared_ptr<RuntimeValue> Value() const;
        int LineNum() const;

    private:
        std::shared_ptr<RuntimeValue> _Value;
        int _LineNum = 0;
    };
}

#endif
