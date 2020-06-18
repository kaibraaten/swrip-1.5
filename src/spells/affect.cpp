#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "room.hpp"
#include "act.hpp"

/*
 * Generic spell affect                                         -Thoric
 */
ch_ret spell_affect(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Skill> skill = GetSkill(sn);
    Character *victim = vo.Ch;
    bool groupsp = false;
    bool areasp = false;
    bool hitchar = false, hitroom = false, hitvict = false;
    ch_ret retcode = rNONE;

    if(skill->Affects.empty())
    {
        Log->Bug("spell_affect has no affects sn %d", sn);
        return rNONE;
    }

    if(SPELL_FLAG(skill, SF_GROUPSPELL))
    {
        groupsp = true;
    }
    else
    {
        groupsp = false;
    }

    if(SPELL_FLAG(skill, SF_AREA))
    {
        areasp = true;
    }
    else
    {
        areasp = false;
    }

    if(!groupsp && !areasp)
    {
        /* Can't find a victim */
        if(!victim)
        {
            FailedCasting(skill, ch, victim, NULL);
            return rSPELL_FAILED;
        }

        if((skill->Type != SKILL_HERB
            && victim->Immune.test(Flag::Ris::Magic))
           || IsImmuneToDamageType(victim, SPELL_DAMAGE(skill)))
        {
            ImmuneCasting(skill, ch, victim, NULL);
            return rSPELL_FAILED;
        }

        /* Spell is already on this guy */
        if(IsAffected(victim, sn)
           && !SPELL_FLAG(skill, SF_ACCUMULATIVE)
           && !SPELL_FLAG(skill, SF_RECASTABLE))
        {
            FailedCasting(skill, ch, victim, NULL);
            return rSPELL_FAILED;
        }

        auto saf = skill->Affects.front();

        if(saf != nullptr && skill->Affects.size() == 1
           && saf->Location == APPLY_STRIPSN
           && !IsAffected(victim, ParseDice(ch, level, saf->Modifier)))
        {
            FailedCasting(skill, ch, victim, NULL);
            return rSPELL_FAILED;
        }

        if(CheckSavingThrow(sn, level, ch, victim))
        {
            FailedCasting(skill, ch, victim, NULL);
            return rSPELL_FAILED;
        }
    }
    else
    {
        if(!skill->Messages.Success.ToCaster.empty())
        {
            if(strstr(skill->Messages.Success.ToCaster.c_str(), "$N"))
            {
                hitchar = true;
            }
            else
            {
                Act(AT_MAGIC, skill->Messages.Success.ToCaster, ch, NULL, NULL, ActTarget::Char);
            }
        }

        if(!skill->Messages.Success.ToRoom.empty())
        {
            if(strstr(skill->Messages.Success.ToRoom.c_str(), "$N"))
            {
                hitroom = true;
            }
            else
            {
                Act(AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, NULL, ActTarget::Room);
            }
        }

        if(!skill->Messages.Success.ToVictim.empty())
        {
            hitvict = true;
        }

        if(victim)
        {
            victim = victim->InRoom->Characters().front();
        }
        else
        {
            victim = ch->InRoom->Characters().front();
        }
    }

    if(!victim)
    {
        Log->Bug("spell_affect: could not find victim: sn %d", sn);
        FailedCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    std::list<Character *>::const_iterator begin = find(std::cbegin(victim->InRoom->Characters()),
                                                        std::cend(victim->InRoom->Characters()),
                                                        victim);
    std::list<Character *>::const_iterator end = std::cend(victim->InRoom->Characters());

    for(auto i = begin; i != end; ++i)
    {
        victim = *i;

        if(groupsp || areasp)
        {
            if((groupsp && !IsInSameGroup(victim, ch))
               || victim->Immune.test(Flag::Ris::Magic)
               || IsImmuneToDamageType(victim, SPELL_DAMAGE(skill))
               || CheckSavingThrow(sn, level, ch, victim)
               || (!SPELL_FLAG(skill, SF_RECASTABLE) && IsAffected(victim, sn)))
                continue;

            if(hitvict && ch != victim)
            {
                Act(AT_MAGIC, skill->Messages.Success.ToVictim, ch, NULL, victim, ActTarget::Vict);

                if(hitroom)
                {
                    Act(AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, victim, ActTarget::NotVict);
                    Act(AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, victim, ActTarget::Char);
                }
            }
            else if(hitroom)
            {
                Act(AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, victim, ActTarget::Room);
            }

            if(ch == victim)
            {
                if(hitvict)
                {
                    Act(AT_MAGIC, skill->Messages.Success.ToVictim, ch, NULL, ch, ActTarget::Char);
                }
                else if(hitchar)
                {
                    Act(AT_MAGIC, skill->Messages.Success.ToCaster, ch, NULL, ch, ActTarget::Char);
                }
            }
            else if(hitchar)
            {
                Act(AT_MAGIC, skill->Messages.Success.ToCaster, ch, NULL, victim, ActTarget::Char);
            }
        }

        retcode = spell_affectchar(sn, level, ch, victim);

        if(!groupsp && !areasp)
        {
            if(retcode == rSPELL_FAILED)
            {
                FailedCasting(skill, ch, victim, NULL);
                return rSPELL_FAILED;
            }

            if(retcode == rVICT_IMMUNE)
            {
                ImmuneCasting(skill, ch, victim, NULL);
            }
            else
            {
                SuccessfulCasting(skill, ch, victim, NULL);
            }

            break;
        }
    }

    return rNONE;
}

