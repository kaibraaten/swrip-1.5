#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "room.hpp"
#include "act.hpp"

/*
 * Generic spell affect                                         -Thoric
 */
ch_ret spell_affect(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Skill> skill = GetSkill(sn);
    std::shared_ptr<Character> victim = vo.Ch;
    bool hitchar = false, hitroom = false, hitvict = false;
    ch_ret retcode = rNONE;

    if(skill->Affects.empty())
    {
        Log->Bug("spell_affect has no affects sn %d", sn);
        return rNONE;
    }

    bool groupsp = SPELL_FLAG(skill, SF_GROUPSPELL);
    bool areasp = SPELL_FLAG(skill, SF_AREA);

    if(!groupsp && !areasp)
    {
        /* Can't find a victim */
        if(!victim)
        {
            FailedCasting(skill, caster, victim, nullptr);
            return rSPELL_FAILED;
        }

        if((skill->Type != SKILL_HERB
            && victim->Immune.test(Flag::Ris::Magic))
           || IsImmuneToDamageType(victim, SPELL_DAMAGE(skill)))
        {
            ImmuneCasting(skill, caster, victim, nullptr);
            return rSPELL_FAILED;
        }

        /* Spell is already on this guy */
        if(IsAffected(victim, sn)
           && !SPELL_FLAG(skill, SF_ACCUMULATIVE)
           && !SPELL_FLAG(skill, SF_RECASTABLE))
        {
            FailedCasting(skill, caster, victim, nullptr);
            return rSPELL_FAILED;
        }

        auto saf = skill->Affects.front();

        if(saf != nullptr && skill->Affects.size() == 1
           && saf->Location == APPLY_STRIPSN
           && !IsAffected(victim, ParseDice(caster, level, saf->Modifier)))
        {
            FailedCasting(skill, caster, victim, nullptr);
            return rSPELL_FAILED;
        }

        if(CheckSavingThrow(sn, level, caster, victim))
        {
            FailedCasting(skill, caster, victim, nullptr);
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
                Act(AT_MAGIC, skill->Messages.Success.ToCaster, caster, nullptr, nullptr, ActTarget::Char);
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
                Act(AT_MAGIC, skill->Messages.Success.ToRoom, caster, nullptr, nullptr, ActTarget::Room);
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
            victim = caster->InRoom->Characters().front();
        }
    }

    if(!victim)
    {
        Log->Bug("spell_affect: could not find victim: sn %d", sn);
        FailedCasting(skill, caster, victim, nullptr);
        return rSPELL_FAILED;
    }

    auto begin = find(std::cbegin(victim->InRoom->Characters()),
                      std::cend(victim->InRoom->Characters()),
                      victim);
    auto end = std::cend(victim->InRoom->Characters());

    for(auto i = begin; i != end; ++i)
    {
        victim = *i;

        if(groupsp || areasp)
        {
            if((groupsp && !IsInSameGroup(victim, caster))
               || victim->Immune.test(Flag::Ris::Magic)
               || IsImmuneToDamageType(victim, SPELL_DAMAGE(skill))
               || CheckSavingThrow(sn, level, caster, victim)
               || (!SPELL_FLAG(skill, SF_RECASTABLE) && IsAffected(victim, sn)))
                continue;

            if(hitvict && caster != victim)
            {
                Act(AT_MAGIC, skill->Messages.Success.ToVictim, caster, nullptr, victim, ActTarget::Vict);

                if(hitroom)
                {
                    Act(AT_MAGIC, skill->Messages.Success.ToRoom, caster, nullptr, victim, ActTarget::NotVict);
                    Act(AT_MAGIC, skill->Messages.Success.ToRoom, caster, nullptr, victim, ActTarget::Char);
                }
            }
            else if(hitroom)
            {
                Act(AT_MAGIC, skill->Messages.Success.ToRoom, caster, nullptr, victim, ActTarget::Room);
            }

            if(caster == victim)
            {
                if(hitvict)
                {
                    Act(AT_MAGIC, skill->Messages.Success.ToVictim, caster, nullptr, caster, ActTarget::Char);
                }
                else if(hitchar)
                {
                    Act(AT_MAGIC, skill->Messages.Success.ToCaster, caster, nullptr, caster, ActTarget::Char);
                }
            }
            else if(hitchar)
            {
                Act(AT_MAGIC, skill->Messages.Success.ToCaster, caster, nullptr, victim, ActTarget::Char);
            }
        }

        retcode = spell_affectchar(sn, level, caster, victim);

        if(!groupsp && !areasp)
        {
            if(retcode == rSPELL_FAILED)
            {
                FailedCasting(skill, caster, victim, nullptr);
                return rSPELL_FAILED;
            }

            if(retcode == rVICT_IMMUNE)
            {
                ImmuneCasting(skill, caster, victim, nullptr);
            }
            else
            {
                SuccessfulCasting(skill, caster, victim, nullptr);
            }

            break;
        }
    }

    return rNONE;
}

