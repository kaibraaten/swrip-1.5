#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "act.hpp"

ch_ret spell_know_alignment(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    Character *victim = vo.Ch;
    const char *msg = nullptr;
    int ap = 0;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if(!victim)
    {
        FailedCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    if(victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    ap = victim->Alignment;

    if(ap > 700) msg = "$N has an aura as white as the driven snow.";
    else if(ap > 350) msg = "$N is of excellent moral character.";
    else if(ap > 100) msg = "$N is often kind and thoughtful.";
    else if(ap > -100) msg = "$N doesn't have a firm moral commitment.";
    else if(ap > -350) msg = "$N lies to $S friends.";
    else if(ap > -700) msg = "$N's slash DISEMBOWELS you!";
    else msg = "I'd rather just not say anything at all about $N.";

    Act(AT_MAGIC, msg, ch, NULL, victim, ActTarget::Char);
    return rNONE;
}
