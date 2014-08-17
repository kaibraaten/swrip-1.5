#include "mud.h"

void do_makeshop( Character *ch, char *argument )
{
  SHOP_DATA *shop;
  short vnum;
  ProtoMobile *mob;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeshop <mobvnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = get_mob_index(vnum)) == NULL )
    {
      send_to_char( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !can_medit(ch, mob) )
    return;

  if ( mob->pShop )
    {
      send_to_char( "This mobile already has a shop.\r\n", ch );
      return;
    }

  AllocateMemory( shop, SHOP_DATA, 1 );

  LINK( shop, first_shop, last_shop, next, prev );
  shop->keeper  = vnum;
  shop->profit_buy      = 120;
  shop->profit_sell     = 90;
  shop->business_hours.open       = 0;
  shop->business_hours.close      = 23;
  mob->pShop            = shop;
  send_to_char( "Done.\r\n", ch );
}
