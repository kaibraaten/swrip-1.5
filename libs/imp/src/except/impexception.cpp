#include "imp/except/impexception.hpp"

namespace Imp
{
    ImpException::ImpException(const std::string &msg)
        : std::runtime_error(msg)
    {

    }
}