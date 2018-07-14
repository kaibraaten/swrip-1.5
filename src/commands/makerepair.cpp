#include "mud.hpp"
#include "shop.hpp"

void do_makerepair( Character *ch, char *argument )
{
  RepairShop *repair;
  short vnum;
  ProtoMobile *mob;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makerepair <mobvnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      SendToCharacter( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !CanMedit(ch, mob) )
    return;

  if ( mob->RepairShop )
    {
      SendToCharacter( "This mobile already has a repair shop.\r\n", ch );
      return;
    }

  AllocateMemory( repair, RepairShop, 1 );

  LINK( repair, FirstRepairShop, LastRepairShop, Next, Previous );
  repair->Keeper        = vnum;
  repair->ProfitFix    = 100;
  repair->ShopType     = SHOP_FIX;
  repair->BusinessHours.Open     = 0;
  repair->BusinessHours.Close    = 23;
  mob->RepairShop            = repair;
  SendToCharacter( "Done.\r\n", ch );
}
