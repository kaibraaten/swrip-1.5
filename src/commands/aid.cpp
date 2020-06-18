#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_aid(std::shared_ptr<Character> ch, std::string argument)
{
    Character *victim = nullptr;
    int percent = 0;

    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if(argument.empty())
    {
        ch->Echo("Aid whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, argument)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(ch->Mount)
    {
        ch->Echo("You can't do that while mounted.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("Aid yourself?\r\n");
        return;
    }

    if(victim->Position > POS_STUNNED)
    {
        Act(AT_PLAIN, "$N doesn't need your help.", ch, NULL, victim,
            ActTarget::Char);
        return;
    }

    if(victim->HitPoints.Current <= -400)
    {
        Act(AT_PLAIN, "$N's condition is beyond your aiding ability.", ch,
            NULL, victim, ActTarget::Char);
        return;
    }

    ch->Alignment = ch->Alignment + 20;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);

    percent = GetRandomPercent() - (GetCurrentLuck(ch) - 13);
    SetWaitState(ch, SkillTable[gsn_aid]->Beats);

    if(!IsNpc(ch) && percent > ch->PCData->Learned[gsn_aid])
    {
        ch->Echo("You fail.\r\n");
        LearnFromFailure(ch, gsn_aid);
        return;
    }

    ch->Alignment = ch->Alignment + 20;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);

    Act(AT_SKILL, "You aid $N!", ch, NULL, victim, ActTarget::Char);
    Act(AT_SKILL, "$n aids $N!", ch, NULL, victim, ActTarget::NotVict);
    LearnFromSuccess(ch, gsn_aid);

    if(victim->HitPoints.Current < 1)
        victim->HitPoints.Current = 1;

    UpdatePosition(victim);
    Act(AT_SKILL, "$n aids you!", ch, NULL, victim, ActTarget::Vict);
}

