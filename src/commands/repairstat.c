#include "mud.h"

void do_repairstat( Character *ch, char *argument )
{
  RepairShop *repair;
  ProtoMobile *mob;
  short vnum;

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

  if ( !mob->rShop )
    {
      SendToCharacter( "This mobile doesn't keep a repair shop.\r\n", ch );
      return;
    }
  repair = mob->rShop;

  Echo( ch, "Keeper: %d  %s\r\n", repair->keeper, mob->short_descr );
  Echo( ch, "fix0 [%s]  fix1 [%s]  fix2 [%s]\r\n",
             ObjectTypes[repair->fix_type[0]],
             ObjectTypes[repair->fix_type[1]],
             ObjectTypes[repair->fix_type[2]] );
  Echo( ch, "Profit: %3d%%  Type: %d\r\n",
             repair->profit_fix,
             repair->shop_type );
  Echo( ch, "Hours:   open %2d  close %2d\r\n",
             repair->business_hours.open,
             repair->business_hours.close );
}
