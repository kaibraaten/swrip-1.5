#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"

void do_makerepair( Character *ch, char *argument )
{
  RepairShop *repair;
  short vnum;
  ProtoMobile *mob;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: makerepair <mobvnum>\r\n");
      return;
    }

  vnum = atoi( argument );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      ch->Echo("Mobile not found.\r\n");
      return;
    }

  if ( !CanMedit(ch, mob) )
    return;

  if ( mob->RepairShop )
    {
      ch->Echo("This mobile already has a repair shop.\r\n");
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
  ch->Echo("Done.\r\n");
}

