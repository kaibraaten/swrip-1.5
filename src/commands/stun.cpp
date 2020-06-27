#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "systemdata.hpp"
#include "act.hpp"

void do_stun(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Character> victim;
    int stun_chance = 0;
    bool fail = false;

    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if(!IsNpc(ch)
       && ch->PCData->Learned[gsn_stun] <= 0)
    {
        ch->Echo("Your mind races as you realize you have no idea how to do that.\r\n");
        return;
    }

    if((victim = WhoFighting(ch)) == NULL)
    {
        ch->Echo("You aren't fighting anyone.\r\n");
        return;
    }

    if(ch->Fatigue.Current < 16)
    {
        SetCharacterColor(AT_SKILL, ch);
        ch->Echo("You are far too tired to do that.\r\n");
        return;           /* missing return fixed March 11/96 */
    }

    SetWaitState(ch, SkillTable[gsn_stun]->Beats);
    fail = false;
    stun_chance = ModifySavingThrowBasedOnResistance(victim, GetAbilityLevel(ch, COMBAT_ABILITY), Flag::Ris::Paralysis);

    if(stun_chance == 1000)
        fail = true;
    else
        fail = SaveVsParalyze(stun_chance, victim);

    stun_chance = (((GetCurrentDexterity(victim) + GetCurrentStrength(victim))
                    - (GetCurrentDexterity(ch) + GetCurrentStrength(ch))) * 10) + 10;

    /* harder for player to stun another player */
    if(!IsNpc(ch) && !IsNpc(victim))
        stun_chance += SysData.StunModPlrVsPlr;
    else
        stun_chance += SysData.StunRegular;

    if(!fail
       && (IsNpc(ch)
           || (GetRandomPercent() + stun_chance) < ch->PCData->Learned[gsn_stun]))
    {
        LearnFromSuccess(ch, gsn_stun);
        /*    DO *NOT* CHANGE!    -Thoric    */
        ch->Fatigue.Current -= 15;
        SetWaitState(ch, 2 * PULSE_VIOLENCE);
        SetWaitState(victim, PULSE_VIOLENCE);
        Act(AT_SKILL, "$N smashes into you, leaving you stunned!", victim, NULL, ch, ActTarget::Char);
        Act(AT_SKILL, "You smash into $N, leaving $M stunned!", ch, NULL, victim, ActTarget::Char);
        Act(AT_SKILL, "$n smashes into $N, leaving $M stunned!", ch, NULL, victim, ActTarget::NotVict);

        if(!IsAffectedBy(victim, Flag::Affect::Paralysis))
        {
            std::shared_ptr<Affect> af = std::make_shared<Affect>();
            af->Type = gsn_stun;
            af->Location = APPLY_AC;
            af->Modifier = 20;
            af->Duration = 3;
            af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Paralysis });
            AffectToCharacter(victim, af);
            UpdatePosition(victim);
        }
    }
    else
    {
        SetWaitState(ch, 2 * PULSE_VIOLENCE);
        ch->Fatigue.Current -= 5;
        LearnFromFailure(ch, gsn_stun);
        Act(AT_SKILL, "$N charges at you screaming, but you dodge out of the way.", victim, NULL, ch, ActTarget::Char);
        Act(AT_SKILL, "Your attempt to stun $N leaves you racing past $E as $e laughs.", ch, NULL, victim, ActTarget::Char);
        Act(AT_SKILL, "$n charges screaming at $N, but keeps going right on past.", ch, NULL, victim, ActTarget::NotVict);
    }
}
