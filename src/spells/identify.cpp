#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "object.hpp"
#include "protoobject.hpp"

extern std::string spell_target_name;

ch_ret spell_identify(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    /* Modified by Scryn to work on mobs/players/objs */
    std::shared_ptr<Object> obj;
    std::shared_ptr<Character> victim;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (spell_target_name.empty())
    {
        caster->Echo("What would you like identified?\r\n");
        return rSPELL_FAILED;
    }

    if ((obj = GetCarriedObject(caster, spell_target_name)) != NULL)
    {
        std::shared_ptr<Skill> sktmp;

        SetCharacterColor(AT_LBLUE, caster);
        caster->Echo("Object '%s' is %s, special properties: %s\r\nIts weight is %d, value is %d.\r\n",
                     obj->Name.c_str(),
                     AOrAn(GetItemTypeName(obj)).c_str(),
                     FlagString(obj->Flags, ObjectFlags).c_str(),
                     obj->Weight,
                     obj->Cost
        );
        SetCharacterColor(AT_MAGIC, caster);

        switch (obj->ItemType)
        {
            case ITEM_PILL:
            case ITEM_SCROLL:
            case ITEM_POTION:
                caster->Echo("Level %d spells of:", obj->Value[0]);

                if (obj->Value[1] >= 0 && (sktmp = GetSkill(obj->Value[1])) != NULL)
                {
                    caster->Echo(" '");
                    caster->Echo(sktmp->Name);
                    caster->Echo("'");
                }

                if (obj->Value[2] >= 0 && (sktmp = GetSkill(obj->Value[2])) != NULL)
                {
                    caster->Echo(" '");
                    caster->Echo(sktmp->Name);
                    caster->Echo("'");
                }

                if (obj->Value[3] >= 0 && (sktmp = GetSkill(obj->Value[3])) != NULL)
                {
                    caster->Echo(" '");
                    caster->Echo(sktmp->Name);
                    caster->Echo("'");
                }

                caster->Echo(".\r\n");
                break;

            case ITEM_DEVICE:
                caster->Echo("Has %d(%d) charges of level %d",
                             obj->Value[1], obj->Value[2], obj->Value[0]);

                if (obj->Value[3] >= 0 && (sktmp = GetSkill(obj->Value[3])) != NULL)
                {
                    caster->Echo(" '");
                    caster->Echo(sktmp->Name);
                    caster->Echo("'");
                }

                caster->Echo(".\r\n");
                break;

            case ITEM_WEAPON:
                caster->Echo("Damage is %d to %d (average %d).\r\n",
                             obj->Value[1], obj->Value[2],
                         (obj->Value[1] + obj->Value[2]) / 2);
                if (obj->Value[3] == WEAPON_BLASTER)
                {
                    if (obj->BlasterSetting == BLASTER_FULL)
                    {
                        caster->Echo("It is set on FULL power.\r\n");
                    }
                    else if (obj->BlasterSetting == BLASTER_HIGH)
                    {
                        caster->Echo("It is set on HIGH power.\r\n");
                    }
                    else if (obj->BlasterSetting == BLASTER_NORMAL)
                    {
                        caster->Echo("It is set on NORMAL power.\r\n");
                    }
                    else if (obj->BlasterSetting == BLASTER_HALF)
                    {
                        caster->Echo("It is set on HALF power.\r\n");
                    }
                    else if (obj->BlasterSetting == BLASTER_LOW)
                    {
                        caster->Echo("It is set on LOW power.\r\n");
                    }
                    else if (obj->BlasterSetting == BLASTER_STUN)
                    {
                        caster->Echo("It is set on STUN.\r\n");
                    }
                    caster->Echo("It has %d out of %d charges.\r\n",
                                 obj->Value[4], obj->Value[5]);
                }
                else if (obj->Value[3] == WEAPON_LIGHTSABER ||
                         obj->Value[3] == WEAPON_VIBRO_BLADE ||
                         obj->Value[3] == WEAPON_FORCE_PIKE)
                {
                    caster->Echo("It has %d out of %d units of charge remaining.\r\n",
                                 obj->Value[4], obj->Value[5]);
                }
                else if (obj->Value[3] == WEAPON_BOWCASTER)
                {
                    caster->Echo("It has %d out of %d energy bolts remaining.\r\n",
                                 obj->Value[4], obj->Value[5]);
                }
                break;

            case ITEM_AMMO:
                caster->Echo("It has %d charges.\r\n",
                             obj->Value[0]);
                break;

            case ITEM_BOLT:
                caster->Echo("It has %d energy bolts.\r\n",
                             obj->Value[0]);
                break;

            case ITEM_BATTERY:
                caster->Echo("It has %d units of charge.\r\n",
                             obj->Value[0]);
                break;

            case ITEM_ARMOR:
                caster->Echo("Current armor class is %d. ( based on current condition )\r\n", obj->Value[0]);
                caster->Echo("Maximum armor class is %d. ( based on top condition )\r\n", obj->Value[1]);
                caster->Echo("Applied armor class is %d. ( based condition and location worn )\r\n",
                             GetObjectArmorClass(obj, obj->WearLoc));
                break;

            default:
                break;
        }

        for (auto paf : obj->Prototype->Affects())
        {
            ShowAffectToCharacter(caster, paf);
        }

        for (auto paf : obj->Affects())
        {
            ShowAffectToCharacter(caster, paf);
        }

        return rNONE;
    }
    else if ((victim = GetCharacterInRoom(caster, spell_target_name)) != NULL)
    {
        if (victim->Immune.test(Flag::Ris::Magic))
        {
            ImmuneCasting(skill, caster, victim, NULL);
            return rSPELL_FAILED;
        }

        if (IsNpc(victim))
        {
            caster->Echo("%s appears to be between level %d and %d.\r\n",
                         victim->Name.c_str(),
                     victim->TopLevel() - (victim->TopLevel() % 5),
                     victim->TopLevel() - (victim->TopLevel() % 5) + 5);
        }
        else
        {
            caster->Echo("%s appears to be level %d.\r\n",
                         victim->Name.c_str(), victim->TopLevel());
        }

        caster->Echo("%s looks like %s.\r\n",
                     victim->Name.c_str(), AOrAn(GetCharacterRace(victim)).c_str());

        if ((Chance(caster, 50) && caster->TopLevel() >= victim->TopLevel() + 10)
            || IsImmortal(caster))
        {
            caster->Echo("%s appears to be affected by: ", victim->Name.c_str());

            if (victim->Affects().empty())
            {
                caster->Echo("nothing.\r\n");
                return rNONE;
            }

            for (auto paf : victim->Affects())
            {
                std::shared_ptr<Skill> sktmp;

                if (victim->Affects().size() == 1)
                {
                    if (paf != victim->Affects().back() && (sktmp = GetSkill(paf->Type)) != NULL)
                    {
                        caster->Echo("%s, ", sktmp->Name.c_str());
                    }

                    if (paf == victim->Affects().back() && (sktmp = GetSkill(paf->Type)) != NULL)
                    {
                        caster->Echo("and %s.\r\n", sktmp->Name.c_str());
                        return rNONE;
                    }
                }
                else
                {
                    if ((sktmp = GetSkill(paf->Type)) != NULL)
                    {
                        caster->Echo("%s.\r\n", sktmp->Name.c_str());
                    }
                    else
                    {
                        caster->Echo("\r\n");
                    }

                    return rNONE;
                }
            }
        }
    }
    else
    {
        caster->Echo("You can't find %s!\r\n", spell_target_name.c_str());
        return rSPELL_FAILED;
    }

    return rNONE;
}

