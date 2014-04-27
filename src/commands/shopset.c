#include "mud.h"

void do_shopset( CHAR_DATA *ch, char *argument )
{
  SHOP_DATA *shop;
  MOB_INDEX_DATA *mob, *mob2;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  short vnum;
  int value;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Usage: shopset <mob vnum> <field> value\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "  buy0 buy1 buy2 buy3 buy4 buy sell open close keeper\r\n", ch );
      return;
    }

  vnum = atoi( arg1 );

  if ( (mob = get_mob_index(vnum)) == NULL )
    {
      send_to_char( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !can_medit(ch, mob) )
    return;

  if ( !mob->pShop )
    {
      send_to_char( "This mobile doesn't keep a shop.\r\n", ch );
      return;
    }
  shop = mob->pShop;
  value = atoi( argument );

  if ( !str_cmp( arg2, "buy0" ) )
    {
      if ( !is_number(argument) )
        value = get_objecttype(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          send_to_char( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[0] = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "buy1" ) )
    {
      if ( !is_number(argument) )
        value = get_objecttype(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          send_to_char( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[1] = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "buy2" ) )
    {
      if ( !is_number(argument) )
        value = get_objecttype(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          send_to_char( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[2] = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "buy3" ) )
    {
      if ( !is_number(argument) )
        value = get_objecttype(argument);

      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          send_to_char( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[3] = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "buy4" ) )
    {
      if ( !is_number(argument) )
        value = get_objecttype(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          send_to_char( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[4] = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "buy" ) )
    {
      if ( value <= (shop->profit_sell+5) || value > 1000 )
        {
          send_to_char( "Out of range.\r\n", ch );
          return;
        }
      shop->profit_buy = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "sell" ) )
    {
      if ( value < 0 || value >= (shop->profit_buy-5) )
        {
          send_to_char( "Out of range.\r\n", ch );
          return;
        }
      shop->profit_sell = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "open" ) )
    {
      if ( value < 0 || value > 23 )
        {
          send_to_char( "Out of range.\r\n", ch );
          return;
        }
      shop->business_hours.open = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "close" ) )
    {
      if ( value < 0 || value > 23 )
        {
          send_to_char( "Out of range.\r\n", ch );
          return;
        }
      shop->business_hours.close = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "keeper" ) )
    {
      if ( (mob2 = get_mob_index(vnum)) == NULL )
        {
          send_to_char( "Mobile not found.\r\n", ch );
          return;
        }
      if ( !can_medit(ch, mob) )
        return;
      if ( mob2->pShop )
        {
          send_to_char( "That mobile already has a shop.\r\n", ch );
          return;
        }
      mob->pShop  = NULL;
      mob2->pShop = shop;
      shop->keeper = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  do_shopset( ch, "" );
}
