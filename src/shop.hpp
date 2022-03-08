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

#ifndef _SWRIP_SHOP_HPP_
#define _SWRIP_SHOP_HPP_

#include <array>
#include "types.hpp"
#include "constants.hpp"

#define VENDOR_FEE  .05 /*fee vendor charges, taken out of all gode with teh GETGOLD command*/

class Object;
class Character;

class Shop
{
public:
    Shop();
    vnum_t Keeper = INVALID_VNUM;                /* Vnum of shop keeper mob      */
    std::array<ItemTypes, MAX_TRADE> BuyType; /* Item types shop will buy     */
    short ProfitBuy = 0;            /* Cost multiplier for buying   */
    short ProfitSell = 0;           /* Cost multiplier for selling  */

    struct
    {
        short Open = 0;              /* First opening hour           */
        short Close = 0;             /* First closing hour           */
    } BusinessHours;
};

class RepairShop
{
public:
    RepairShop();
    vnum_t Keeper = INVALID_VNUM;              /* Vnum of shop keeper mob      */
    std::array<ItemTypes, MAX_FIX> FixType; /* Item types shop will fix     */
    short ProfitFix = 0;          /* Cost multiplier for fixing   */
    short ShopType = 0;            /* Repair shop type             */

    struct
    {
        short Open = 0;              /* First opening hour           */
        short Close = 0;             /* First closing hour           */
    } BusinessHours;
};

std::shared_ptr<Character> FindFixer(std::shared_ptr<Character> ch);
int GetRepairCost(std::shared_ptr<Character> keeper, std::shared_ptr<Object> obj);
std::shared_ptr<Character> FindKeeper(std::shared_ptr<Character> ch);
std::shared_ptr<Character> FindKeeperQ(std::shared_ptr<Character> ch, bool message);
int GetObjectCost(std::shared_ptr<Character> ch, std::shared_ptr<Character> keeper, std::shared_ptr<Object> obj, bool fBuy);
void LoadVendors();
void SaveVendor(std::shared_ptr<Character> ch);

#endif
