#include "mud.h"
#include "character.h"

void do_ammo( Character *ch, char *argument )
{
  Object *wield;
  Object *obj;
  bool checkammo = false;
  int charge =0;

  obj = NULL;
  wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );
  if (wield)
    {
      obj = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD );
      if (!obj)
        obj = GetEquipmentOnCharacter( ch, WEAR_HOLD );
    }
  else
    {
      wield = GetEquipmentOnCharacter( ch, WEAR_HOLD );
      obj = NULL;
    }

  if (!wield || wield->item_type != ITEM_WEAPON )
    {
      SendToCharacter( "&RYou don't seem to be holding a weapon.\r\n&w", ch);
      return;
    }

  if ( wield->value[3] == WEAPON_BLASTER )
    {

      if ( obj && obj->item_type != ITEM_AMMO )
        {
          SendToCharacter( "&RYour hands are too full to reload your blaster.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          if ( obj->value[0] > wield->value[5] )
            {
              SendToCharacter( "That cartridge is too big for your blaster.", ch);
              return;
            }
          UnequipCharacter( ch, obj );
          checkammo = true;
          charge = obj->value[0];
          separate_obj( obj );
          extract_obj( obj );
        }
      else
        {
          for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
            {
              if ( obj->item_type == ITEM_AMMO)
                {
                  if ( obj->value[0] > wield->value[5] )
                    {
                      SendToCharacter( "That cartridge is too big for your blaster.", ch);
                      continue;
                    }
                  checkammo = true;
                  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          SendToCharacter( "&RYou don't seem to have any ammo to reload your blaster with.\r\n&w", ch);
          return;
        }

      ChPrintf( ch, "You replace your ammunition cartridge.\r\nYour blaster is charged with %d shots at high power to %d shots on low.\r\n", charge / 5, charge );
      act( AT_PLAIN, "$n replaces the ammunition cell in $p.", ch, wield, NULL, TO_ROOM );

    }
  else  if ( wield->value[3] == WEAPON_BOWCASTER )
    {

      if ( obj && obj->item_type != ITEM_BOLT )
        {
          SendToCharacter( "&RYour hands are too full to reload your bowcaster.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          if ( obj->value[0] > wield->value[5] )
            {
              SendToCharacter( "That cartridge is too big for your bowcaster.", ch);
              return;
            }
          UnequipCharacter( ch, obj );
          checkammo = true;
          charge = obj->value[0];
          separate_obj( obj );
          extract_obj( obj );
        }
      else
        {
          for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
            {
              if ( obj->item_type == ITEM_BOLT)
                {
                  if ( obj->value[0] > wield->value[5] )
                    {
                      SendToCharacter( "That cartridge is too big for your bowcaster.", ch);
                      continue;
                    }
                  checkammo = true;
		  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          SendToCharacter( "&RYou don't seem to have any quarrels to reload your bowcaster with.\r\n&w", ch);
          return;
        }

      ChPrintf( ch, "You replace your quarrel pack.\r\nYour bowcaster is charged with %d energy bolts.\r\n", charge );
      act( AT_PLAIN, "$n replaces the quarrels in $p.", ch, wield, NULL, TO_ROOM );

    }
  else
    {

      if ( obj && obj->item_type != ITEM_BATTERY )
        {
          SendToCharacter( "&RYour hands are too full to replace the power cell.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          UnequipCharacter( ch, obj );
          checkammo = true;
          charge = obj->value[0];
          separate_obj( obj );
          extract_obj( obj );
        }
      else
        {
          for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
            {
              if ( obj->item_type == ITEM_BATTERY)
                {
                  checkammo = true;
                  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
		  break;
                }
            }
        }

      if (!checkammo)
        {
          SendToCharacter( "&RYou don't seem to have a power cell.\r\n&w", ch);
          return;
        }

      if (wield->value[3] == WEAPON_LIGHTSABER )
        {
          ChPrintf( ch, "You replace your power cell.\r\nYour lightsaber is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
          act( AT_PLAIN, "$p ignites with a bright glow.", ch, wield, NULL, TO_ROOM );
        }
      else if (wield->value[3] == WEAPON_VIBRO_BLADE )
        {
          ChPrintf( ch, "You replace your power cell.\r\nYour vibro-blade is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
        }
      else if (wield->value[3] == WEAPON_FORCE_PIKE )
        {
          ChPrintf( ch, "You replace your power cell.\r\nYour force-pike is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
        }
      else
        {
          ChPrintf( ch, "You feel very foolish.\r\n" );
          act( AT_PLAIN, "$n tries to jam a power cell into $p.", ch, wield, NULL, TO_ROOM );
        }
    }

  wield->value[4] = charge;
}
