#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_blindness(int sn, int level, Character* ch, void* vo)
{
    Character* victim = (Character*)vo;
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    int tmp = 0;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (SPELL_FLAG(skill, SF_PKSENSITIVE)
        && !IsNpc(ch) && !IsNpc(victim))
        tmp = level;
    else
        tmp = level;

    if (victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    if (IsAffectedBy(victim, AFF_BLIND) || SaveVsSpellStaff(tmp, victim))
    {
        FailedCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    af->Type = sn;
    af->Location = APPLY_HITROLL;
    af->Modifier = -4;
    af->Duration = (1 + (level / 3)) * DUR_CONV;
    af->AffectedBy = AFF_BLIND;
    AffectToCharacter(victim, af);
    SetCharacterColor(AT_MAGIC, victim);
    victim->Echo("You are blinded!\r\n");

    if (ch != victim)
        ch->Echo("Ok.\r\n");

    return rNONE;
}

