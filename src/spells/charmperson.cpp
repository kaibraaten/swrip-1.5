#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "act.hpp"

ch_ret spell_charm_person(int sn, int level, Character *ch, void *vo)
{
    Character *victim = (Character *)vo;
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    int charm_chance = 0;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if(victim == ch)
    {
        ch->Echo("You like yourself even better!\r\n");
        return rSPELL_FAILED;
    }

    if(victim->Immune.test(Flag::Ris::Magic)
       || victim->Immune.test(Flag::Ris::Charm))
    {
        ImmuneCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    if((!IsNpc(victim) && !IsNpc(ch)) || IsDroid(ch))
    {
        ch->Echo("I don't think so...\r\n");
        victim->Echo("You feel as if someone tried to enter your mind but failed..\r\n");
        return rSPELL_FAILED;
    }

    charm_chance = ModifySavingThrowBasedOnResistance(victim, level, Flag::Ris::Charm);

    if(IsAffectedBy(victim, Flag::Affect::Charm)
       || charm_chance == 1000
       || IsAffectedBy(ch, Flag::Affect::Charm)
       || level < victim->TopLevel
       || IsFollowingInCircle(victim, ch)
       || SaveVsSpellStaff(charm_chance, victim))
    {
        FailedCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    if(victim->Master)
        StopFollowing(victim);

    StartFollowing(victim, ch);
    af->Type = sn;
    af->Duration = (NumberFuzzy((level + 1) / 3) + 1) * DUR_CONV;
    af->Location = 0;
    af->Modifier = 0;
    af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Charm });
    AffectToCharacter(victim, af);
    Act(AT_MAGIC, "Isn't $n just so nice?", ch, NULL, victim, ActTarget::Vict);
    Act(AT_MAGIC, "$N's eyes glaze over...", ch, NULL, victim, ActTarget::Room);

    if(ch != victim)
        ch->Echo("Ok.\r\n");

    sprintf(buf, "%s has charmed %s.", ch->Name.c_str(), victim->Name.c_str());
    Log->LogStringPlus(buf, LOG_NORMAL, ch->TopLevel);

    return rNONE;
}
