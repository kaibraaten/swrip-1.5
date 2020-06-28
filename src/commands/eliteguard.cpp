#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_elite_guard(std::shared_ptr<Character> ch, std::string arg)
{
    int the_chance = 0, credits = 0;
    std::shared_ptr<Clan> clan;

    if(IsNpc(ch))
        return;

    switch(ch->SubState)
    {
    default:
        if(ch->BackupWait)
        {
            ch->Echo("&RYou already have backup coming.\r\n");
            return;
        }

        if(!IsClanned(ch))
        {
            ch->Echo("&RYou need to be a member of an organization before you can call for a guard.\r\n");
            return;
        }

        if(ch->Gold < GetAbilityLevel(ch, LEADERSHIP_ABILITY) * 200)
        {
            ch->Echo("&RYou don't have enough credits.\r\n");
            return;
        }

        the_chance = GetSkillLevel(ch, gsn_eliteguard);

        if(GetRandomPercent() < the_chance)
        {
            ch->Echo("&GYou begin making the call for reinforcements.\r\n");
            Act(AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
                NULL, arg, ActTarget::Room);
            AddTimerToCharacter(ch, TIMER_CMD_FUN, 1, do_elite_guard, SUB_PAUSE);
            return;
        }

        ch->Echo("&RYou call for a guard but nobody answers.\r\n");
        LearnFromFailure(ch, gsn_eliteguard);
        return;

    case SUB_PAUSE:
        break;

    case SUB_TIMER_DO_ABORT:
        ch->SubState = SUB_NONE;
        ch->Echo("&RYou are interupted before you can finish your call.\r\n");
        return;
    }

    ch->SubState = SUB_NONE;

    ch->Echo("&GYour guard is on the way.\r\n");

    credits = GetAbilityLevel(ch, LEADERSHIP_ABILITY) * 200;
    ch->Echo("It cost you %d credits.\r\n", credits);
    ch->Gold -= umin(credits, ch->Gold);

    LearnFromSuccess(ch, gsn_eliteguard);

    clan = ch->PCData->ClanInfo.Clan->MainClan ? ch->PCData->ClanInfo.Clan->MainClan : ch->PCData->ClanInfo.Clan;

    if(!StrCmp(clan->Name, BADGUY_CLAN))
        ch->BackupMob = MOB_VNUM_IMP_ELITE;
    else if(!StrCmp(clan->Name, GOODGUY_CLAN))
        ch->BackupMob = MOB_VNUM_NR_ELITE;
    else
        ch->BackupMob = MOB_VNUM_MERC_ELITE;

    ch->BackupWait = 1;
}
