#include "passthrough.hpp"

ColorParser::Passthrough *ColorParser::Passthrough::Instance()
{
    static Passthrough _Instance;
    return &_Instance;
}

std::string ColorParser::Passthrough::Parse(const std::string &original)
{
    return original;
}
