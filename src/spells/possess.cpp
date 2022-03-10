#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "descriptor.hpp"

extern std::string spell_target_name;

ch_ret spell_possess(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim;
    char buf[MAX_STRING_LENGTH];
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (caster->Desc->Original)
    {
        caster->Echo("You are not in your original state.\r\n");
        return rSPELL_FAILED;
    }

    if ((victim = GetCharacterInRoom(caster, spell_target_name)) == NULL)
    {
        caster->Echo("They aren't here!\r\n");
        return rSPELL_FAILED;
    }

    if (victim == caster)
    {
        caster->Echo("You can't possess yourself!\r\n");
        return rSPELL_FAILED;
    }

    if (!IsNpc(victim))
    {
        caster->Echo("You can't possess another player!\r\n");
        return rSPELL_FAILED;
    }

    if (IsDroid(victim))
    {
        caster->Echo("The brain of a machine confuses you.\r\n");
        return rSPELL_FAILED;
    }

    if (victim->Desc)
    {
        caster->Echo("%s is already possessed.\r\n", victim->ShortDescr.c_str());
        return rSPELL_FAILED;
    }

    if (victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    if (IsAffectedBy(victim, Flag::Affect::Possess)
        || level < (victim->TopLevel() + 30)
        || victim->Desc
        || !Chance(caster, 25))
    {
        FailedCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    caster->Echo("You feel the hatred grow within you as you twist your victim's mind!\r\n");
    caster->Alignment = caster->Alignment - 50;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    af->Type = sn;
    af->Duration = 20 + (GetAbilityLevel(caster, AbilityClass::Force) - victim->TopLevel()) / 2;
    af->Location = 0;
    af->Modifier = 0;
    af->AffectedBy = CreateBitSet<Flag::MAX>({Flag::Affect::Possess});
    AffectToCharacter(victim, af);

    sprintf(buf, "You have possessed %s!\r\n", victim->ShortDescr.c_str());

    caster->Desc->Char = victim;
    caster->Desc->Original = caster;
    victim->Desc = caster->Desc;
    caster->Desc = nullptr;
    caster->Switched = victim;
    victim->Echo("%s", buf);

    return rNONE;
}

