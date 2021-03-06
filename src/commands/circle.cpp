#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "act.hpp"

void do_circle(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Character> victim;
    std::shared_ptr<Object> obj;
    int percent = 0;

    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    OneArgument(argument, arg);

    if(ch->Mount)
    {
        ch->Echo("You can't circle while mounted.\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("Circle around whom?\r\n");
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

    if((obj = GetEquipmentOnCharacter(ch, WEAR_WIELD)) == NULL
       || (obj->Value[OVAL_WEAPON_TYPE] != WEAPON_FORCE_PIKE
           && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_VIBRO_BLADE))
    {
        ch->Echo("You need to wield a piercing or stabbing weapon.\r\n");
        return;
    }

    if(!IsFighting(ch))
    {
        ch->Echo("You can't circle when you aren't fighting.\r\n");
        return;
    }

    if(!IsFighting(victim))
    {
        ch->Echo("You can't circle around a person who is not fighting.\r\n");
        return;
    }

    if(NumFighting(victim) < 2)
    {
        Act(AT_PLAIN, "You can't circle around them without a distraction.",
            ch, NULL, victim, ActTarget::Char);
        return;
    }

    percent = GetRandomPercent() - (GetCurrentLuck(ch) - 16)
        + (GetCurrentLuck(victim) - 13);

    SetWaitState(ch, SkillTable[gsn_circle]->Beats);
    auto ability = SkillTable[gsn_circle]->Class;
    
    if(percent < (IsNpc(ch) ? (GetAbilityLevel(ch, ability) * 1.5) : GetSkillLevel(ch, gsn_circle)))
    {
        LearnFromSuccess(ch, gsn_circle);
        global_retcode = HitMultipleTimes(ch, victim, gsn_circle);
    }
    else
    {
        LearnFromFailure(ch, gsn_circle);
        global_retcode = InflictDamage(ch, victim, 0, gsn_circle);
    }
}
