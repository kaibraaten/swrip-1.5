#ifndef _SWRIP_SOCIAL_HPP_
#define _SWRIP_SOCIAL_HPP_

#include <string>
#include "types.hpp"

class Social
{
public:
    std::string Name;
    std::string CharNoArg;
    std::string OthersNoArg;
    std::string CharFound;
    std::string OthersFound;
    std::string VictimFound;
    std::string CharAuto;
    std::string OthersAuto;
};

bool CheckSocial(std::shared_ptr<Character> ch, const std::string &command, const std::string &argument);

#endif
