#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "act.hpp"

ch_ret spell_dispel_evil(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    int dam = 0;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if(!IsNpc(ch) && IsEvil(ch))
        victim = ch;

    if(IsGood(victim))
    {
        Act(AT_MAGIC, "The light side protects $N.", ch, NULL, victim, ActTarget::Room);
        return rSPELL_FAILED;
    }

    if(IsNeutral(victim))
    {
        Act(AT_MAGIC, "$N does not seem to be affected.", ch, NULL, victim, ActTarget::Char);
        return rSPELL_FAILED;
    }

    if(victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    dam = RollDice(level, 4);

    if(SaveVsSpellStaff(level, victim))
        dam /= 2;

    return InflictDamage(ch, victim, dam, sn);
}
