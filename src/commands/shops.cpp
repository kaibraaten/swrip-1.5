#include "mud.hpp"
#include "shop.hpp"

void do_shops( Character *ch, char *argument )
{
  Shop *shop;

  if ( !FirstShop )
    {
      SendToCharacter( "There are no shops.\r\n", ch );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );
  for ( shop = FirstShop; shop; shop = shop->Next )
    Echo( ch, "Keeper: %5d Buy: %3d Sell: %3d Open: %2d Close: %2d Buy: %2d %2d %2d %2d %2d\r\n",
               shop->Keeper,       shop->ProfitBuy, shop->ProfitSell,
               shop->BusinessHours.Open,   shop->BusinessHours.Close,
               shop->BuyType[0], shop->BuyType[1],
               shop->BuyType[2], shop->BuyType[3], shop->BuyType[4] );
}
