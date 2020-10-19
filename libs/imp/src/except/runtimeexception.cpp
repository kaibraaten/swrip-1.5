#include "imp/except/runtimeexception.hpp"

namespace Imp
{
    RuntimeException::RuntimeException(const std::string &msg)
        : ImpException(msg)
    {

    }
}
