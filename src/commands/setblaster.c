#include "character.h"
#include "mud.h"

void do_setblaster( Character *ch, char *argument )
{
  Object *wield;
  Object *wield2;

  wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );

  if( wield && !( wield->item_type == ITEM_WEAPON && wield->value[3] == WEAPON_BLASTER ) )
    wield = NULL;

  wield2 = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD );

  if( wield2 && !( wield2->item_type == ITEM_WEAPON && wield2->value[3] == WEAPON_BLASTER ) )
    wield2 = NULL;

  if ( !wield && !wield2 )
    {
      SendToCharacter( "&RYou don't seem to be wielding a blaster.\r\n&w", ch);
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "&RUsage: setblaster <full|high|normal|half|low|stun>\r\n&w", ch);
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
          wield->blaster_setting = BLASTER_FULL;
          SendToCharacter( "&YWielded blaster set to FULL Power\r\n&w", ch);
        }

      if (wield2)
        {
          wield2->blaster_setting = BLASTER_FULL;
          SendToCharacter( "&YDual wielded blaster set to FULL Power\r\n&w", ch);
        }

      return;
    }

  if ( !StrCmp( argument, "high" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_HIGH;
          SendToCharacter( "&YWielded blaster set to HIGH Power\r\n&w", ch);
        }

      if (wield2)
        {
          wield2->blaster_setting = BLASTER_HIGH;
          SendToCharacter( "&YDual wielded blaster set to HIGH Power\r\n&w", ch);
        }

      return;
    }

  if ( !StrCmp( argument, "normal" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_NORMAL;
          SendToCharacter( "&YWielded blaster set to NORMAL Power\r\n&w", ch);
        }
      if (wield2)
        {
          wield2->blaster_setting = BLASTER_NORMAL;
          SendToCharacter( "&YDual wielded blaster set to NORMAL Power\r\n&w", ch);
	}

      return;
    }

  if ( !StrCmp( argument, "half" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_HALF;
          SendToCharacter( "&YWielded blaster set to HALF Power\r\n&w", ch);
        }

      if (wield2)
        {
          wield2->blaster_setting = BLASTER_HALF;
          SendToCharacter( "&YDual wielded blaster set to HALF Power\r\n&w", ch);
        }

      return;
    }

  if ( !StrCmp( argument, "low" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_LOW;
          SendToCharacter( "&YWielded blaster set to LOW Power\r\n&w", ch);
        }

      if (wield2)
        {
          wield2->blaster_setting = BLASTER_LOW;
          SendToCharacter( "&YDual wielded blaster set to LOW Power\r\n&w", ch);
        }

      return;
    }

  if ( !StrCmp( argument, "stun" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_STUN;
          SendToCharacter( "&YWielded blaster set to STUN\r\n&w", ch);
        }
      if (wield2)
        {
          wield2->blaster_setting = BLASTER_STUN;
          SendToCharacter( "&YDual wielded blaster set to STUN\r\n&w", ch);
        }

      return;
    }
  else
    {
      do_setblaster( ch , "" );
    }
}
