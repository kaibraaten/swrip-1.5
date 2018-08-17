#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "protomob.hpp"

void do_repairset( Character *ch, char *argument )
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
      ch->Echo("Usage: repairset <mob vnum> <field> value\r\n");
      ch->Echo("\r\nField being one of:\r\n");
      ch->Echo("  fix0 fix1 fix2 profit type open close keeper\r\n");
      return;
    }

  vnum = atoi( arg1 );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      ch->Echo("Mobile not found.\r\n");
      return;
    }

  if ( !CanMedit(ch, mob) )
    return;

  if ( !mob->RepairShop )
    {
      ch->Echo("This mobile doesn't keep a repair shop.\r\n");
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
          ch->Echo("Invalid item type!\r\n");
          return;
        }

      repair->FixType[0] = (ItemTypes)value;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "fix1" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);

      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          ch->Echo("Invalid item type!\r\n");
          return;
        }

      repair->FixType[1] = (ItemTypes)value;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "fix2" ) )
    {
      if ( !IsNumber(argument) )
        value = GetObjectType(argument);

      if ( value < 0 || value > MAX_ITEM_TYPE )
        {
          ch->Echo("Invalid item type!\r\n");
          return;
        }

      repair->FixType[2] = (ItemTypes)value;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "profit" ) )
    {
      if ( value < 1 || value > 1000 )
        {
   ch->Echo("Out of range.\r\n");
          return;
        }

      repair->ProfitFix = value;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "type" ) )
    {
      if ( value < 1 || value > 2 )
        {
          ch->Echo("Out of range.\r\n");
          return;
        }

      repair->ShopType = value;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "open" ) )
    {
      if ( value < 0 || value > 23 )
        {
          ch->Echo("Out of range.\r\n");
          return;
        }

      repair->BusinessHours.Open = value;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "close" ) )
    {
      if ( value < 0 || value > 23 )
        {
          ch->Echo("Out of range.\r\n");
          return;
        }

      repair->BusinessHours.Close = value;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "keeper" ) )
    {
      if ( (mob2 = GetProtoMobile(vnum)) == NULL )
        {
          ch->Echo("Mobile not found.\r\n");
          return;
        }

      if ( !CanMedit(ch, mob) )
        return;

      if ( mob2->RepairShop )
        {
          ch->Echo("That mobile already has a repair shop.\r\n");
          return;
        }

      mob->RepairShop  = NULL;
      mob2->RepairShop = repair;
      repair->Keeper = value;
      ch->Echo("Done.\r\n");
      return;
    }

  do_repairset( ch, "" );
}

