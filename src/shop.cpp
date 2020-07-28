/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifdef __STRICT_ANSI__
 /* To include the prototype for fchmod() */
#define _DEFAULT_SOURCE

#if defined(__NetBSD__)
#define _NETBSD_SOURCE
#endif

/* To include the prototype for fileno() */
#define _POSIX_SOURCE
#endif

#include <cctype>
#include <cstring>
#include <cassert>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "repos/vendorrepository.hpp"

#define COST_EQUATION  (int) (cost*CostEquation( obj ))

Shop::Shop()
{
    BuyType.fill(0);
}

RepairShop::RepairShop()
{
    FixType.fill(0);
}

static float CostEquation(std::shared_ptr<Object> obj)
{
    float count = obj->Prototype->Count;

    count = urange(50, count, 500);

    return 100 / count;
}

/*
 * Shopping commands.
 */
std::shared_ptr<Character> FindKeeper(std::shared_ptr<Character> ch)
{
    return FindKeeperQ(ch, true);
}

std::shared_ptr<Character> FindKeeperQ(std::shared_ptr<Character> ch, bool message)
{
    std::shared_ptr<Character> keeper;
    std::shared_ptr<Shop> pShop;

    for(auto i = std::begin(ch->InRoom->Characters()); i != std::end(ch->InRoom->Characters()); ++i)
    {
        keeper = *i;

        if(IsNpc(keeper) && (pShop = keeper->Prototype->Shop) != NULL)
        {
            break;
        }
    }

    if(!pShop)
    {
        if(message)
        {
            ch->Echo("You can't do that here.\r\n");
        }

        return NULL;
    }

    /*
     * Shop hours.
     */
    if(pShop->BusinessHours.Open > pShop->BusinessHours.Close)
    {
        if(time_info.Hour < pShop->BusinessHours.Open
           && time_info.Hour > pShop->BusinessHours.Close)
        {
            do_say(keeper, "Sorry, come back later.");
            return NULL;
        }
    }
    else if(time_info.Hour < pShop->BusinessHours.Open
            || time_info.Hour > pShop->BusinessHours.Close)
    {
        if(time_info.Hour > pShop->BusinessHours.Open)
        {
            do_say(keeper, "Sorry, come back later.");
            return NULL;
        }

        if(time_info.Hour > pShop->BusinessHours.Close)
        {
            do_say(keeper, "Sorry, come back tomorrow.");
            return NULL;
        }
    }

    if(!CharacterKnowsLanguage(keeper, ch->Speaking, ch))
    {
        do_say(keeper, "I can't understand you.");
        return NULL;
    }

    return keeper;
}

/*
 * repair commands.
 */
std::shared_ptr<Character> FindFixer(std::shared_ptr<Character> ch)
{
    std::shared_ptr<Character> keeper;
    std::shared_ptr<RepairShop> rShop;

    for(auto i = std::begin(ch->InRoom->Characters()); i != std::end(ch->InRoom->Characters()); ++i)
    {
        keeper = *i;

        if(IsNpc(keeper) && (rShop = keeper->Prototype->RepairShop) != NULL)
        {
            break;
        }
    }

    if(!rShop)
    {
        ch->Echo("You can't do that here.\r\n");
        return NULL;
    }

    /*
     * Shop hours.
     */
    if(time_info.Hour < rShop->BusinessHours.Open)
    {
        do_say(keeper, "Sorry, come back later.");
        return NULL;
    }

    if(time_info.Hour > rShop->BusinessHours.Close)
    {
        do_say(keeper, "Sorry, come back tomorrow.");
        return NULL;
    }

    if(!CharacterKnowsLanguage(keeper, ch->Speaking, ch))
    {
        do_say(keeper, "I can't understand you.");
        return NULL;
    }

    return keeper;
}

int GetObjectCost(std::shared_ptr<Character> ch, std::shared_ptr<Character> keeper, std::shared_ptr<Object> obj, bool fBuy)
{
    std::shared_ptr<Shop> pShop;
    int cost = 0;

    if(!obj || (pShop = keeper->Prototype->Shop) == NULL)
    {
        return 0;
    }

    bool richcustomer = ch->Gold + (IsNpc(ch) ? 0 : ch->PCData->Bank) > ch->TopLevel() * 1000;

    if(fBuy)
    {
        int profitmod = 13 - GetCurrentCharisma(ch) + (richcustomer ? 15 : 0)
            + ((urange(5, ch->TopLevel(), LEVEL_AVATAR) - 20) / 2);
        cost = (int)(obj->Cost
                     * umax((pShop->ProfitSell + 1), pShop->ProfitBuy + profitmod))
            / 100;
    }
    else
    {
        int profitmod = GetCurrentCharisma(ch) - 13 - (richcustomer ? 15 : 0);

        for(int itype = 0; itype < MAX_TRADE; itype++)
        {
            if(obj->ItemType == pShop->BuyType[itype])
            {
                cost = (int)(obj->Cost
                             * umin((pShop->ProfitBuy - 1),
                                    pShop->ProfitSell + profitmod)) / 100;
                break;
            }
        }

        for(auto obj2 : keeper->Objects())
        {
            if(obj->Prototype == obj2->Prototype)
            {
                cost /= (obj2->Count + 1);
                break;
            }
        }

        cost = umin(cost, 2500);
    }

    if(cost > 0)
    {
        cost = COST_EQUATION;

        if(cost <= 0)
        {
            cost = 1;
        }
    }

    if(obj->ItemType == ITEM_ARMOR)
    {
        cost = (int)(cost * (obj->Value[OVAL_ARMOR_CONDITION] + 1) / (obj->Value[OVAL_ARMOR_AC] + 1));
    }

    if(obj->ItemType == ITEM_WEAPON)
    {
        cost = (int)(cost * (obj->Value[OVAL_WEAPON_CONDITION] + 1) / INIT_WEAPON_CONDITION + 1);
        cost = (int)(cost * (obj->Value[OVAL_WEAPON_CHARGE] + 1) / (obj->Value[OVAL_WEAPON_MAX_CHARGE] + 1));
    }

    if(obj->ItemType == ITEM_DEVICE)
    {
        cost = (int)(cost * (obj->Value[OVAL_DEVICE_CHARGES] + 1) / (obj->Value[OVAL_DEVICE_MAX_CHARGES] + 1));
    }

    return cost;
}

int GetRepairCost(std::shared_ptr<Character> keeper, std::shared_ptr<Object> obj)
{
    std::shared_ptr<RepairShop> rShop;
    int cost = 0;
    bool found = false;

    if(!obj || (rShop = keeper->Prototype->RepairShop) == NULL)
    {
        return 0;
    }

    for(int itype = 0; itype < MAX_FIX; itype++)
    {
        if(obj->ItemType == rShop->FixType[itype])
        {
            cost = (int)(obj->Cost * rShop->ProfitFix / 100);
            found = true;
            break;
        }
    }

    if(!found)
    {
        cost = -1;
    }

    if(cost == 0)
    {
        cost = 1;
    }

    if(found && cost > 0)
    {
        switch(obj->ItemType)
        {
        case ITEM_ARMOR:
            if(obj->Value[OVAL_ARMOR_CONDITION] >= obj->Value[OVAL_ARMOR_AC])
            {
                cost = -2;
            }
            else
            {
                cost *= (obj->Value[OVAL_ARMOR_AC] - obj->Value[OVAL_ARMOR_CONDITION]);
            }
            break;

        case ITEM_WEAPON:
            if(INIT_WEAPON_CONDITION == obj->Value[OVAL_WEAPON_CONDITION])
            {
                cost = -2;
            }
            else
            {
                cost *= (INIT_WEAPON_CONDITION - obj->Value[OVAL_WEAPON_CONDITION]);
            }
            break;

        case ITEM_DEVICE:
            if(obj->Value[OVAL_DEVICE_CHARGES] >= obj->Value[OVAL_DEVICE_MAX_CHARGES])
            {
                cost = -2;
            }
            else
            {
                cost *= (obj->Value[OVAL_DEVICE_MAX_CHARGES] - obj->Value[OVAL_DEVICE_CHARGES]);
            }

        default:
            break;
        }
    }

    return cost;
}

void SaveVendor(std::shared_ptr<Character> ch)
{
    Vendors->Save(ch);
}
