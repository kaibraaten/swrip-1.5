#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "object.hpp"

/*
 * Generic inventory object spell                               -Thoric
 */
ch_ret spell_obj_inv(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Object> obj = vo.Obj;
    std::shared_ptr<Skill> skill = GetSkill(sn);
    std::shared_ptr<Object> clone;

    if (!obj)
    {
        FailedCasting(skill, caster, NULL, NULL);
        return rNONE;
    }

    switch (SPELL_ACTION(skill))
    {
        default:
        case SA_NONE:
            return rNONE;

        case SA_CREATE:
            if (SPELL_FLAG(skill, SF_WATER))        /* create water */
            {
                int water;

                if (obj->ItemType != ITEM_DRINK_CON)
                {
                    caster->Echo("It is unable to hold water.\r\n");
                    return rSPELL_FAILED;
                }

                if (obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] != LIQ_WATER
                    && obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] != 0)
                {
                    caster->Echo("It contains some other liquid.\r\n");
                    return rSPELL_FAILED;
                }

                water = umin((!skill->Dice.empty() ? ParseDice(caster, level, skill->Dice) : level)
                             * (weather_info.Sky >= SkyCondition::Raining ? 2 : 1),
                             obj->Value[OVAL_DRINK_CON_CAPACITY] - obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT]);

                if (water > 0)
                {
                    SeparateOneObjectFromGroup(obj);
                    obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] = LIQ_WATER;
                    obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] += water;

                    if (!IsName("water", obj->Name))
                    {
                        char buf[MAX_STRING_LENGTH];

                        sprintf(buf, "%s water", obj->Name.c_str());
                        obj->Name = buf;
                    }
                }
                SuccessfulCasting(skill, caster, NULL, obj);
                return rNONE;
            }
            if (SPELL_DAMAGE(skill) == SD_FIRE)     /* burn object */
            {
                /* return rNONE; */
            }
            if (SPELL_DAMAGE(skill) == SD_POISON     /* poison object */
                || SPELL_CLASS(skill) == SC_DEATH)
            {
                switch (obj->ItemType)
                {
                    default:
                        FailedCasting(skill, caster, NULL, obj);
                        break;
                    case ITEM_FOOD:
                    case ITEM_DRINK_CON:
                        SeparateOneObjectFromGroup(obj);
                        obj->Value[OVAL_DRINK_CON_POISON_STRENGTH] = 1;
                        SuccessfulCasting(skill, caster, NULL, obj);
                        break;
                }
                return rNONE;
            }
            if (SPELL_CLASS(skill) == SC_LIFE        /* purify food/water */
                && (obj->ItemType == ITEM_FOOD || obj->ItemType == ITEM_DRINK_CON))
            {
                switch (obj->ItemType)
                {
                    default:
                        FailedCasting(skill, caster, NULL, obj);
                        break;
                    case ITEM_FOOD:
                    case ITEM_DRINK_CON:
                        SeparateOneObjectFromGroup(obj);
                        obj->Value[OVAL_DRINK_CON_POISON_STRENGTH] = 0;
                        SuccessfulCasting(skill, caster, NULL, obj);
                        break;
                }
                return rNONE;
            }

            if (SPELL_CLASS(skill) != SC_NONE)
            {
                FailedCasting(skill, caster, NULL, obj);
                return rNONE;
            }

            switch (SPELL_POWER(skill))              /* clone object */
            {
                default:
                case SP_NONE:
                    if (obj->Cost > GetAbilityLevel(caster, AbilityClass::Force) * GetCurrentIntelligence(caster)
                                    * GetCurrentWisdom(caster))
                    {
                        FailedCasting(skill, caster, NULL, obj);
                        return rNONE;
                    }
                    break;
                case SP_MINOR:
                    if (GetAbilityLevel(caster, AbilityClass::Force) - obj->Level < 20
                        || obj->Cost
                           > GetAbilityLevel(caster, AbilityClass::Force) * GetCurrentIntelligence(caster) / 5)
                    {
                        FailedCasting(skill, caster, NULL, obj);
                        return rNONE;
                    }
                    break;
                case SP_GREATER:
                    if (GetAbilityLevel(caster, AbilityClass::Force) - obj->Level < 5
                        || obj->Cost
                           > GetAbilityLevel(caster, AbilityClass::Force) * 10 * GetCurrentIntelligence(caster)
                             * GetCurrentWisdom(caster))
                    {
                        FailedCasting(skill, caster, NULL, obj);
                        return rNONE;
                    }
                    break;
                case SP_MAJOR:
                    if (GetAbilityLevel(caster, AbilityClass::Force) - obj->Level < 0
                        || obj->Cost
                           > GetAbilityLevel(caster, AbilityClass::Force) * 50 * GetCurrentIntelligence(caster)
                             * GetCurrentWisdom(caster))
                    {
                        FailedCasting(skill, caster, NULL, obj);
                        return rNONE;
                    }
                    break;
                    clone = CopyObject(obj);
                    clone->Timer = !skill->Dice.empty() ? ParseDice(caster, level, skill->Dice) : 0;
                    ObjectToCharacter(clone, caster);
                    SuccessfulCasting(skill, caster, NULL, obj);
            }
            return rNONE;

        case SA_DESTROY:
        case SA_RESIST:
        case SA_SUSCEPT:
        case SA_DIVINATE:
            if (SPELL_DAMAGE(skill) == SD_POISON) /* detect poison */
            {
                if (obj->ItemType == ITEM_DRINK_CON
                    || obj->ItemType == ITEM_FOOD)
                {
                    if (obj->Value[OVAL_DRINK_CON_POISON_STRENGTH] != 0)
                    {
                        caster->Echo("You smell poisonous fumes.\r\n");
                    }
                    else
                    {
                        caster->Echo("It looks very delicious.\r\n");
                    }
                }
                else
                {
                    caster->Echo("It doesn't look poisoned.\r\n");
                }
                return rNONE;
            }
            return rNONE;
        case SA_OBSCURE:                    /* make obj invis */
            if (obj->Flags.test(Flag::Obj::Invis)
                || Chance(caster, !skill->Dice.empty() ? ParseDice(caster, level, skill->Dice) : 20))
            {
                FailedCasting(skill, caster, NULL, NULL);
                return rSPELL_FAILED;
            }
            SuccessfulCasting(skill, caster, NULL, obj);
            obj->Flags.set(Flag::Obj::Invis);
            return rNONE;

        case SA_CHANGE:
            return rNONE;
    }
    return rNONE;
}

