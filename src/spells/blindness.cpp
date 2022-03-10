#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_blindness(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    int tmp = 0;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (SPELL_FLAG(skill, SF_PKSENSITIVE)
        && !IsNpc(caster) && !IsNpc(victim))
    {
        tmp = level;
    }
    else
    {
        tmp = level;
    }

    if (victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    if (IsAffectedBy(victim, Flag::Affect::Blind) || SaveVsSpellStaff(tmp, victim))
    {
        FailedCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    af->Type = sn;
    af->Location = APPLY_HITROLL;
    af->Modifier = -4;
    af->Duration = (1 + (level / 3)) * DUR_CONV;
    af->AffectedBy = CreateBitSet<Flag::MAX>({Flag::Affect::Blind});
    AffectToCharacter(victim, af);
    SetCharacterColor(AT_MAGIC, victim);
    victim->Echo("You are blinded!\r\n");

    if (caster != victim)
    {
        caster->Echo("Ok.\r\n");
    }

    return rNONE;
}

