#include <utility/random.hpp>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"
#include "timer.hpp"

void do_add_patrol(std::shared_ptr<Character> ch, std::string argument)
{
    int the_chance, credits;
    std::shared_ptr<Clan> clan;

    if(IsNpc(ch) || !ch->PCData)
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

        the_chance = GetSkillLevel(ch, gsn_addpatrol);

        if(GetRandomPercent() < the_chance)
        {
            ch->Echo("&GYou begin making the call for reinforcements.\r\n");
            Act(AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
                nullptr, argument, ActTarget::Room);
            AddTimer(ch, TimerType::Command, 1, do_add_patrol);
            return;
        }

        ch->Echo("&RYou call for a guard but nobody answers.\r\n");
        LearnFromFailure(ch, gsn_addpatrol);
        return;

    case CharacterSubState::Pause:
        break;

    case CharacterSubState::TimerDoAbort:
        ch->SubState = CharacterSubState::None;
        ch->Echo("&RYou are interrupted before you can finish your call.\r\n");
        return;
    }

    ch->SubState = CharacterSubState::None;

    ch->Echo("&GYour guard is on the way.\r\n");

    credits = GetAbilityLevel(ch, AbilityClass::Leadership) * 30;
    ch->Echo("It costs you %d credits.\r\n", credits);
    ch->Gold -= umin(credits, ch->Gold);

    LearnFromSuccess(ch, gsn_addpatrol);

    clan = ch->PCData->ClanInfo.Clan->MainClan ? ch->PCData->ClanInfo.Clan->MainClan : ch->PCData->ClanInfo.Clan;

    if(!StrCmp(BADGUY_CLAN, clan->Name))
    {
        ch->BackupMob = MOB_VNUM_IMP_PATROL;
    }
    else if(!StrCmp(GOODGUY_CLAN, clan->Name))
    {
        ch->BackupMob = MOB_VNUM_NR_PATROL;
    }
    else
    {
        ch->BackupMob = MOB_VNUM_MERC_PATROL;
    }

    ch->BackupWait = 1;
}
