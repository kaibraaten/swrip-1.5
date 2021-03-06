#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "descriptor.hpp"

extern std::string spell_target_name;

ch_ret spell_possess(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Character> victim;
    char buf[MAX_STRING_LENGTH];
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if(ch->Desc->Original)
    {
        ch->Echo("You are not in your original state.\r\n");
        return rSPELL_FAILED;
    }

    if((victim = GetCharacterInRoom(ch, spell_target_name)) == NULL)
    {
        ch->Echo("They aren't here!\r\n");
        return rSPELL_FAILED;
    }

    if(victim == ch)
    {
        ch->Echo("You can't possess yourself!\r\n");
        return rSPELL_FAILED;
    }

    if(!IsNpc(victim))
    {
        ch->Echo("You can't possess another player!\r\n");
        return rSPELL_FAILED;
    }

    if(IsDroid(victim))
    {
        ch->Echo("The brain of a machine confuses you.\r\n");
        return rSPELL_FAILED;
    }

    if(victim->Desc)
    {
        ch->Echo("%s is already possessed.\r\n", victim->ShortDescr.c_str());
        return rSPELL_FAILED;
    }

    if(victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    if(IsAffectedBy(victim, Flag::Affect::Possess)
       || level < (victim->TopLevel() + 30)
       || victim->Desc
       || !Chance(ch, 25))
    {
        FailedCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    ch->Echo("You feel the hatred grow within you as you twist your victims mind!\r\n");
    ch->Alignment = ch->Alignment - 50;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);
    ApplySithPenalty(ch);

    af->Type = sn;
    af->Duration = 20 + (GetAbilityLevel(ch, AbilityClass::Force) - victim->TopLevel()) / 2;
    af->Location = 0;
    af->Modifier = 0;
    af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Possess });
    AffectToCharacter(victim, af);

    sprintf(buf, "You have possessed %s!\r\n", victim->ShortDescr.c_str());

    ch->Desc->Char = victim;
    ch->Desc->Original = ch;
    victim->Desc = ch->Desc;
    ch->Desc = NULL;
    ch->Switched = victim;
    victim->Echo("%s", buf);

    return rNONE;
}

