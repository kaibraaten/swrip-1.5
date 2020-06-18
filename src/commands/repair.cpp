#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protomob.hpp"
#include "act.hpp"

static void repair_one_obj(std::shared_ptr<Character> ch, Character *keeper, std::shared_ptr<Object> obj,
                           std::string arg, int maxgold,
                           const std::string &fixstr, const std::string &fixstr2);

void do_repair(std::shared_ptr<Character> ch, std::string argument)
{
    if(argument.empty())
    {
        ch->Echo("Repair what?\r\n");
        return;
    }

    Character *keeper = FindFixer(ch);

    if(keeper == nullptr)
        return;

    long maxgold = keeper->TopLevel * 10;
    std::string fixstr;
    std::string fixstr2;

    switch(keeper->Prototype->RepairShop->ShopType)
    {
    default:
    case SHOP_FIX:
        fixstr = "repair";
        fixstr2 = "repairs";
        break;

    case SHOP_RECHARGE:
        fixstr = "recharge";
        fixstr2 = "recharges";
        break;
    }

    if(!StrCmp(argument, "all"))
    {
        for(auto obj : ch->Objects())
        {
            if(obj->WearLoc == WEAR_NONE
               && CanSeeObject(ch, obj)
               && (obj->ItemType == ITEM_ARMOR
                   || obj->ItemType == ITEM_WEAPON
                   || obj->ItemType == ITEM_DEVICE))
            {
                repair_one_obj(ch, keeper, obj, argument, maxgold, fixstr, fixstr2);
            }
        }

        return;
    }

    auto obj = GetCarriedObject(ch, argument);

    if(obj == nullptr)
    {
        Act(AT_TELL, "$n tells you 'You don't have that item.'",
            keeper, NULL, ch, ActTarget::Vict);
        ch->Reply = keeper;
        return;
    }

    repair_one_obj(ch, keeper, obj, argument, maxgold, fixstr, fixstr2);
}

static void repair_one_obj(std::shared_ptr<Character> ch, Character *keeper, std::shared_ptr<Object> obj,
                           std::string arg, int maxgold,
                           const std::string &fixstr, const std::string &fixstr2)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    int cost = 0;

    if(!CanDropObject(ch, obj))
    {
        ch->Echo("You can't let go of %s.\r\n", obj->Name.c_str());
    }
    else if((cost = GetRepairCost(keeper, obj)) < 0)
    {
        if(cost != -2)
            Act(AT_TELL, "$n tells you, 'Sorry, I can't do anything with $p.'",
                keeper, obj, ch, ActTarget::Vict);
        else
            Act(AT_TELL, "$n tells you, '$p looks fine to me!'", keeper, obj, ch, ActTarget::Vict);
    }
    /* "repair all" gets a 10% surcharge - Gorog */

    else if((cost = StrCmp("all", arg) ? cost : 11 * cost / 10) > ch->Gold)
    {
        sprintf(buf,
                "$N tells you, 'It will cost %d credit%s to %s %s...'", cost,
                cost == 1 ? "" : "s", fixstr.c_str(), obj->Name.c_str());
        Act(AT_TELL, buf, ch, NULL, keeper, ActTarget::Char);
        Act(AT_TELL, "$N tells you, 'Which I see you can't afford.'", ch,
            NULL, keeper, ActTarget::Char);
    }
    else
    {
        sprintf(buf, "$n gives $p to $N, who quickly %s it.", fixstr2.c_str());
        Act(AT_ACTION, buf, ch, obj, keeper, ActTarget::Room);
        sprintf(buf, "$N charges you %d credit%s to %s $p.",
                cost, cost == 1 ? "" : "s", fixstr.c_str());
        Act(AT_ACTION, buf, ch, obj, keeper, ActTarget::Char);
        ch->Gold -= cost;
        keeper->Gold += cost;

        if(keeper->Gold < 0)
        {
            keeper->Gold = 0;
        }
        else if(keeper->Gold > maxgold)
        {
            BoostEconomy(keeper->InRoom->Area, keeper->Gold - maxgold / 2);
            keeper->Gold = maxgold / 2;
            Act(AT_ACTION, "$n puts some credits into a large safe.", keeper,
                NULL, NULL, ActTarget::Room);
        }

        switch(obj->ItemType)
        {
        default:
            ch->Echo("For some reason, you think you got ripped off...\r\n");
            break;

        case ITEM_ARMOR:
            obj->Value[OVAL_ARMOR_CONDITION] = obj->Value[OVAL_ARMOR_AC];
            break;

        case ITEM_WEAPON:
            obj->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
            break;

        case ITEM_DEVICE:
            obj->Value[OVAL_DEVICE_CHARGES] = obj->Value[OVAL_DEVICE_MAX_CHARGES];
            break;
        }

        ObjProgRepairTrigger(ch, obj);
    }
}

