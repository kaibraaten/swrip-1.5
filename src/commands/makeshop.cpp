#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"

void do_makeshop( Character *ch, char *argument )
{
  Shop *shop;
  short vnum;
  ProtoMobile *mob;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: makeshop <mobvnum>\r\n");
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

  if ( mob->Shop )
    {
      ch->Echo("This mobile already has a shop.\r\n");
      return;
    }

  AllocateMemory( shop, Shop, 1 );

  LINK( shop, FirstShop, LastShop, Next, Previous );
  shop->Keeper  = vnum;
  shop->ProfitBuy      = 120;
  shop->ProfitSell     = 90;
  shop->BusinessHours.Open       = 0;
  shop->BusinessHours.Close      = 23;
  mob->Shop            = shop;
  ch->Echo("Done.\r\n");
}

