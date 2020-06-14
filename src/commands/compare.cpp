#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"
#include "act.hpp"

void do_compare(Character *ch, std::string argument)
{
    std::string arg1;
    std::string arg2;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(arg1.empty())
    {
        ch->Echo("Compare what to what?\r\n");
        return;
    }

    const Object *obj1 = GetCarriedObject(ch, arg1);

    if(obj1 == nullptr)
    {
        ch->Echo("You do not have that item.\r\n");
        return;
    }

    const Object *obj2 = nullptr;

    if(arg2.empty())
    {
        for(const Object *iter : ch->Objects())
        {
            if(iter->WearLoc != WEAR_NONE
               && CanSeeObject(ch, iter)
               && obj1->ItemType == iter->ItemType
               && (obj1->WearFlags.to_ulong() & iter->WearFlags.to_ulong() & ~(1 << Flag::Wear::Take)) != 0)
            {
                obj2 = iter;
                break;
            }
        }

        if(!obj2)
        {
            ch->Echo("You aren't wearing anything comparable.\r\n");
            return;
        }
    }
    else
    {
        obj2 = GetCarriedObject(ch, arg2);

        if(obj2 == nullptr)
        {
            ch->Echo("You do not have that item.\r\n");
            return;
        }
    }

    const char *msg = nullptr;
    int value1 = 0;
    int value2 = 0;

    if(obj1 == obj2)
    {
        msg = "You compare $p to itself. It looks about the same.";
    }
    else if(obj1->ItemType != obj2->ItemType)
    {
        msg = "You can't compare $p and $P.";
    }
    else
    {
        switch(obj1->ItemType)
        {
        default:
            msg = "You can't compare $p and $P.";
            break;

        case ITEM_ARMOR:
            value1 = obj1->Value[OVAL_ARMOR_CONDITION];
            value2 = obj2->Value[OVAL_ARMOR_CONDITION];
            break;

        case ITEM_WEAPON:
            value1 = obj1->Value[OVAL_WEAPON_NUM_DAM_DIE] + obj1->Value[OVAL_WEAPON_SIZE_DAM_DIE];
            value2 = obj2->Value[OVAL_WEAPON_NUM_DAM_DIE] + obj2->Value[OVAL_WEAPON_SIZE_DAM_DIE];
            break;
        }
    }

    if(msg == nullptr)
    {
        if(value1 == value2)
            msg = "$p and $P look about the same.";
        else if(value1 > value2)
            msg = "$p looks better than $P.";
        else
            msg = "$p looks worse than $P.";
    }

    Act(AT_PLAIN, msg, ch, obj1, obj2, ActTarget::Char);
}
