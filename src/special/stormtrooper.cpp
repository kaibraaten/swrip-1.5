#include <utility/algorithms.hpp>
#include <vector>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "timer.hpp"

bool spec_stormtrooper(std::shared_ptr<Character> ch)
{
    if(!IsAwake(ch) || IsFighting(ch))
        return false;

    std::vector<std::shared_ptr<Character>> rebels(std::begin(ch->InRoom->Characters()),
                                                   std::end(ch->InRoom->Characters()));

    rebels = Filter(rebels,
                    [ch](auto victim)
                    {
                        return CanSeeCharacter(ch, victim)
                        && !HasTimer(victim, TimerType::RecentFight)
                        && ((IsNpc(victim)
                             && (NiftyIsName("rebel", victim->Name)
                                 || NiftyIsName("republic", victim->Name))
                             && IsFighting(victim)
                             && WhoFighting(victim) != ch)
                            || (!IsNpc(victim) && IsClanned(victim)
                                && IsAwake(victim)
                                && (NiftyIsName("rebel", victim->PCData->ClanInfo.Clan->Name)
                                    || NiftyIsName("republic", victim->PCData->ClanInfo.Clan->Name))));
                    });

    for(auto victim : RandomizeOrder(rebels))
    {
        do_yell(ch, "Die Rebel Scum!");
        HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
        return true;
    }

    return false;
}
