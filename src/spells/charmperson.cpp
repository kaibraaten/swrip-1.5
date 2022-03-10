#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "act.hpp"

ch_ret spell_charm_person(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    int charm_chance = 0;
    char buf[MAX_STRING_LENGTH] = {'\0'};
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (victim == caster)
    {
        caster->Echo("You like yourself even better!\r\n");
        return rSPELL_FAILED;
    }

    if (victim->Immune.test(Flag::Ris::Magic)
        || victim->Immune.test(Flag::Ris::Charm))
    {
        ImmuneCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    if ((!IsNpc(victim) && !IsNpc(caster)) || IsDroid(caster))
    {
        caster->Echo("I don't think so...\r\n");
        victim->Echo("You feel as if someone tried to enter your mind but failed..\r\n");
        return rSPELL_FAILED;
    }

    charm_chance = ModifySavingThrowBasedOnResistance(victim, level, Flag::Ris::Charm);

    if (IsAffectedBy(victim, Flag::Affect::Charm)
        || charm_chance == 1000
        || IsAffectedBy(caster, Flag::Affect::Charm)
        || level < victim->TopLevel()
        || IsFollowingInCircle(victim, caster)
        || SaveVsSpellStaff(charm_chance, victim))
    {
        FailedCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    if (victim->Master)
    {
        StopFollowing(victim);
    }

    StartFollowing(victim, caster);
    af->Type = sn;
    af->Duration = (NumberFuzzy((level + 1) / 3) + 1) * DUR_CONV;
    af->Location = 0;
    af->Modifier = 0;
    af->AffectedBy = CreateBitSet<Flag::MAX>({Flag::Affect::Charm});
    AffectToCharacter(victim, af);
    Act(AT_MAGIC, "Isn't $n just so nice?", caster, NULL, victim, ActTarget::Vict);
    Act(AT_MAGIC, "$N's eyes glaze over...", caster, NULL, victim, ActTarget::Room);

    if (caster != victim)
    {
        caster->Echo("Ok.\r\n");
    }

    sprintf(buf, "%s has charmed %s.", caster->Name.c_str(), victim->Name.c_str());
    Log->LogStringPlus(buf, LogType::Normal, caster->TopLevel());

    return rNONE;
}
