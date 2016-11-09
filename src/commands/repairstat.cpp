#include "mud.hpp"
#include "shop.hpp"

void do_repairstat( Character *ch, std::string argument )
{
  RepairShop *repair;
  ProtoMobile *mob;
  vnum_t vnum;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: repairstat <keeper vnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      SendToCharacter( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !mob->RepairShop )
    {
      SendToCharacter( "This mobile doesn't keep a repair shop.\r\n", ch );
      return;
    }

  repair = mob->RepairShop;

  Echo( ch, "Keeper: %d  %s\r\n", repair->Keeper, mob->ShortDescr );
  Echo( ch, "fix0 [%s]  fix1 [%s]  fix2 [%s]\r\n",
             ObjectTypes[repair->FixType[0]],
             ObjectTypes[repair->FixType[1]],
             ObjectTypes[repair->FixType[2]] );
  Echo( ch, "Profit: %3d%%  Type: %d\r\n",
             repair->ProfitFix,
             repair->ShopType );
  Echo( ch, "Hours:   open %2d  close %2d\r\n",
             repair->BusinessHours.Open,
             repair->BusinessHours.Close );
}
