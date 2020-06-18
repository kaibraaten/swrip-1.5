#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "act.hpp"

static void wear_obj(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, bool fReplace, int wear_bit);
static bool can_layer(const std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, int wear_loc);
static bool can_dual(const std::shared_ptr<Character> ch);
static bool could_dual(const std::shared_ptr<Character> ch);

void do_wear(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if((!StrCmp(arg2, "on")
        || !StrCmp(arg2, "upon")
        || !StrCmp(arg2, "around"))
       && !argument.empty())
    {
        argument = OneArgument(argument, arg2);
    }

    if(arg1.empty())
    {
        ch->Echo("Wear, wield, or hold what?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    if(!StrCmp(arg1, "all"))
    {
        auto objectsToWear = Filter(ch->Objects(),
                                    [ch](auto obj)
                                    {
                                        return obj->WearLoc == WEAR_NONE
                                            && CanSeeObject(ch, obj);
                                    });
        for(auto obj : objectsToWear)
        {
            wear_obj(ch, obj, false, -1);
        }

        return;
    }
    else
    {
        int wear_bit = -1;
        auto obj = GetCarriedObject(ch, arg1);

        if(obj == nullptr)
        {
            ch->Echo("You do not have that item.\r\n");
            return;
        }

        if(!arg2.empty())
        {
            wear_bit = GetWearFlag(arg2);
        }

        wear_obj(ch, obj, true, wear_bit);
    }
}

/*
 * Wear one object.
 * Optional replacement of existing objects.
 * Big repetitive code, ick.
 * Restructured a bit to allow for specifying body location     -Thoric
 */
static void wear_obj(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, bool fReplace, int wear_bit)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    std::shared_ptr<Object> tmpobj;
    int bit = 0;
    int tmp = 0;
    bool check_size = false;

    SeparateOneObjectFromGroup(obj);

    if(wear_bit > -1)
    {
        bit = wear_bit;

        if(!obj->WearFlags.test(bit))
        {
            if(fReplace)
            {
                switch(bit)
                {
                case Flag::Wear::Hold:
                    ch->Echo("You cannot hold that.\r\n");
                    break;

                case Flag::Wear::Wield:
                    ch->Echo("You cannot wield that.\r\n");
                    break;

                default:
                    sprintf(buf, "You cannot wear that on your %s.\r\n",
                            WearFlags[bit]);
                    ch->Echo("%s", buf);
                }
            }

            return;
        }
    }
    else
    {
        for(bit = -1, tmp = 1; tmp < Flag::MAX - 1; tmp++)
        {
            if(obj->WearFlags.test(tmp))
            {
                bit = tmp;
                break;
            }
        }
    }


    if(bit == Flag::Wear::Wield
       || bit == Flag::Wear::Hold
       || obj->ItemType == ITEM_LIGHT
       || bit == Flag::Wear::Shield)
    {
        check_size = false;
    }
    else if(ch->Race == RACE_DEFEL)
    {
        check_size = true;
    }
    else if(!IsNpc(ch))
    {
        switch(ch->Race)
        {
        default:
            if(!obj->Flags.test(Flag::Obj::HumanSize))
            {
                check_size = true;
            }

            break;

        case RACE_HUTT:
            if(!obj->Flags.test(Flag::Obj::HuttSize))
            {
                check_size = true;
            }

            break;

        case RACE_GAMORREAN:
        case RACE_MON_CALAMARI:
        case RACE_QUARREN:
        case RACE_WOOKIEE:
            if(!obj->Flags.test(Flag::Obj::LargeSize))
            {
                check_size = true;
            }

            break;

        case RACE_CHADRA_FAN:
        case RACE_EWOK:
        case RACE_JAWA:
        case RACE_SULLUSTAN:
            if(!obj->Flags.test(Flag::Obj::SmallSize))
            {
                check_size = true;
            }

            break;
        }
    }

    /*
      this seems redundant but it enables both multiple sized objects to be
      used as well as objects with no size flags at all
    */

    if(check_size)
    {
        if(ch->Race == RACE_DEFEL)
        {
            Act(AT_MAGIC, "It is against your nature to wear anything that might make you visible.", ch, NULL, NULL, ActTarget::Char);
            Act(AT_ACTION, "$n wants to use $p, but doesn't.",
                ch, obj, NULL, ActTarget::Room);
            return;
        }

        if(obj->Flags.test(Flag::Obj::HuttSize))
        {
            Act(AT_MAGIC, "That item is too big for you.", ch, NULL, NULL, ActTarget::Char);
            Act(AT_ACTION, "$n tries to use $p, but it is too big.",
                ch, obj, NULL, ActTarget::Room);
            return;
        }

        if(obj->Flags.test(Flag::Obj::LargeSize)
           || obj->Flags.test(Flag::Obj::HumanSize))
        {
            Act(AT_MAGIC, "That item is the wrong size for you.", ch, NULL, NULL, ActTarget::Char);
            Act(AT_ACTION, "$n tries to use $p, but can't.",
                ch, obj, NULL, ActTarget::Room);
            return;
        }

        if(obj->Flags.test(Flag::Obj::SmallSize))
        {
            Act(AT_MAGIC, "That item is too small for you.", ch, nullptr, nullptr, ActTarget::Char);
            Act(AT_ACTION, "$n tries to use $p, but it is too small.",
                ch, obj, nullptr, ActTarget::Room);
            return;
        }
    }

    /* currently cannot have a light in non-light position */
    if(obj->ItemType == ITEM_LIGHT)
    {
        if(!RemoveObject(ch, WEAR_LIGHT, fReplace))
            return;
        if(!ObjProgUseTrigger(ch, obj, nullptr, nullptr, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n holds $p as a light.", ch, obj, nullptr, ActTarget::Room);
                Act(AT_ACTION, "You hold $p as your light.", ch, obj, nullptr, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }

        EquipCharacter(ch, obj, WEAR_LIGHT);
        ObjProgWearTrigger(ch, obj);
        return;
    }

    if(bit == -1)
    {
        if(fReplace)
            ch->Echo("You can't wear, wield, or hold that.\r\n");
        return;
    }

    switch(bit)
    {
    default:
        Log->Bug("wear_obj: uknown/unused item_wear bit %d", bit);

        if(fReplace)
            ch->Echo("You can't wear, wield, or hold that.\r\n");

        return;

    case Flag::Wear::Finger:
        if(GetEquipmentOnCharacter(ch, WEAR_FINGER_L)
           && GetEquipmentOnCharacter(ch, WEAR_FINGER_R)
           && !RemoveObject(ch, WEAR_FINGER_L, fReplace)
           && !RemoveObject(ch, WEAR_FINGER_R, fReplace))
            return;

        if(!GetEquipmentOnCharacter(ch, WEAR_FINGER_L))
        {
            if(!ObjProgUseTrigger(ch, obj, nullptr, nullptr, nullptr))
            {
                if(obj->ActionDescription.empty())
                {
                    Act(AT_ACTION, "$n slips $s left finger into $p.", ch, obj, nullptr, ActTarget::Room);
                    Act(AT_ACTION, "You slip your left finger into $p.", ch, obj, nullptr, ActTarget::Char);
                }
                else
                    ActionDescription(ch, obj);
            }
            EquipCharacter(ch, obj, WEAR_FINGER_L);
            ObjProgWearTrigger(ch, obj);
            return;
        }

        if(!GetEquipmentOnCharacter(ch, WEAR_FINGER_R))
        {
            if(!ObjProgUseTrigger(ch, obj, nullptr, nullptr, nullptr))
            {
                if(obj->ActionDescription.empty())
                {
                    Act(AT_ACTION, "$n slips $s right finger into $p.", ch, obj, nullptr, ActTarget::Room);
                    Act(AT_ACTION, "You slip your right finger into $p.", ch, obj, nullptr, ActTarget::Char);
                }
                else
                    ActionDescription(ch, obj);
            }

            EquipCharacter(ch, obj, WEAR_FINGER_R);
            ObjProgWearTrigger(ch, obj);
            return;
        }

        Log->Bug("Wear_obj: no free finger.");
        ch->Echo("You already wear something on both fingers.\r\n");
        return;

    case Flag::Wear::Neck:
        if(GetEquipmentOnCharacter(ch, WEAR_NECK_1) != nullptr
           && GetEquipmentOnCharacter(ch, WEAR_NECK_2) != nullptr
           && !RemoveObject(ch, WEAR_NECK_1, fReplace)
           && !RemoveObject(ch, WEAR_NECK_2, fReplace))
            return;

        if(!GetEquipmentOnCharacter(ch, WEAR_NECK_1))
        {
            if(!ObjProgUseTrigger(ch, obj, nullptr, nullptr, nullptr))
            {
                if(obj->ActionDescription.empty())
                {
                    Act(AT_ACTION, "$n wears $p around $s neck.", ch, obj, nullptr, ActTarget::Room);
                    Act(AT_ACTION, "You wear $p around your neck.", ch, obj, nullptr, ActTarget::Char);
                }
                else
                    ActionDescription(ch, obj);
            }
            EquipCharacter(ch, obj, WEAR_NECK_1);
            ObjProgWearTrigger(ch, obj);
            return;
        }

        if(!GetEquipmentOnCharacter(ch, WEAR_NECK_2))
        {
            if(!ObjProgUseTrigger(ch, obj, nullptr, nullptr, nullptr))
            {
                if(obj->ActionDescription.empty())
                {
                    Act(AT_ACTION, "$n wears $p around $s neck.", ch, obj, nullptr, ActTarget::Room);
                    Act(AT_ACTION, "You wear $p around your neck.", ch, obj, nullptr, ActTarget::Char);
                }
                else
                    ActionDescription(ch, obj);
            }
            EquipCharacter(ch, obj, WEAR_NECK_2);
            ObjProgWearTrigger(ch, obj);
            return;
        }

        Log->Bug("Wear_obj: no free neck.");
        ch->Echo("You already wear two neck items.\r\n");
        return;

    case Flag::Wear::Body:
        if(!can_layer(ch, obj, WEAR_BODY))
        {
            ch->Echo("It won't fit overtop of what you're already wearing.\r\n");
            return;
        }
        if(!ObjProgUseTrigger(ch, obj, nullptr, nullptr, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n fits $p on $s body.", ch, obj, nullptr, ActTarget::Room);
                Act(AT_ACTION, "You fit $p on your body.", ch, obj, nullptr, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_BODY);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Head:
        if(ch->Race == RACE_VERPINE || ch->Race == RACE_TWI_LEK)
        {
            ch->Echo("You cant wear anything on your head.\r\n");
            return;
        }
        if(!RemoveObject(ch, WEAR_HEAD, fReplace))
            return;
        if(!ObjProgUseTrigger(ch, obj, nullptr, nullptr, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n dons $p upon $s head.", ch, obj, nullptr, ActTarget::Room);
                Act(AT_ACTION, "You don $p upon your head.", ch, obj, nullptr, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_HEAD);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Eyes:
        if(!RemoveObject(ch, WEAR_EYES, fReplace))
            return;
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n places $p on $s eyes.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You place $p on your eyes.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_EYES);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Ears:
        if(ch->Race == RACE_VERPINE)
        {
            ch->Echo("What ears?.\r\n");
            return;
        }
        if(!RemoveObject(ch, WEAR_EARS, fReplace))
            return;
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n wears $p on $s ears.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You wear $p on your ears.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }

        EquipCharacter(ch, obj, WEAR_EARS);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Legs:
        if(ch->Race == RACE_HUTT)
        {
            ch->Echo("Hutts don't have legs.\r\n");
            return;
        }
        if(!can_layer(ch, obj, WEAR_LEGS))
        {
            ch->Echo("It won't fit overtop of what you're already wearing.\r\n");
            return;
        }
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n slips into $p.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You slip into $p.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_LEGS);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Feet:
        if(ch->Race == RACE_HUTT)
        {
            ch->Echo("Hutts don't have feet!\r\n");
            return;
        }
        if(!can_layer(ch, obj, WEAR_FEET))
        {
            ch->Echo("It won't fit overtop of what you're already wearing.\r\n");
            return;
        }
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n wears $p on $s feet.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You wear $p on your feet.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_FEET);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Hands:
        if(!can_layer(ch, obj, WEAR_HANDS))
        {
            ch->Echo("It won't fit overtop of what you're already wearing.\r\n");
            return;
        }
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n wears $p on $s hands.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You wear $p on your hands.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_HANDS);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Arms:
        if(!can_layer(ch, obj, WEAR_ARMS))
        {
            ch->Echo("It won't fit overtop of what you're already wearing.\r\n");
            return;
        }
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n wears $p on $s arms.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You wear $p on your arms.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_ARMS);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::About:
        if(!can_layer(ch, obj, WEAR_ABOUT))
        {
            ch->Echo("It won't fit overtop of what you're already wearing.\r\n");
            return;
        }

        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n wears $p about $s body.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You wear $p about your body.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_ABOUT);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Waist:
        if(!can_layer(ch, obj, WEAR_WAIST))
        {
            ch->Echo("It won't fit overtop of what you're already wearing.\r\n");
            return;
        }
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n wears $p about $s waist.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You wear $p about your waist.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_WAIST);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Wrist:
        if(GetEquipmentOnCharacter(ch, WEAR_WRIST_L)
           && GetEquipmentOnCharacter(ch, WEAR_WRIST_R)
           && !RemoveObject(ch, WEAR_WRIST_L, fReplace)
           && !RemoveObject(ch, WEAR_WRIST_R, fReplace))
            return;

        if(!GetEquipmentOnCharacter(ch, WEAR_WRIST_L))
        {
            if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
            {
                if(obj->ActionDescription.empty())
                {
                    Act(AT_ACTION, "$n fits $p around $s left wrist.",
                        ch, obj, NULL, ActTarget::Room);
                    Act(AT_ACTION, "You fit $p around your left wrist.",
                        ch, obj, NULL, ActTarget::Char);
                }
                else
                    ActionDescription(ch, obj);
            }
            EquipCharacter(ch, obj, WEAR_WRIST_L);
            ObjProgWearTrigger(ch, obj);
            return;
        }

        if(!GetEquipmentOnCharacter(ch, WEAR_WRIST_R))
        {
            if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
            {
                if(obj->ActionDescription.empty())
                {
                    Act(AT_ACTION, "$n fits $p around $s right wrist.",
                        ch, obj, NULL, ActTarget::Room);
                    Act(AT_ACTION, "You fit $p around your right wrist.",
                        ch, obj, NULL, ActTarget::Char);
                }
                else
                    ActionDescription(ch, obj);
            }
            EquipCharacter(ch, obj, WEAR_WRIST_R);
            ObjProgWearTrigger(ch, obj);
            return;
        }

        Log->Bug("Wear_obj: no free wrist.");
        ch->Echo("You already wear two wrist items.\r\n");
        return;

    case Flag::Wear::Shield:
        if(!RemoveObject(ch, WEAR_SHIELD, fReplace))
            return;
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n uses $p as an energy shield.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You use $p as an energy shield.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_SHIELD);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Wield:
        if((tmpobj = GetEquipmentOnCharacter(ch, WEAR_WIELD)) != NULL
           && !could_dual(ch))
        {
            ch->Echo("You're already wielding something.\r\n");
            return;
        }

        if(tmpobj)
        {
            if(can_dual(ch))
            {
                if(GetObjectWeight(obj) + GetObjectWeight(tmpobj) > StrengthBonus[GetCurrentStrength(ch)].Wield)
                {
                    ch->Echo("It is too heavy for you to wield.\r\n");
                    return;
                }

                if(obj->ItemType == ITEM_WEAPON && obj->Value[3] == WEAPON_LIGHTSABER)
                {
                    ch->Echo("You can't dual-wield lightsabers.\r\n");
                    return;
                }

                if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
                {
                    if(obj->ActionDescription.empty())
                    {
                        Act(AT_ACTION, "$n dual-wields $p.", ch, obj, NULL, ActTarget::Room);
                        Act(AT_ACTION, "You dual-wield $p.", ch, obj, NULL, ActTarget::Char);
                    }
                    else
                    {
                        ActionDescription(ch, obj);
                    }
                }

                EquipCharacter(ch, obj, WEAR_DUAL_WIELD);
                ObjProgWearTrigger(ch, obj);
            }
            return;
        }

        if(GetObjectWeight(obj) > StrengthBonus[GetCurrentStrength(ch)].Wield)
        {
            ch->Echo("It is too heavy for you to wield.\r\n");
            return;
        }

        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n wields $p.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You wield $p.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_WIELD);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Hold:
        if(GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD))
        {
            ch->Echo("You cannot hold something AND two weapons!\r\n");
            return;
        }
        if(!RemoveObject(ch, WEAR_HOLD, fReplace))
            return;
        if(obj->ItemType == ITEM_DEVICE
           || obj->ItemType == ITEM_GRENADE
           || obj->ItemType == ITEM_FOOD
           || obj->ItemType == ITEM_PILL
           || obj->ItemType == ITEM_POTION
           || obj->ItemType == ITEM_DRINK_CON
           || obj->ItemType == ITEM_SALVE
           || obj->ItemType == ITEM_KEY
           || !ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            Act(AT_ACTION, "$n holds $p in $s hands.", ch, obj, NULL, ActTarget::Room);
            Act(AT_ACTION, "You hold $p in your hands.", ch, obj, NULL, ActTarget::Char);
        }
        EquipCharacter(ch, obj, WEAR_HOLD);
        ObjProgWearTrigger(ch, obj);
        return;

    case Flag::Wear::Floating:
        if(!can_layer(ch, obj, WEAR_FLOATING))
        {
            ch->Echo("It won't fit overtop of what you're already wearing.\r\n");
            return;
        }
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n activates $p. $p takes up position behind $n", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You activate $p and it takes up position behind you.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_FLOATING);
        ObjProgWearTrigger(ch, obj);
        return;
    case Flag::Wear::Over:
        if(!RemoveObject(ch, WEAR_OVER, fReplace))
            return;
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, nullptr))
        {
            if(obj->ActionDescription.empty())
            {
                Act(AT_ACTION, "$n wears $p.", ch, obj, NULL, ActTarget::Room);
                Act(AT_ACTION, "You wear $p over you.", ch, obj, NULL, ActTarget::Char);
            }
            else
                ActionDescription(ch, obj);
        }
        EquipCharacter(ch, obj, WEAR_OVER);
        ObjProgWearTrigger(ch, obj);
        return;
    }
}

/*
 * Check to see if there is room to wear another object on this location
 * (Layered clothing support)
 */
static bool can_layer(const std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, int wear_loc)
{
    long bitlayers = 0;
    const long objlayers = obj->Prototype->Layers;

    for(auto otmp : ch->Objects())
    {
        if(otmp->WearLoc == wear_loc)
        {
            if(!otmp->Prototype->Layers)
                return false;
            else
                bitlayers |= otmp->Prototype->Layers;
        }
    }

    if((bitlayers && !objlayers) || bitlayers > objlayers)
        return false;

    if(!bitlayers || ((bitlayers & ~objlayers) == bitlayers))
        return true;

    return false;
}

/*
 * See if char could be capable of dual-wielding                -Thoric
 */
static bool could_dual(const std::shared_ptr<Character> ch)
{
    if(IsNpc(ch))
        return true;

    if(ch->PCData->Learned[gsn_dual_wield])
        return true;

    return false;
}

/*
 * See if char can dual wield at this time                      -Thoric
 */
static bool can_dual(const std::shared_ptr<Character> ch)
{
    if(!could_dual(ch))
    {
        return false;
    }

    if(GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD))
    {
        ch->Echo("You are already wielding two weapons!\r\n");
        return false;
    }

    if(GetEquipmentOnCharacter(ch, WEAR_HOLD))
    {
        ch->Echo("You cannot dual wield while holding something!\r\n");
        return false;
    }

    return true;
}
