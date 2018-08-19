#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "protomob.hpp"

void do_makeshop( Character *ch, char *argument )
{
  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: makeshop <mobvnum>\r\n");
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

  if ( mob->Shop )
    {
      ch->Echo("This mobile already has a shop.\r\n");
      return;
    }

  Shop *shop = new Shop();

  Shops->Add(shop);
  shop->Keeper  = vnum;
  shop->ProfitBuy      = 120;
  shop->ProfitSell     = 90;
  shop->BusinessHours.Open       = 0;
  shop->BusinessHours.Close      = 23;
  mob->Shop            = shop;
  ch->Echo("Done.\r\n");
}

