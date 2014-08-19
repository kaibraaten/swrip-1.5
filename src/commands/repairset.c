#include "mud.h"

void do_repairset( Character *ch, char *argument )
{
  REPAIR_DATA *repair;
  ProtoMobile *mob, *mob2;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  short vnum;
  int value;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      SendToCharacter( "Usage: repairset <mob vnum> <field> value\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( "  fix0 fix1 fix2 profit type open close keeper\r\n", ch );
      return;
    }

  vnum = atoi( arg1 );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      SendToCharacter( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !can_medit(ch, mob) )
    return;

  if ( !mob->rShop )
    {
      SendToCharacter( "This mobile doesn't keep a repair shop.\r\n", ch );
      return;
    }
  repair = mob->rShop;
  value = atoi( argument );

  if ( !StrCmp( arg2, "fix0" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          SendToCharacter( "Invalid item type!\r\n", ch );
          return;
        }
      repair->fix_type[0] = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "fix1" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          SendToCharacter( "Invalid item type!\r\n", ch );
          return;
        }
      repair->fix_type[1] = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "fix2" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);
      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          SendToCharacter( "Invalid item type!\r\n", ch );
          return;
        }
      repair->fix_type[2] = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "profit" ) )
    {
      if ( value < 1 || value > 1000 )
        {
	  SendToCharacter( "Out of range.\r\n", ch );
          return;
        }
      repair->profit_fix = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "type" ) )
    {
      if ( value < 1 || value > 2 )
        {
          SendToCharacter( "Out of range.\r\n", ch );
          return;
        }
      repair->shop_type = value;
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
      repair->business_hours.open = value;
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
      repair->business_hours.close = value;
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
      if ( !can_medit(ch, mob) )
        return;
      if ( mob2->rShop )
        {
          SendToCharacter( "That mobile already has a repair shop.\r\n", ch );
          return;
        }
      mob->rShop  = NULL;
      mob2->rShop = repair;
      repair->keeper = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  do_repairset( ch, "" );
}
