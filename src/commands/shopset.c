#include "mud.h"

void do_shopset( Character *ch, char *argument )
{
  Shop *shop;
  ProtoMobile *mob, *mob2;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  short vnum;
  int value;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Usage: shopset <mob vnum> <field> value\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( "  buy0 buy1 buy2 buy3 buy4 buy sell open close keeper\r\n", ch );
      return;
    }

  vnum = atoi( arg1 );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      SendToCharacter( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !CanMedit(ch, mob) )
    return;

  if ( !mob->pShop )
    {
      SendToCharacter( "This mobile doesn't keep a shop.\r\n", ch );
      return;
    }
  shop = mob->pShop;
  value = atoi( argument );

  if ( !StrCmp( arg2, "buy0" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          SendToCharacter( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[0] = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "buy1" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          SendToCharacter( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[1] = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "buy2" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          SendToCharacter( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[2] = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "buy3" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);

      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          SendToCharacter( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[3] = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "buy4" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          SendToCharacter( "Invalid item type!\r\n", ch );
          return;
        }
      shop->buy_type[4] = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "buy" ) )
    {
      if ( value <= (shop->profit_sell+5) || value > 1000 )
        {
          SendToCharacter( "Out of range.\r\n", ch );
          return;
        }
      shop->profit_buy = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "sell" ) )
    {
      if ( value < 0 || value >= (shop->profit_buy-5) )
        {
          SendToCharacter( "Out of range.\r\n", ch );
          return;
        }
      shop->profit_sell = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "open" ) )
    {
      if ( value < 0 || value > 23 )
        {
          SendToCharacter( "Out of range.\r\n", ch );
          return;
        }
      shop->business_hours.open = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "close" ) )
    {
      if ( value < 0 || value > 23 )
        {
          SendToCharacter( "Out of range.\r\n", ch );
          return;
        }
      shop->business_hours.close = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "keeper" ) )
    {
      if ( (mob2 = GetProtoMobile(vnum)) == NULL )
        {
          SendToCharacter( "Mobile not found.\r\n", ch );
          return;
        }
      if ( !CanMedit(ch, mob) )
        return;
      if ( mob2->pShop )
        {
          SendToCharacter( "That mobile already has a shop.\r\n", ch );
          return;
        }
      mob->pShop  = NULL;
      mob2->pShop = shop;
      shop->keeper = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  do_shopset( ch, "" );
}
