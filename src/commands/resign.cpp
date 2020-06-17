#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "repos/playerrepository.hpp"
#include "act.hpp"

void do_resign(Character *ch, std::string argument)
{
    std::shared_ptr<Clan> clan;
    long xp_to_lose = 0;
    long xp_actually_lost = 0;

    if(IsNpc(ch))
    {
        ch->Echo("You can't do that.\r\n");
        return;
    }

    if(!IsClanned(ch))
    {
        ch->Echo("You have to join an organization before you can quit it.\r\n");
        return;
    }

    clan = ch->PCData->ClanInfo.Clan;

    if(!StrCmp(ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Leader))
    {
        ch->Echo("You can't resign from %s. You are the leader!\r\n", clan->Name.c_str());
        return;
    }

    if(ch->Speaking & LANG_CLAN)
        ch->Speaking = LANG_COMMON;

    RemoveBit(ch->Speaks, LANG_CLAN);

    if(!StrCmp(ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Number1))
    {
        ch->PCData->ClanInfo.Clan->Leadership.Number1.erase();
    }

    if(!StrCmp(ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Number2))
    {
        ch->PCData->ClanInfo.Clan->Leadership.Number2.erase();
    }

    RemoveClanMember(ch);
    ch->PCData->ClanInfo.Clan = NULL;
    ch->PCData->ClanInfo.ClanName.erase();
    Act(AT_MAGIC, "You resign your position in $t",
        ch, clan->Name, nullptr, ActTarget::Char);

    xp_to_lose = umax(GetAbilityXP(ch, DIPLOMACY_ABILITY) - GetRequiredXpForLevel(GetAbilityLevel(ch, DIPLOMACY_ABILITY)), 0);
    xp_actually_lost = LoseXP(ch, DIPLOMACY_ABILITY, xp_to_lose);
    ch->Echo("You lose %ld diplomacy experience.\r\n", xp_actually_lost);

    ch->PCData->Bestowments.erase();
    PlayerCharacters->Save(ch);
}

