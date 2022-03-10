#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

ch_ret spell_harm(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment = caster->Alignment - 100;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);


    int dam = umax(20, victim->HitPoints.Current - RollDice(1, 4));

    if (SaveVsSpellStaff(level, victim))
    {
        dam = umin(50, dam / 4);
    }

    dam = umin(100, dam);

    if (IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(caster))
    {
        dam -= (int) (dam / 4);
    }

    return InflictDamage(caster, victim, dam, sn);
}
