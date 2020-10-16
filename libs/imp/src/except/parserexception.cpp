#include "imp/except/parserexception.hpp"

namespace Imp
{
    ParserException::ParserException(const std::string &msg)
        : ImpException(msg)
    {
    }
}
