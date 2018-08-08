#include "character.hpp"
#include "mud.hpp"

void do_setblaster( Character *ch, char *argument )
{
  Object *wield;
  Object *wield2;

  wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );

  if( wield && !( wield->ItemType == ITEM_WEAPON && wield->Value[3] == WEAPON_BLASTER ) )
    wield = NULL;

  wield2 = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD );

  if( wield2 && !( wield2->ItemType == ITEM_WEAPON && wield2->Value[3] == WEAPON_BLASTER ) )
    wield2 = NULL;

  if ( !wield && !wield2 )
    {
      ch->Echo("&RYou don't seem to be wielding a blaster.\r\n&w");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("&RUsage: setblaster <full|high|normal|half|low|stun>\r\n&w");
      return;
    }

  if ( wield )
    Act( AT_PLAIN, "$n adjusts the settings on $p.", ch, wield, NULL, TO_ROOM );

  if ( wield2 )
    Act( AT_PLAIN, "$n adjusts the settings on $p.", ch, wield2, NULL, TO_ROOM );

  if ( !StrCmp( argument, "full" ) )
    {
      if (wield)
        {
          wield->BlasterSetting = BLASTER_FULL;
          ch->Echo("&YWielded blaster set to FULL Power\r\n&w");
        }

      if (wield2)
        {
          wield2->BlasterSetting = BLASTER_FULL;
          ch->Echo("&YDual wielded blaster set to FULL Power\r\n&w");
        }

      return;
    }

  if ( !StrCmp( argument, "high" ) )
    {
      if (wield)
        {
          wield->BlasterSetting = BLASTER_HIGH;
          ch->Echo("&YWielded blaster set to HIGH Power\r\n&w");
        }

      if (wield2)
        {
          wield2->BlasterSetting = BLASTER_HIGH;
          ch->Echo("&YDual wielded blaster set to HIGH Power\r\n&w");
        }

      return;
    }

  if ( !StrCmp( argument, "normal" ) )
    {
      if (wield)
        {
          wield->BlasterSetting = BLASTER_NORMAL;
          ch->Echo("&YWielded blaster set to NORMAL Power\r\n&w");
        }
      if (wield2)
        {
          wield2->BlasterSetting = BLASTER_NORMAL;
          ch->Echo("&YDual wielded blaster set to NORMAL Power\r\n&w");
	}

      return;
    }

  if ( !StrCmp( argument, "half" ) )
    {
      if (wield)
        {
          wield->BlasterSetting = BLASTER_HALF;
          ch->Echo("&YWielded blaster set to HALF Power\r\n&w");
        }

      if (wield2)
        {
          wield2->BlasterSetting = BLASTER_HALF;
          ch->Echo("&YDual wielded blaster set to HALF Power\r\n&w");
        }

      return;
    }

  if ( !StrCmp( argument, "low" ) )
    {
      if (wield)
        {
          wield->BlasterSetting = BLASTER_LOW;
          ch->Echo("&YWielded blaster set to LOW Power\r\n&w");
        }

      if (wield2)
        {
          wield2->BlasterSetting = BLASTER_LOW;
          ch->Echo("&YDual wielded blaster set to LOW Power\r\n&w");
        }

      return;
    }

  if ( !StrCmp( argument, "stun" ) )
    {
      if (wield)
        {
          wield->BlasterSetting = BLASTER_STUN;
          ch->Echo("&YWielded blaster set to STUN\r\n&w");
        }
      if (wield2)
        {
          wield2->BlasterSetting = BLASTER_STUN;
          ch->Echo("&YDual wielded blaster set to STUN\r\n&w");
        }

      return;
    }
  else
    {
      do_setblaster( ch , "" );
    }
}

