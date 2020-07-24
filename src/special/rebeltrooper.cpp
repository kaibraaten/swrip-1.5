#include <utility/algorithms.hpp>
#include <vector>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "timer.hpp"

bool spec_rebel_trooper(std::shared_ptr<Character> ch)
{
    if(!IsAwake(ch) || IsFighting(ch))
        return false;

    std::vector<std::shared_ptr<Character>> imperials(std::begin(ch->InRoom->Characters()),
                                                      std::end(ch->InRoom->Characters()));

    imperials = Filter(imperials,
                       [ch](auto victim)
                       {
                           return CanSeeCharacter(ch, victim)
                           &&!HasTimer(victim, TimerType::RecentFight)
                           && ((IsNpc(victim) && NiftyIsName("imperial", victim->Name)
                                && IsFighting(victim) && WhoFighting(victim) != ch)
                               || (!IsNpc(victim) && IsClanned(victim) && IsAwake(victim)
                                   && NiftyIsName("empire", victim->PCData->ClanInfo.Clan->Name)));
                       });

    for(auto victim : RandomizeOrder(imperials))
    {
        do_yell(ch, "Long live the Rebel Alliance!");
        HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
        return true;
    }

    return false;
}
