#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"
#include "timer.hpp"

void do_special_forces(std::shared_ptr<Character> ch, std::string argument)
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
            ch->Echo("&RYour reinforcements are already on the way.\r\n");
            return;
        }

        if(!IsClanned(ch))
        {
            ch->Echo("&RYou need to be a member of an organization before you can call for reinforcements.\r\n");
            return;
        }

        if(ch->Gold < GetAbilityLevel(ch, AbilityClass::Leadership) * 350)
        {
            ch->Echo("&RYou dont have enough credits to send for reinforcements.\r\n");
            return;
        }

        the_chance = GetSkillLevel(ch, gsn_specialforces);

        if(GetRandomPercent() < the_chance)
        {
            ch->Echo("&GYou begin making the call for reinforcements.\r\n");
            Act(AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
                nullptr, nullptr, ActTarget::Room);
            AddTimer(ch, TimerType::Command, 1, do_special_forces);
            return;
        }

        ch->Echo("&RYou call for reinforcements but nobody answers.\r\n");
        LearnFromFailure(ch, gsn_specialforces);
        return;

    case CharacterSubState::Pause:
        break;

    case CharacterSubState::TimerDoAbort:
        ch->SubState = CharacterSubState::None;
        ch->Echo("&RYou are interupted before you can finish your call.\r\n");
        return;
    }

    ch->SubState = CharacterSubState::None;

    ch->Echo("&GYour reinforcements are on the way.\r\n");
    credits = GetAbilityLevel(ch, AbilityClass::Leadership) * 350;
    ch->Echo("It cost you %d credits.\r\n", credits);
    ch->Gold -= umin(credits, ch->Gold);

    LearnFromSuccess(ch, gsn_specialforces);

    clan = ch->PCData->ClanInfo.Clan->MainClan ? ch->PCData->ClanInfo.Clan->MainClan : ch->PCData->ClanInfo.Clan;

    if(!StrCmp(clan->Name, BADGUY_CLAN))
        ch->BackupMob = MOB_VNUM_IMP_FORCES;
    else if(!StrCmp(clan->Name, GOODGUY_CLAN))
        ch->BackupMob = MOB_VNUM_NR_FORCES;
    else
        ch->BackupMob = MOB_VNUM_MERC_FORCES;

    ch->BackupWait = GetRandomNumberFromRange(1, 2);
}
