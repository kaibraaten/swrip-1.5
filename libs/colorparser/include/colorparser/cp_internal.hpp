#ifndef _CP_INTERNAL_HPP_
#define _CP_INTERNAL_HPP_

#include <map>
#include <string>

namespace ColorParser
{
    typedef std::map<char, std::string> AnsiMap;
    typedef std::map<char, std::string> HtmlMap;

    extern const char SmaugSpecialTokens[];
    extern const char *const AnsiSpecialTokens[];
    extern const char SmaugForegroundTokens[];
    extern const char *const AnsiForegroundTokens[];
    extern const char SmaugBackgroundTokens[];
    extern const char *const AnsiBackgroundTokens[];

    size_t SmaugSpecialTokensSize();
    size_t AnsiSpecialTokensSize();
    size_t SmaugForegroundTokensSize();
    size_t AnsiForegroundTokensSize();
    size_t SmaugBackgroundTokensSize();
    size_t AnsiBackgroundTokensSize();
}

#endif // include guard
