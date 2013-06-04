#include "mud.h"

void do_shopstat( Character *ch, char *argument )
{
  SHOP_DATA *shop;
  MOB_INDEX_DATA *mob;
  short vnum;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Usage: shopstat <keeper vnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = get_mob_index(vnum)) == NULL )
    {
      send_to_char( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !mob->pShop )
    {
      send_to_char( "This mobile doesn't keep a shop.\r\n", ch );
      return;
    }
  shop = mob->pShop;

  ch_printf( ch, "Keeper: %d  %s\r\n", shop->keeper, mob->short_descr );
  ch_printf( ch, "buy0 [%s]  buy1 [%s]  buy2 [%s]  buy3 [%s]  buy4 [%s]\r\n",
             object_types[shop->buy_type[0]],
             object_types[shop->buy_type[1]],
             object_types[shop->buy_type[2]],
             object_types[shop->buy_type[3]],
             object_types[shop->buy_type[4]] );
  ch_printf( ch, "Profit:  buy %3d%%  sell %3d%%\r\n",
             shop->profit_buy,
             shop->profit_sell );
  ch_printf( ch, "Hours:   open %2d  close %2d\r\n",
             shop->business_hours.open,
             shop->business_hours.close );
}
