#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"
#include "timer.hpp"

void do_postguard(std::shared_ptr<Character> ch, std::string argument)
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

        if(ch->Gold < GetAbilityLevel(ch, AbilityClass::Leadership) * 30)
        {
            ch->Echo("&RYou dont have enough credits.\r\n");
            return;
        }

        the_chance = GetSkillLevel(ch, gsn_postguard);

        if(GetRandomPercent() < the_chance)
        {
            ch->Echo("&GYou begin making the call for reinforcements.\r\n");
            Act(AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
                nullptr, argument, ActTarget::Room);
            AddTimer(ch, TimerType::Command, 1, do_postguard);
            return;
        }

        ch->Echo("&RYou call for a guard but nobody answers.\r\n");
        LearnFromFailure(ch, gsn_postguard);
        return;

    case CharacterSubState::Pause:
        break;

    case CharacterSubState::TimerDoAbort:
        ch->SubState = CharacterSubState::None;
        ch->Echo("&RYou are interupted before you can finish your call.\r\n");
        return;
    }

    ch->SubState = CharacterSubState::None;

    ch->Echo("&GYour guard is on the way.\r\n");

    credits = GetAbilityLevel(ch, AbilityClass::Leadership) * 30;
    ch->Echo("It cost you %d credits.\r\n", credits);
    ch->Gold -= umin(credits, ch->Gold);

    LearnFromSuccess(ch, gsn_postguard);

    clan = ch->PCData->ClanInfo.Clan->MainClan ? ch->PCData->ClanInfo.Clan->MainClan : ch->PCData->ClanInfo.Clan;

    if(!StrCmp(clan->Name, BADGUY_CLAN))
        ch->BackupMob = MOB_VNUM_IMP_GUARD;
    else if(!StrCmp(clan->Name, GOODGUY_CLAN))
        ch->BackupMob = MOB_VNUM_NR_GUARD;
    else
        ch->BackupMob = MOB_VNUM_BOUNCER;

    ch->BackupWait = 1;
}
