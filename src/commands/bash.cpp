#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_bash(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Character> victim;
    auto ability = SkillTable[gsn_bash]->Class;
    
    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if(!IsNpc(ch)
       && GetSkillLevel(ch, gsn_bash) <= 0)
    {
        ch->Echo("Your mind races as you realize you have no idea how to do that.\r\n");
        return;
    }

    if((victim = WhoFighting(ch)) == nullptr)
    {
        ch->Echo("You aren't fighting anyone.\r\n");
        return;
    }

    int bash_chance = (((GetCurrentDexterity(victim) + GetCurrentStrength(victim))
                        - (GetCurrentDexterity(ch) + GetCurrentStrength(ch))) * 10) + 10;

    if(!IsNpc(ch) && !IsNpc(victim))
        bash_chance += 25;

    if(IsFighting(victim) && WhoFighting(victim) != ch)
        bash_chance += 19;

    SetWaitState(ch, SkillTable[gsn_bash]->Beats);

    if(IsNpc(ch)
       || (GetRandomPercent() + bash_chance) < GetSkillLevel(ch, gsn_bash))
    {
        LearnFromSuccess(ch, gsn_bash);
        /* do not change anything here!  -Thoric */
        SetWaitState(ch, 2 * PULSE_VIOLENCE);
        SetWaitState(victim, 2 * PULSE_VIOLENCE);
        victim->Position = POS_SITTING;
        global_retcode = InflictDamage(ch, victim, GetRandomNumberFromRange(1, GetAbilityLevel(ch, ability)), gsn_bash);
    }
    else
    {
        SetWaitState(ch, 2 * PULSE_VIOLENCE);
        LearnFromFailure(ch, gsn_bash);
        global_retcode = InflictDamage(ch, victim, 0, gsn_bash);
    }
}

