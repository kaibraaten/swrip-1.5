#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "timer.hpp"

bool spec_clan_guard(std::shared_ptr<Character> mob)
{
    if (!IsAwake(mob) || IsFighting(mob))
    {
        return false;
    }

    std::shared_ptr<Clan> clan = GetClan(mob->Name);
    auto charactersToActOn = mob->InRoom->Characters();
    auto includeThese = [mob](const auto &victim)
    {
        return CanSeeCharacter(mob, victim) && !HasTimer(victim, TimerType::RecentFight);
    };

    for (auto victim : charactersToActOn | std::views::filter(includeThese))
    {
        if (!IsNpc(victim)
            && IsClanned(victim)
            && clan
            && IsAwake(victim)
            && (clan != victim->PCData->ClanInfo.Clan)
            && (!victim->PCData->ClanInfo.Clan->MainClan
                || clan != victim->PCData->ClanInfo.Clan->MainClan)
            && (!clan->MainClan
                || clan->MainClan != victim->PCData->ClanInfo.Clan))
        {
            do_yell(mob, "Hey you're not allowed in here!");
            HitMultipleTimes(mob, victim, TYPE_UNDEFINED);
            return true;
        }
    }

    return false;
}
