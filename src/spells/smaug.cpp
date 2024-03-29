#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

extern std::string spell_target_name;

/*
 * Generic handler for new "SMAUG" spells                       -Thoric
 */
ch_ret spell_smaug(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Skill> skill = GetSkill(sn);

    switch (skill->Target)
    {
        case TAR_IGNORE:
            /* offensive area spell */
            if (SPELL_FLAG(skill, SF_AREA)
                && ((SPELL_ACTION(skill) == SA_DESTROY
                     && SPELL_CLASS(skill) == SC_LIFE)
                    || (SPELL_ACTION(skill) == SA_CREATE
                        && SPELL_CLASS(skill) == SC_DEATH)))
            {
                return spell_area_attack(sn, level, caster, vo);
            }

            if (SPELL_ACTION(skill) == SA_CREATE)
            {
                if (SPELL_FLAG(skill, SF_OBJECT))
                {   /* create object */
                    return spell_create_obj(sn, level, caster, vo);
                }
                if (SPELL_CLASS(skill) == SC_LIFE)
                {  /* create mob */
                    return spell_create_mob(sn, level, caster, vo);
                }
            }

            /* affect a distant player */
            if (SPELL_FLAG(skill, SF_DISTANT)
                && SPELL_FLAG(skill, SF_CHARACTER))
            {
                return spell_affect(sn, level, caster, GetCharacterAnywhere(caster, spell_target_name));
            }

            /* affect a player in this room (should have been TAR_CHAR_XXX) */
            if (SPELL_FLAG(skill, SF_CHARACTER))
            {
                return spell_affect(sn, level, caster, GetCharacterInRoom(caster, spell_target_name));
            }

            /* will fail, or be an area/group affect */
            return spell_affect(sn, level, caster, vo);

        case TAR_CHAR_OFFENSIVE:
            /* a regular damage inflicting spell attack */
            if ((SPELL_ACTION(skill) == SA_DESTROY
                 && SPELL_CLASS(skill) == SC_LIFE)
                || (SPELL_ACTION(skill) == SA_CREATE
                    && SPELL_CLASS(skill) == SC_DEATH))
            {
                return spell_attack(sn, level, caster, vo);
            }

            /* a nasty spell affect */
            return spell_affect(sn, level, caster, vo);

        case TAR_CHAR_DEFENSIVE:
        case TAR_CHAR_SELF:
            if (!vo.IsNull() && SPELL_ACTION(skill) == SA_DESTROY)
            {
                std::shared_ptr<Character> victim = vo.Ch;

                /* cure poison */
                if (SPELL_DAMAGE(skill) == SD_POISON)
                {
                    if (IsAffected(victim, gsn_poison))
                    {
                        StripAffect(victim, gsn_poison);
                        victim->MentalState = urange(-100, victim->MentalState, -10);
                        SuccessfulCasting(skill, caster, victim, NULL);
                        return rNONE;
                    }
                    FailedCasting(skill, caster, victim, NULL);
                    return rSPELL_FAILED;
                }
                /* cure blindness */
                if (SPELL_CLASS(skill) == SC_ILLUSION)
                {
                    if (IsAffected(victim, gsn_blindness))
                    {
                        StripAffect(victim, gsn_blindness);
                        SuccessfulCasting(skill, caster, victim, NULL);
                        return rNONE;
                    }
                    FailedCasting(skill, caster, victim, NULL);
                    return rSPELL_FAILED;
                }
            }
            return spell_affect(sn, level, caster, vo);

        case TAR_OBJ_INV:
            return spell_obj_inv(sn, level, caster, vo);
    }
    
    return rNONE;
}
