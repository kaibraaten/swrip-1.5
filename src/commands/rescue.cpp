#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_rescue(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;
    int percent = 0;

    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("Rescue whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("You try and rescue yourself, but fail miserably.\r\n");
        return;
    }

    if(ch->Mount)
    {
        ch->Echo("You can't do that while mounted.\r\n");
        return;
    }

    if(!IsNpc(ch) && IsNpc(victim))
    {
        ch->Echo("Doesn't need your help!\r\n");
        return;
    }

    std::shared_ptr<Character> fch;

    if((fch = WhoFighting(victim)) == NULL)
    {
        ch->Echo("They are not fighting right now.\r\n");
        return;
    }

    if(ch == fch)
    {
        ch->Echo("Rescue them from yourself?\r\n");
        return;
    }

    ch->Alignment += 5;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);

    percent = GetRandomPercent() - (GetCurrentLuck(ch) - 14)
        - (GetCurrentLuck(victim) - 16);

    SetWaitState(ch, SkillTable[gsn_rescue]->Beats);

    if(!IsNpc(ch) && percent > GetSkillLevel(ch, gsn_rescue))
    {
        ch->Echo("You fail the rescue.\r\n");
        Act(AT_SKILL, "$n tries to rescue you!", ch, NULL, victim, ActTarget::Vict);
        Act(AT_SKILL, "$n tries to rescue $N!", ch, NULL, victim, ActTarget::NotVict);
        LearnFromFailure(ch, gsn_rescue);
        return;
    }

    Act(AT_SKILL, "You rescue $N!", ch, NULL, victim, ActTarget::Char);
    Act(AT_SKILL, "$n rescues you!", ch, NULL, victim, ActTarget::Vict);
    Act(AT_SKILL, "$n moves in front of $N!", ch, NULL, victim, ActTarget::NotVict);

    ch->Alignment += 50;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);

    LearnFromSuccess(ch, gsn_rescue);
    StopFighting(fch, false);
    StopFighting(victim, false);

    if(IsFighting(ch))
        StopFighting(ch, false);

    StartFighting(ch, fch);
    StartFighting(fch, ch);
}
