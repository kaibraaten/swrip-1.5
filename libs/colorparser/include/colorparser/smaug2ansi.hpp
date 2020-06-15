#ifndef _CERIS_CP_SMAUG2ANSI_HPP_
#define _CERIS_CP_SMAUG2ANSI_HPP_

#include "cp_internal.hpp"

namespace ColorParser
{

    class Smaug2Ansi
    {
    public:
        static Smaug2Ansi *Instance();
        std::string Parse(const std::string &);

    private:
        Smaug2Ansi();
        void FillMap(std::map<char, std::string> &, const char[],
                     const char * const[], size_t);

        std::map< char, AnsiMap > _MasterMap;
        AnsiMap _Foreground;
        AnsiMap _Background;
    };

}

#endif // include guard
