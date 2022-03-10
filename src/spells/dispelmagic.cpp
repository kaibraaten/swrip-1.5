#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "race.hpp"

ch_ret spell_dispel_magic(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    int affected_by = 0;
    int cnt = 0;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    if (victim->AffectedBy.any() && caster == victim)
    {
        SetCharacterColor(AT_MAGIC, caster);
        caster->Echo("You pass your hands around your body...\r\n");

        while (!victim->Affects().empty())
        {
            RemoveAffect(victim, victim->Affects().front());
        }

        victim->AffectedBy = RaceTable[victim->Race].Affected;
        return rNONE;
    }
    else if (victim->AffectedBy.to_ulong() == RaceTable[victim->Race].Affected
             || level < victim->TopLevel()
             || SaveVsSpellStaff(level, victim))
    {
        FailedCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    if (!IsNpc(victim))
    {
        caster->Echo("You can't do that... yet.\r\n");
        return rSPELL_FAILED;
    }

    cnt = 0;

    for (;;)
    {
        affected_by = NumberBits(5);

        if (victim->AffectedBy.test(affected_by))
        {
            break;
        }

        if (cnt++ > 30)
        {
            FailedCasting(skill, caster, victim, NULL);
            return rNONE;
        }
    }


    victim->AffectedBy.reset(affected_by);
    SuccessfulCasting(skill, caster, victim, NULL);

    return rNONE;
}
