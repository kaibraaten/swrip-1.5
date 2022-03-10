#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

/*
 * Drain MOVE, MANA, HP.
 * Caster gains HP.
 */
ch_ret spell_energy_drain(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    int dam = 0;
    int drain_chance = 0;
    auto skill = GetSkill(sn);

    if(victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment = caster->Alignment - 200;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    drain_chance = ModifySavingThrowBasedOnResistance(victim, victim->TopLevel(), Flag::Ris::Drain);

    if(drain_chance == 1000 || SaveVsSpellStaff(drain_chance, victim))
    {
        FailedCasting(skill, caster, victim, NULL); /* SB */
        return rSPELL_FAILED;
    }

    if(victim->TopLevel() <= 2)
        dam = caster->HitPoints.Current + 1;
    else
    {
        victim->Mana.Current /= 2;
        victim->Fatigue.Current /= 2;
        dam = RollDice(1, level);
        caster->HitPoints.Current += dam;
    }

    if(caster->HitPoints.Current > caster->HitPoints.Max)
        caster->HitPoints.Current = caster->HitPoints.Max;

    if(IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(caster))
        dam -= (int)(dam / 4);

    return InflictDamage(caster, victim, dam, sn);
}

