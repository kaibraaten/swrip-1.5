#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_punch(std::shared_ptr<Character> ch, std::string arg)
{
    Character *victim = NULL;

    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if(!IsNpc(ch)
       && ch->PCData->Learned[gsn_punch] <= 0)
    {
        ch->Echo("Your mind races as you realize you have no idea how to do that.\r\n");
        return;
    }

    if((victim = GetFightingOpponent(ch)) == NULL)
    {
        if(arg.empty())
        {
            ch->Echo("Punch whom?\r\n");
            return;
        }

        if((victim = GetCharacterInRoom(ch, arg)) == NULL)
        {
            ch->Echo("They aren't here.\r\n");
            return;
        }

        if(!IsNpc(victim))
        {
            ch->Echo("You must MURDER a player.\r\n");
            return;
        }

        if(victim == ch)
        {
            ch->Echo("You punch yourself. Ouch!\r\n");
            HitMultipleTimes(ch, ch, TYPE_UNDEFINED);
            return;
        }

        if(IsSafe(ch, victim))
            return;

        if(IsAffectedBy(ch, Flag::Affect::Charm) && ch->Master == victim)
        {
            Act(AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, ActTarget::Char);
            return;
        }

        if(victim->VipFlags != 0)
            ch->Alignment -= 10;
    }

    SetWaitState(ch, SkillTable[gsn_punch]->Beats);

    if(IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_punch])
    {
        LearnFromSuccess(ch, gsn_punch);
        global_retcode = InflictDamage(ch, victim, GetRandomNumberFromRange(1, GetAbilityLevel(ch, COMBAT_ABILITY)), gsn_punch);
    }
    else
    {
        LearnFromFailure(ch, gsn_punch);
        global_retcode = InflictDamage(ch, victim, 0, gsn_punch);
    }
}
