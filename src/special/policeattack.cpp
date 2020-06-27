#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "room.hpp"

bool spec_police_attack(std::shared_ptr<Character> ch)
{
    if(!IsAwake(ch) || IsFighting(ch))
        return false;

    auto potentialCriminals = Filter(ch->InRoom->Characters(),
                                     [ch](auto victim)
                                     {
                                         return !IsNpc(victim)
                                             && CanSeeCharacter(ch, victim)
                                             && NumberBits(1) != 0;
                                     });

    for(auto victim : potentialCriminals)
    {
        for(size_t vip = 0; vip < Flag::MAX; vip++)
        {
            if(ch->VipFlags.test(vip) && victim->PCData->WantedOn.test(vip))
            {
                char buf[MAX_STRING_LENGTH];
                sprintf(buf, "Hey you're wanted on %s!", WantedFlags[vip]);
                do_say(ch, buf);
                victim->PCData->WantedOn.reset(vip);
                HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
                return true;
            }
        }
    }

    return false;
}

