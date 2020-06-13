#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "act.hpp"

void do_backstab(Character *ch, std::string arg)
{
    Character *victim = nullptr;
    Object *obj = nullptr;
    int percent = 0;

    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't do that right now.\r\n");
        return;
    }

    if(ch->Mount)
    {
        ch->Echo("You can't get close enough while mounted.\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("Backstab whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("How can you sneak up on yourself?\r\n");
        return;
    }

    if(IsSafe(ch, victim))
        return;

    /* Added stabbing weapon. -Narn */
    if((obj = GetEquipmentOnCharacter(ch, WEAR_WIELD)) == NULL
       || (obj->Value[OVAL_WEAPON_TYPE] != WEAPON_VIBRO_BLADE
           && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_FORCE_PIKE))
    {
        ch->Echo("You need to wield a stabbing weapon.\r\n");
        return;
    }

    if(victim->Fighting)
    {
        ch->Echo("You can't backstab someone who is in combat.\r\n");
        return;
    }

    /* Can backstab a char even if it's hurt as long as it's sleeping. -Narn */
    /* Or if it can't see you. -Ulysses */
    if(victim->HitPoints.Current < victim->HitPoints.Max
       && IsAwake(victim) && CanSeeCharacter(victim, ch))
    {
        Act(AT_PLAIN, "$N is hurt and suspicious... you can't sneak up.",
            ch, NULL, victim, TO_CHAR);
        return;
    }

    percent = GetRandomPercent() - (GetCurrentLuck(ch) - 14)
        + (GetCurrentLuck(victim) - 13);

    SetWaitState(ch, SkillTable[gsn_backstab]->Beats);

    if(!IsAwake(victim)
       || IsNpc(ch)
       || percent < ch->PCData->Learned[gsn_backstab])
    {
        LearnFromSuccess(ch, gsn_backstab);
        global_retcode = HitMultipleTimes(ch, victim, gsn_backstab);
    }
    else
    {
        LearnFromFailure(ch, gsn_backstab);
        global_retcode = InflictDamage(ch, victim, 0, gsn_backstab);
    }
}

