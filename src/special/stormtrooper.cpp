#include <utility/algorithms.hpp>
#include <vector>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "timer.hpp"

bool spec_stormtrooper(std::shared_ptr<Character> mob)
{
    if (!IsAwake(mob) || IsFighting(mob))
    {
        return false;
    }

    std::vector<std::shared_ptr<Character>> rebels(std::begin(mob->InRoom->Characters()),
                                                   std::end(mob->InRoom->Characters()));

    rebels = Filter(rebels,
                    [mob](auto victim)
                    {
                        return CanSeeCharacter(mob, victim)
                               && !HasTimer(victim, TimerType::RecentFight)
                               && ((IsNpc(victim)
                                    && (NiftyIsName("rebel", victim->Name)
                                        || NiftyIsName("republic", victim->Name))
                                    && IsFighting(victim)
                                    && WhoFighting(victim) != mob)
                                   || (!IsNpc(victim) && IsClanned(victim)
                                       && IsAwake(victim)
                                       && (NiftyIsName("rebel", victim->PCData->ClanInfo.Clan->Name)
                                           || NiftyIsName("republic", victim->PCData->ClanInfo.Clan->Name))));
                    });

    for (auto victim : RandomizeOrder(rebels))
    {
        do_yell(mob, "Die Rebel Scum!");
        HitMultipleTimes(mob, victim, TYPE_UNDEFINED);
        return true;
    }

    return false;
}
