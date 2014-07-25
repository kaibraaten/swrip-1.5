#include "mud.h"

void do_repairset( Character *ch, char *argument )
{
  REPAIR_DATA *repair;
  ProtoMobile *mob, *mob2;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  short vnum;
  int value;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Usage: repairset <mob vnum> <field> value\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "  fix0 fix1 fix2 profit type open close keeper\r\n", ch );
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

  if ( !mob->rShop )
    {
      send_to_char( "This mobile doesn't keep a repair shop.\r\n", ch );
      return;
    }
  repair = mob->rShop;
  value = atoi( argument );

  if ( !str_cmp( arg2, "fix0" ) )
    {
      if ( !is_number(argument) )
        value = get_objecttype(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          send_to_char( "Invalid item type!\r\n", ch );
          return;
        }
      repair->fix_type[0] = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "fix1" ) )
    {
      if ( !is_number(argument) )
        value = get_objecttype(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          send_to_char( "Invalid item type!\r\n", ch );
          return;
        }
      repair->fix_type[1] = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "fix2" ) )
    {
      if ( !is_number(argument) )
        value = get_objecttype(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          send_to_char( "Invalid item type!\r\n", ch );
          return;
        }
      repair->fix_type[2] = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "profit" ) )
    {
      if ( value < 1 || value > 1000 )
        {
	  send_to_char( "Out of range.\r\n", ch );
          return;
        }
      repair->profit_fix = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "type" ) )
    {
      if ( value < 1 || value > 2 )
        {
          send_to_char( "Out of range.\r\n", ch );
          return;
        }
      repair->shop_type = value;
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
      repair->business_hours.open = value;
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
      repair->business_hours.close = value;
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
      if ( mob2->rShop )
        {
          send_to_char( "That mobile already has a repair shop.\r\n", ch );
          return;
        }
      mob->rShop  = NULL;
      mob2->rShop = repair;
      repair->keeper = value;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  do_repairset( ch, "" );
}
