#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "protomob.hpp"

void do_makerepair( Character *ch, char *argument )
{
  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: makerepair <mobvnum>\r\n");
      return;
    }

  vnum_t vnum = atoi( argument );
  ProtoMobile *mob = GetProtoMobile(vnum);
  
  if ( mob == nullptr )
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

  RepairShop *repair = new RepairShop();

  RepairShops->Add(repair);
  repair->Keeper        = vnum;
  repair->ProfitFix    = 100;
  repair->ShopType     = SHOP_FIX;
  repair->BusinessHours.Open     = 0;
  repair->BusinessHours.Close    = 23;
  mob->RepairShop            = repair;
  ch->Echo("Done.\r\n");
}

