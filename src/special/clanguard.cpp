#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "timer.hpp"

bool spec_clan_guard(std::shared_ptr<Character> ch)
{
    if(!IsAwake(ch) || IsFighting(ch))
        return false;

    std::shared_ptr<Clan> clan = GetClan(ch->Name);
    auto charactersToActOn = ch->InRoom->Characters();
    auto includeThese = [ch](const auto &victim)
    {
        return CanSeeCharacter(ch, victim) && !HasTimer(victim, TimerType::RecentFight);
    };

    for(auto victim : charactersToActOn | std::views::filter(includeThese))
    {
        if(!IsNpc(victim)
           && IsClanned(victim)
           && clan
           && IsAwake(victim)
           && (clan != victim->PCData->ClanInfo.Clan)
           && (!victim->PCData->ClanInfo.Clan->MainClan
               || clan != victim->PCData->ClanInfo.Clan->MainClan)
           && (!clan->MainClan
               || clan->MainClan != victim->PCData->ClanInfo.Clan))
        {
            do_yell(ch, "Hey you're not allowed in here!");
            HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
            return true;
        }
    }

    return false;
}
