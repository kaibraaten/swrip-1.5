#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_cure_blindness(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    if (!IsAffected(victim, gsn_blindness))
    {
        return rSPELL_FAILED;
    }

    if (caster != victim)
    {
        caster->Echo("The noble Jedi use their powers to help others!\r\n");
        caster->Alignment = caster->Alignment + 25;
        caster->Alignment = urange(-1000, caster->Alignment, 1000);
        ApplyJediBonus(caster);
    }

    StripAffect(victim, gsn_blindness);
    SetCharacterColor(AT_MAGIC, victim);
    victim->Echo("Your vision returns!\r\n");

    if (caster != victim)
    {
        caster->Echo("Ok.\r\n");
    }

    return rNONE;
}
