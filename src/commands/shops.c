#include "mud.h"

void do_shops( Character *ch, char *argument )
{
  SHOP_DATA *shop;

  if ( !first_shop )
    {
      send_to_char( "There are no shops.\r\n", ch );
      return;
    }

  set_char_color( AT_NOTE, ch );
  for ( shop = first_shop; shop; shop = shop->next )
    ch_printf( ch, "Keeper: %5d Buy: %3d Sell: %3d Open: %2d Close: %2d Buy: %2d %2d %2d %2d %2d\r\n",
               shop->keeper,       shop->profit_buy, shop->profit_sell,
               shop->business_hours.open,   shop->business_hours.close,
               shop->buy_type[0], shop->buy_type[1],
               shop->buy_type[2], shop->buy_type[3], shop->buy_type[4] );
}
