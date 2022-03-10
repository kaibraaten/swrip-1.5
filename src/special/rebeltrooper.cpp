#include <utility/algorithms.hpp>
#include <vector>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "timer.hpp"

bool spec_rebel_trooper(std::shared_ptr<Character> mob)
{
    if (!IsAwake(mob) || IsFighting(mob))
    {
        return false;
    }

    std::vector<std::shared_ptr<Character>> imperials(std::begin(mob->InRoom->Characters()),
                                                      std::end(mob->InRoom->Characters()));

    imperials = Filter(imperials,
                       [mob](auto victim)
                       {
                           return CanSeeCharacter(mob, victim)
                                  && !HasTimer(victim, TimerType::RecentFight)
                                  && ((IsNpc(victim) && NiftyIsName("imperial", victim->Name)
                                       && IsFighting(victim) && WhoFighting(victim) != mob)
                                      || (!IsNpc(victim) && IsClanned(victim) && IsAwake(victim)
                                          && NiftyIsName("empire", victim->PCData->ClanInfo.Clan->Name)));
                       });

    for (auto victim : RandomizeOrder(imperials))
    {
        do_yell(mob, "Long live the Rebel Alliance!");
        HitMultipleTimes(mob, victim, TYPE_UNDEFINED);
        return true;
    }

    return false;
}
