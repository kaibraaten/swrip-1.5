#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

bool spec_police_fine(std::shared_ptr<Character> mob)
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
                sprintf(buf, "Hey you're wanted on %s!", WantedFlags[vip]);
                do_say(mob, buf);
                Act(AT_ACTION, "$n fines $N an enormous amount of money.", mob, NULL, victim, ActTarget::NotVict);
                Act(AT_ACTION, "$n fines you an enourmous amount of money.", mob, NULL, victim, ActTarget::Vict);

                if (victim->InRoom && victim->InRoom->Area)
                {
                    BoostEconomy(victim->InRoom->Area, (victim->Gold) / 2);
                }

                victim->Gold /= 2;
                victim->PCData->WantedOn.reset(vip);
                return true;
            }
        }
    }

    return false;
}
