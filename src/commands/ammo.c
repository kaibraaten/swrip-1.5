#include "mud.h"
#include "character.h"

void do_ammo( Character *ch, char *argument )
{
  OBJ_DATA *wield;
  OBJ_DATA *obj;
  bool checkammo = FALSE;
  int charge =0;

  obj = NULL;
  wield = get_eq_char( ch, WEAR_WIELD );
  if (wield)
    {
      obj = get_eq_char( ch, WEAR_DUAL_WIELD );
      if (!obj)
        obj = get_eq_char( ch, WEAR_HOLD );
    }
  else
    {
      wield = get_eq_char( ch, WEAR_HOLD );
      obj = NULL;
    }

  if (!wield || wield->item_type != ITEM_WEAPON )
    {
      send_to_char( "&RYou don't seem to be holding a weapon.\r\n&w", ch);
      return;
    }

  if ( wield->value[3] == WEAPON_BLASTER )
    {

      if ( obj && obj->item_type != ITEM_AMMO )
        {
          send_to_char( "&RYour hands are too full to reload your blaster.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          if ( obj->value[0] > wield->value[5] )
            {
              send_to_char( "That cartridge is too big for your blaster.", ch);
              return;
            }
          unequip_char( ch, obj );
          checkammo = TRUE;
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
                      send_to_char( "That cartridge is too big for your blaster.", ch);
                      continue;
                    }
                  checkammo = TRUE;
                  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          send_to_char( "&RYou don't seem to have any ammo to reload your blaster with.\r\n&w", ch);
          return;
        }

      ch_printf( ch, "You replace your ammunition cartridge.\r\nYour blaster is charged with %d shots at high power to %d shots on low.\r\n", charge / 5, charge );
      act( AT_PLAIN, "$n replaces the ammunition cell in $p.", ch, wield, NULL, TO_ROOM );

    }
  else  if ( wield->value[3] == WEAPON_BOWCASTER )
    {

      if ( obj && obj->item_type != ITEM_BOLT )
        {
          send_to_char( "&RYour hands are too full to reload your bowcaster.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          if ( obj->value[0] > wield->value[5] )
            {
              send_to_char( "That cartridge is too big for your bowcaster.", ch);
              return;
            }
          unequip_char( ch, obj );
          checkammo = TRUE;
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
                      send_to_char( "That cartridge is too big for your bowcaster.", ch);
                      continue;
                    }
                  checkammo = TRUE;
		  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          send_to_char( "&RYou don't seem to have any quarrels to reload your bowcaster with.\r\n&w", ch);
          return;
        }

      ch_printf( ch, "You replace your quarrel pack.\r\nYour bowcaster is charged with %d energy bolts.\r\n", charge );
      act( AT_PLAIN, "$n replaces the quarrels in $p.", ch, wield, NULL, TO_ROOM );

    }
  else
    {

      if ( obj && obj->item_type != ITEM_BATTERY )
        {
          send_to_char( "&RYour hands are too full to replace the power cell.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          unequip_char( ch, obj );
          checkammo = TRUE;
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
                  checkammo = TRUE;
                  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
		  break;
                }
            }
        }

      if (!checkammo)
        {
          send_to_char( "&RYou don't seem to have a power cell.\r\n&w", ch);
          return;
        }

      if (wield->value[3] == WEAPON_LIGHTSABER )
        {
          ch_printf( ch, "You replace your power cell.\r\nYour lightsaber is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
          act( AT_PLAIN, "$p ignites with a bright glow.", ch, wield, NULL, TO_ROOM );
        }
      else if (wield->value[3] == WEAPON_VIBRO_BLADE )
        {
          ch_printf( ch, "You replace your power cell.\r\nYour vibro-blade is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
        }
      else if (wield->value[3] == WEAPON_FORCE_PIKE )
        {
          ch_printf( ch, "You replace your power cell.\r\nYour force-pike is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
        }
      else
        {
          ch_printf( ch, "You feel very foolish.\r\n" );
          act( AT_PLAIN, "$n tries to jam a power cell into $p.", ch, wield, NULL, TO_ROOM );
        }
    }

  wield->value[4] = charge;
}
