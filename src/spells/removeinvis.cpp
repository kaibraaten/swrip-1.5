#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "object.hpp"
#include "act.hpp"

extern std::string spell_target_name;

ch_ret spell_remove_invis(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if(spell_target_name.empty())
    {
        ch->Echo("What should the spell be cast upon?\r\n");
        return rSPELL_FAILED;
    }

    auto obj = GetCarriedObject(ch, spell_target_name);

    if(obj)
    {
        if(!obj->Flags.test(Flag::Obj::Invis))
            return rSPELL_FAILED;

        obj->Flags.reset(Flag::Obj::Invis);
        Act(AT_MAGIC, "$p becomes visible again.", ch, obj, NULL, ActTarget::Char);

        ch->Echo("Ok.\r\n");
        return rNONE;
    }
    else
    {
        Character *victim;

        victim = GetCharacterInRoom(ch, spell_target_name);

        if(victim)
        {
            if(!CanSeeCharacter(ch, victim))
            {
                ch->Echo("You don't see %s!\r\n", spell_target_name.c_str());
                return rSPELL_FAILED;
            }

            if(victim->Race == RACE_DEFEL)
                return rSPELL_FAILED;

            if(!IsAffectedBy(victim, Flag::Affect::Invisible))
            {
                ch->Echo("They are not invisible!\r\n");
                return rSPELL_FAILED;
            }

            if(IsSafe(ch, victim))
            {
                FailedCasting(skill, ch, victim, NULL);
                return rSPELL_FAILED;
            }

            if(victim->Immune.test(Flag::Ris::Magic))
            {
                ImmuneCasting(skill, ch, victim, NULL);
                return rSPELL_FAILED;
            }
            if(!IsNpc(victim))
            {
                if(Chance(ch, 50) && GetAbilityLevel(ch, FORCE_ABILITY) < victim->TopLevel)
                {
                    FailedCasting(skill, ch, victim, NULL);
                    return rSPELL_FAILED;
                }

            }
            else
            {
                if(Chance(ch, 50) && GetAbilityLevel(ch, FORCE_ABILITY) + 15 < victim->TopLevel)
                {
                    FailedCasting(skill, ch, victim, NULL);
                    return rSPELL_FAILED;
                }
            }

            StripAffect(victim, gsn_invis);
            StripAffect(victim, gsn_mass_invis);
            victim->AffectedBy.reset(Flag::Affect::Invisible);
            ch->Echo("Ok.\r\n");
            return rNONE;
        }

        ch->Echo("You can't find %s!\r\n", spell_target_name.c_str());
        return rSPELL_FAILED;
    }
}

