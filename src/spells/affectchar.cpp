#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

static bool IsAffectedBy(const std::shared_ptr<Character> ch, std::bitset<Flag::MAX> &affectedBy)
{
    for (size_t i = 0; i < ch->AffectedBy.size(); ++i)
    {
        if (ch->AffectedBy.test(i) && affectedBy.test(i))
        {
            return true;
        }
    }

    return false;
}

ch_ret spell_affectchar(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    std::shared_ptr<Skill> skill = GetSkill(sn);
    std::shared_ptr<Character> victim = vo.Ch;
    int aff_chance = 0;
    ch_ret retcode = rNONE;

    if (SPELL_FLAG(skill, SF_RECASTABLE))
    {
        StripAffect(victim, sn);
    }

    for (auto saf : skill->Affects)
    {
        if (saf->Location >= REVERSE_APPLY)
        {
            victim = caster;
        }
        else
        {
            victim = vo.Ch;
        }

        af->AffectedBy = saf->AffectedBy;

        /* Check if char has this bitvector already */
        if (af->AffectedBy.any()
            && IsAffectedBy(victim, af->AffectedBy)
            && !SPELL_FLAG(skill, SF_ACCUMULATIVE))
        {
            continue;
        }

        /*
         * necessary for StripAffect to work properly...
         */
        switch (af->AffectedBy.to_ulong())
        {
            default:
                af->Type = sn;
                break;

            case (1 << Flag::Affect::Poison):
                af->Type = gsn_poison;
                caster->Echo("You feel the hatred grow within you!\r\n");
                caster->Alignment = caster->Alignment - 100;
                caster->Alignment = urange(-1000, caster->Alignment, 1000);
                ApplySithPenalty(caster);
                aff_chance = ModifySavingThrowBasedOnResistance(victim, level, Flag::Ris::Poison);

                if (IsDroid(victim))
                {
                    aff_chance = 1000;
                }

                if (aff_chance == 1000)
                {
                    retcode = rVICT_IMMUNE;

                    if (SPELL_FLAG(skill, SF_STOPONFAIL))
                    {
                        return retcode;
                    }

                    continue;
                }

                if (SaveVsPoisonDeath(aff_chance, victim))
                {
                    if (SPELL_FLAG(skill, SF_STOPONFAIL))
                    {
                        return retcode;
                    }

                    continue;
                }

                victim->MentalState = urange(30, victim->MentalState + 2, 100);
                break;

            case (1 << Flag::Affect::Blind):
                af->Type = gsn_blindness;
                break;

            case (1 << Flag::Affect::Invisible):
                af->Type = gsn_invis;
                break;

            case (1 << Flag::Affect::Sleep):
                af->Type = gsn_sleep;
                aff_chance = ModifySavingThrowBasedOnResistance(victim, level, Flag::Ris::Sleep);

                if (IsDroid(victim))
                {
                    aff_chance = 1000;
                }

                if (aff_chance == 1000)
                {
                    retcode = rVICT_IMMUNE;

                    if (SPELL_FLAG(skill, SF_STOPONFAIL))
                    {
                        return retcode;
                    }

                    continue;
                }
                break;

            case (1 << Flag::Affect::Charm):
                af->Type = gsn_charm_person;
                aff_chance = ModifySavingThrowBasedOnResistance(victim, level, Flag::Ris::Charm);

                if (IsDroid(victim))
                {
                    aff_chance = 1000;
                }

                if (aff_chance == 1000)
                {
                    retcode = rVICT_IMMUNE;

                    if (SPELL_FLAG(skill, SF_STOPONFAIL))
                    {
                        return retcode;
                    }

                    continue;
                }
                break;

            case (1 << Flag::Affect::Possess):
                af->Type = gsn_possess;
                break;
        }

        af->Duration = ParseDice(caster, level, saf->Duration);
        af->Modifier = ParseDice(caster, level, saf->Modifier);
        af->Location = saf->Location % REVERSE_APPLY;

        if (af->Duration == 0)
        {
            switch (af->Location)
            {
                case APPLY_HIT:
                    if (caster != victim
                        && victim->HitPoints.Current < victim->HitPoints.Max
                        && af->Modifier > 0
                        && IsDroid(victim))
                    {
                        caster->Echo("The noble Jedi use their powers to help others!\r\n");
                        caster->Alignment += 5;
                        caster->Alignment = urange(-1000, caster->Alignment, 1000);
                        ApplyJediBonus(caster);
                    }

                    if (af->Modifier > 0
                        && victim->HitPoints.Current >= victim->HitPoints.Max)
                    {
                        return rSPELL_FAILED;
                    }

                    victim->HitPoints.Current = urange(0, victim->HitPoints.Current + af->Modifier,
                                                       victim->HitPoints.Max);
                    UpdatePosition(victim);
                    break;

                case APPLY_MANA:
                    if (af->Modifier > 0 && victim->Mana.Current >= victim->Mana.Max)
                    {
                        return rSPELL_FAILED;
                    }

                    if (caster != victim && !IsDroid(victim))
                    {
                        caster->Echo("The noble Jedi use their powers to help others!\r\n");
                        caster->Alignment += 10;
                        caster->Alignment = urange(-1000, caster->Alignment, 1000);
                        ApplyJediBonus(caster);
                    }

                    victim->Mana.Current = urange(0, victim->Mana.Current + af->Modifier,
                                                  victim->Mana.Max);
                    UpdatePosition(victim);
                    break;

                case APPLY_MOVE:
                    if (af->Modifier > 0
                        && victim->Fatigue.Current >= victim->Fatigue.Max)
                    {
                        return rSPELL_FAILED;
                    }

                    victim->Fatigue.Current = urange(0, victim->Fatigue.Current + af->Modifier,
                                                     victim->Fatigue.Max);
                    UpdatePosition(victim);
                    break;

                default:
                    ModifyAffect(victim, af, true);
                    break;
            }
        }
        else if (SPELL_FLAG(skill, SF_ACCUMULATIVE))
        {
            JoinAffect(victim, af);
        }
        else
        {
            AffectToCharacter(victim, af);
        }
    }

    UpdatePosition(victim);
    return retcode;
}
