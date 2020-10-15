#ifndef _IMP_EXCEPT_IMPEXCEPTION_HPP_
#define _IMP_EXCEPT_IMPEXCEPTION_HPP_

#include <stdexcept>

namespace Imp
{
    class ImpException : public std::runtime_error
    {
    public:
        virtual ~ImpException() = default;

    protected:
        ImpException(const std::string &msg);
    };
}

#endif
