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

#ifndef _SWRIP_SHOP_H_
#define _SWRIP_SHOP_H_

#include "types.h"
#include "constants.h"

#define VENDOR_FEE  .05 /*fee vendor charges, taken out of all gode with teh GETGOLD command*/

struct Shop
{
  Shop *Next;                  /* Next shop in list            */
  Shop *Previous;                  /* Previous shop in list        */
  vnum_t     Keeper;                /* Vnum of shop keeper mob      */
  ItemTypes  BuyType[MAX_TRADE];   /* Item types shop will buy     */
  short      ProfitBuy;            /* Cost multiplier for buying   */
  short      ProfitSell;           /* Cost multiplier for selling  */

  struct
  {
    short Open;              /* First opening hour           */
    short Close;             /* First closing hour           */
  } BusinessHours;
};

struct RepairShop
{
  RepairShop *Next;                /* Next shop in list            */
  RepairShop *Previous;                /* Previous shop in list        */
  vnum_t       Keeper;              /* Vnum of shop keeper mob      */
  ItemTypes FixType[MAX_FIX];   /* Item types shop will fix     */
  short        ProfitFix;          /* Cost multiplier for fixing   */
  short       ShopType;            /* Repair shop type             */

  struct
  {
    short Open;              /* First opening hour           */
    short Close;             /* First closing hour           */
  } BusinessHours;
};

Character *FindFixer( const Character *ch );
int GetRepairCost( const Character *keeper, const Object *obj );
Character *FindKeeper( const Character *ch );
Character *FindKeeperQ( const Character *ch, bool message );
int GetObjectCost( const Character *ch, const Character *keeper, const Object *obj, bool fBuy );
void WriteVendor( FILE *fp, Character *mob );
Character *ReadVendor( FILE *fp );
void LoadVendors( void );
void SaveVendor( Character *ch );

#endif
