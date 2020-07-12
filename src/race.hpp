#ifndef _SWRIP_RACE_HPP_
#define _SWRIP_RACE_HPP_

#include <array>
#include "constants.hpp"

class Race
{
public:
    const char *Name;
    int Affected = 0;               /* Default affect bitvectors    */

    struct
    {
        short ModStr = 0;               /* Str bonus/penalty            */
        short ModDex = 0;               /* Dex      "                   */
        short ModWis = 0;               /* Wis      "                   */
        short ModInt = 0;               /* Int      "                   */
        short ModCon = 0;               /* Con      "                   */
        short ModCha = 0;               /* Cha      "                   */
        short ModLck = 0;               /* Lck      "                   */
        short ModFrc = 0;               /* Frc      "                   */
    } Stats;

    std::array<int, (int)AbilityClass::Max> AbilityMod;

    short Hit = 0;
    short Mana = 0;
    int Resistant = 0;
    int Susceptible = 0;
    int ClassRestriction = 0;       /* Flags for illegal classes    */
    int Language = 0;               /* Default racial language      */
    bool AvailableForSelection = false;   /* Race can be selected by players */
};

extern const std::array<const Race, MAX_RACE> RaceTable;

#endif
