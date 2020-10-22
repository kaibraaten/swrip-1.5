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
        ~ReturnValue();
        std::shared_ptr<RuntimeValue> Value() const;
        int LineNum() const;

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
