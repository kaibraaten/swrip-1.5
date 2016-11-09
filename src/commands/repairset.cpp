#include "mud.hpp"
#include "shop.hpp"

void do_repairset( Character *ch, std::string argument )
{
  RepairShop *repair;
  ProtoMobile *mob, *mob2;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  vnum_t vnum;
  int value;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
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

  if ( !CanMedit(ch, mob) )
    return;

  if ( !mob->RepairShop )
    {
      SendToCharacter( "This mobile doesn't keep a repair shop.\r\n", ch );
      return;
    }

  repair = mob->RepairShop;
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

      repair->FixType[0] = (ItemTypes)value;
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

      repair->FixType[1] = (ItemTypes)value;
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

      repair->FixType[2] = (ItemTypes)value;
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

      repair->ProfitFix = value;
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

      repair->ShopType = value;
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

      repair->BusinessHours.Open = value;
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

      repair->BusinessHours.Close = value;
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

      if ( mob2->RepairShop )
        {
          SendToCharacter( "That mobile already has a repair shop.\r\n", ch );
          return;
        }

      mob->RepairShop  = NULL;
      mob2->RepairShop = repair;
      repair->Keeper = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  do_repairset( ch, "" );
}
