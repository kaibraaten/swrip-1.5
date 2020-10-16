#ifndef _IMP_EXCEPT_PARSEREXCEPTION_HPP_
#define _IMP_EXCEPT_PARSEREXCEPTION_HPP_

#include <imp/except/impexception.hpp>

namespace Imp
{
    class ParserException : public ImpException
    {
    public:
        ParserException(const std::string &msg);
    };
}

#endif
