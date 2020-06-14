#ifndef _SWRIP_ACT_HPP_
#define _SWRIP_ACT_HPP_

#include <string>
#include "types.hpp"

/*
 * TO types for act.
 */

enum class ActTarget
{
    Room,
    NotVict,
    Vict,
    Char
};

void Act(short AType, const std::string &format, Character *ch,
         const void *arg1, const void *arg2, ActTarget type);

#endif
