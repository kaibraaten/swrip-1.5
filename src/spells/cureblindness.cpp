#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_cure_blindness(int sn, int level, Character* ch, void* vo)
{
    Character* victim = (Character*)vo;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (IsBitSet(victim->Immune, RIS_MAGIC))
    {
        ImmuneCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    if (!IsAffected(victim, gsn_blindness))
        return rSPELL_FAILED;

    if (ch != victim)
    {
        ch->Echo("The noble Jedi use their powers to help others!\r\n");
        ch->Alignment = ch->Alignment + 25;
        ch->Alignment = urange(-1000, ch->Alignment, 1000);
        ApplyJediBonus(ch);
    }

    StripAffect(victim, gsn_blindness);
    SetCharacterColor(AT_MAGIC, victim);
    victim->Echo("Your vision returns!\r\n");

    if (ch != victim)
        ch->Echo("Ok.\r\n");

    return rNONE;
}

