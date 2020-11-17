#ifndef _CP_INTERNAL_HPP_
#define _CP_INTERNAL_HPP_

#include <map>
#include <string>
#include <vector>

namespace ColorParser
{
    typedef std::map<char, std::string> AnsiMap;
    typedef std::map<char, std::string> HtmlMap;

    extern const std::vector<char> SmaugSpecialTokens;
    extern const std::vector<const char*> AnsiSpecialTokens;
    extern const std::vector<char> SmaugForegroundTokens;
    extern const std::vector<const char*> AnsiForegroundTokens;
    extern const std::vector<char> SmaugBackgroundTokens;
    extern const std::vector<const char*> AnsiBackgroundTokens;
}

#endif // include guard
