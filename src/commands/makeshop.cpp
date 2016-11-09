#include "mud.hpp"
#include "shop.hpp"

void do_makeshop( Character *ch, std::string argument )
{
  Shop *shop;
  short vnum;
  ProtoMobile *mob;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeshop <mobvnum>\r\n", ch );
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

  if ( mob->Shop )
    {
      SendToCharacter( "This mobile already has a shop.\r\n", ch );
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
  SendToCharacter( "Done.\r\n", ch );
}
