#ifndef _CERIS_CP_SMAUG_STRIPPER_HPP_
#define _CERIS_CP_SMAUG_STRIPPER_HPP_

#include "cp_internal.hpp"

namespace ColorParser
{
    class SmaugStripper
    {
    public:
        static SmaugStripper *Instance();
        std::string Parse(const std::string &);

    private:
        SmaugStripper();
        void FillMap(std::map<char, std::string> &, const std::vector<char>&);
        std::map<char, AnsiMap> _MasterMap;
        AnsiMap _Foreground;
        AnsiMap _Background;
    };
}

#endif // include guard

