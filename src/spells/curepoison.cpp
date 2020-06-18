#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "act.hpp"

ch_ret spell_cure_poison(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    Character *victim = vo.Ch;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if(victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    if(IsAffected(victim, gsn_poison))
    {
        if(ch != victim)
        {
            ch->Echo("The noble Jedi use their powers to help others!\r\n");
            ch->Alignment = ch->Alignment + 25;
            ch->Alignment = urange(-1000, ch->Alignment, 1000);
            ApplyJediBonus(ch);
        }

        StripAffect(victim, gsn_poison);
        Act(AT_MAGIC, "$N looks better.", ch, NULL, victim, ActTarget::NotVict);
        SetCharacterColor(AT_MAGIC, victim);
        victim->Echo("A warm feeling runs through your body.\r\n");
        victim->MentalState = urange(-100, victim->MentalState, -10);
        ch->Echo("Ok.\r\n");
        return rNONE;
    }
    else
        return rSPELL_FAILED;
}

