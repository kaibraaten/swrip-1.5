#ifndef _CERIS_CP_SMAUG2HTML_HPP_
#define _CERIS_CP_SMAUG2HTML_HPP_

#include "cp_internal.hpp"

namespace ColorParser
{
    class Smaug2Html
    {
    public:
        static Smaug2Html *Instance();
        std::string Parse(const std::string &);

    private:
        Smaug2Html();
        void FillMap(std::map< char, std::string > &, const char[],
                     const char *const [], size_t);
        std::string MakeColourTag() const;
        std::map< char, HtmlMap > _MasterMap;
        HtmlMap _Foreground;
        HtmlMap _Background;
        std::string _CurrentFg;
        std::string _CurrentBk;
    };
}

#endif // include guard
