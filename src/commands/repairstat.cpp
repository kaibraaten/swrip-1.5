#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"

void do_repairstat( Character *ch, char *argument )
{
  RepairShop *repair;
  ProtoMobile *mob;
  vnum_t vnum;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: repairstat <keeper vnum>\r\n");
      return;
    }

  vnum = atoi( argument );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      ch->Echo("Mobile not found.\r\n");
      return;
    }

  if ( !mob->RepairShop )
    {
      ch->Echo("This mobile doesn't keep a repair shop.\r\n");
      return;
    }

  repair = mob->RepairShop;

  ch->Echo("Keeper: %d  %s\r\n", repair->Keeper, mob->ShortDescr );
  ch->Echo("fix0 [%s]  fix1 [%s]  fix2 [%s]\r\n",
             ObjectTypes[repair->FixType[0]],
             ObjectTypes[repair->FixType[1]],
             ObjectTypes[repair->FixType[2]] );
  ch->Echo("Profit: %3d%%  Type: %d\r\n",
             repair->ProfitFix,
             repair->ShopType );
  ch->Echo("Hours:   open %2d  close %2d\r\n",
             repair->BusinessHours.Open,
             repair->BusinessHours.Close );
}

