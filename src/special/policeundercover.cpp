#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"

bool spec_police_undercover(std::shared_ptr<Character> mob)
{
    if (!IsAwake(mob) || IsFighting(mob))
    {
        return false;
    }

    auto potentialCriminals = Filter(mob->InRoom->Characters(),
                                     [mob](auto victim)
                                     {
                                         return !IsNpc(victim)
                                                && CanSeeCharacter(mob, victim)
                                                && NumberBits(1) != 0;
                                     });

    for (auto victim : potentialCriminals)
    {
        for (size_t vip = 0; vip < Flag::MAX; vip++)
        {
            if (mob->VipFlags.test(vip) && victim->PCData->WantedOn.test(vip))
            {
                char buf[MAX_STRING_LENGTH];
                sprintf(buf, "Got you!");
                do_say(mob, buf);
                victim->PCData->WantedOn.reset(vip);
                HitMultipleTimes(mob, victim, TYPE_UNDEFINED);
                return true;
            }
        }
    }

    return false;
}

