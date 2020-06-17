#ifndef _SWRIP_BAN_HPP_
#define _SWRIP_BAN_HPP_

#include <string>

class Ban
{
public:
    std::string Site;
    int Level = 0;
    std::string BanTime;
};

#endif
