#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "protomob.hpp"
#include "repos/shoprepository.hpp"

void do_makerepair( Character *ch, std::string argument )
{
  if ( argument.empty() )
    {
      ch->Echo("Usage: makerepair <mobvnum>\r\n");
      return;
    }

  vnum_t vnum = std::stoi( argument );
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

  repair->Keeper = vnum;
  repair->ProfitFix = 100;
  repair->ShopType = SHOP_FIX;
  repair->BusinessHours.Open = 0;
  repair->BusinessHours.Close = 23;
  mob->RepairShop = repair;

  RepairShops->Add(repair);
  ch->Echo("Done.\r\n");
}
