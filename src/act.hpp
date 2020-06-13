#ifndef _SWRIP_ACT_HPP_
#define _SWRIP_ACT_HPP_

#include <string>
#include "types.hpp"

/*
 * TO types for act.
 */
constexpr auto TO_ROOM = 0;
constexpr auto TO_NOTVICT = 1;
constexpr auto TO_VICT = 2;
constexpr auto TO_CHAR = 3;

void Act(short AType, const std::string &format, Character *ch,
         const void *arg1, const void *arg2, int type);

#endif
