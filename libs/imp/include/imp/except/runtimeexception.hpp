#ifndef _IMP_EXCEPT_RUNTIMEEXCEPTION_HPP_
#define _IMP_EXCEPT_RUNTIMEEXCEPTION_HPP_

#include <string>
#include <imp/except/impexception.hpp>

namespace Imp
{
    class RuntimeException : public ImpException
    {
    public:
        RuntimeException(const std::string &msg);
    };
}

#endif
