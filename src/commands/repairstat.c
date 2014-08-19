#include "mud.h"

void do_repairstat( Character *ch, char *argument )
{
  REPAIR_DATA *repair;
  ProtoMobile *mob;
  short vnum;

  if ( argument[0] == '\0' )
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

  ChPrintf( ch, "Keeper: %d  %s\r\n", repair->keeper, mob->short_descr );
  ChPrintf( ch, "fix0 [%s]  fix1 [%s]  fix2 [%s]\r\n",
             object_types[repair->fix_type[0]],
             object_types[repair->fix_type[1]],
             object_types[repair->fix_type[2]] );
  ChPrintf( ch, "Profit: %3d%%  Type: %d\r\n",
             repair->profit_fix,
             repair->shop_type );
  ChPrintf( ch, "Hours:   open %2d  close %2d\r\n",
             repair->business_hours.open,
             repair->business_hours.close );
}
