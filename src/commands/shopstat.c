#include "mud.h"

void do_shopstat( Character *ch, char *argument )
{
  Shop *shop;
  ProtoMobile *mob;
  short vnum;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: shopstat <keeper vnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      SendToCharacter( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !mob->pShop )
    {
      SendToCharacter( "This mobile doesn't keep a shop.\r\n", ch );
      return;
    }
  shop = mob->pShop;

  Echo( ch, "Keeper: %d  %s\r\n", shop->keeper, mob->short_descr );
  Echo( ch, "buy0 [%s]  buy1 [%s]  buy2 [%s]  buy3 [%s]  buy4 [%s]\r\n",
             object_types[shop->buy_type[0]],
             object_types[shop->buy_type[1]],
             object_types[shop->buy_type[2]],
             object_types[shop->buy_type[3]],
             object_types[shop->buy_type[4]] );
  Echo( ch, "Profit:  buy %3d%%  sell %3d%%\r\n",
             shop->profit_buy,
             shop->profit_sell );
  Echo( ch, "Hours:   open %2d  close %2d\r\n",
             shop->business_hours.open,
             shop->business_hours.close );
}
