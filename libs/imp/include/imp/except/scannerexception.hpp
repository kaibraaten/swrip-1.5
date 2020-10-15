#ifndef _IMP_EXCEPT_SCANNEREXCEPTION_HPP_
#define _IMP_EXCEPT_SCANNEREXCEPTION_HPP_

#include <imp/except/impexception.hpp>

namespace Imp
{
    class ScannerException : public ImpException
    {
    public:
        ScannerException(const std::string &msg);
    };
}

#endif
