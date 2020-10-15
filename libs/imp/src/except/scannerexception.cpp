#include "imp/except/scannerexception.hpp"

namespace Imp
{
    ScannerException::ScannerException(const std::string &msg)
        : ImpException(msg)
    {
    }
}