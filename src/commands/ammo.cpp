#include "mud.hpp"
#include "character.hpp"

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

  if (!wield || wield->ItemType != ITEM_WEAPON )
    {
      SendToCharacter( "&RYou don't seem to be holding a weapon.\r\n&w", ch);
      return;
    }

  if ( wield->Value[3] == WEAPON_BLASTER )
    {

      if ( obj && obj->ItemType != ITEM_AMMO )
        {
          SendToCharacter( "&RYour hands are too full to reload your blaster.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          if ( obj->Value[0] > wield->Value[5] )
            {
              SendToCharacter( "That cartridge is too big for your blaster.", ch);
              return;
            }
          UnequipCharacter( ch, obj );
          checkammo = true;
          charge = obj->Value[0];
          SeparateOneObjectFromGroup( obj );
          ExtractObject( obj );
        }
      else
        {
          for ( obj = ch->LastCarrying; obj; obj = obj->PreviousContent )
            {
              if ( obj->ItemType == ITEM_AMMO)
                {
                  if ( obj->Value[0] > wield->Value[5] )
                    {
                      SendToCharacter( "That cartridge is too big for your blaster.", ch);
                      continue;
                    }
                  checkammo = true;
                  charge = obj->Value[0];
                  SeparateOneObjectFromGroup( obj );
                  ExtractObject( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          SendToCharacter( "&RYou don't seem to have any ammo to reload your blaster with.\r\n&w", ch);
          return;
        }

      Echo( ch, "You replace your ammunition cartridge.\r\nYour blaster is charged with %d shots at high power to %d shots on low.\r\n", charge / 5, charge );
      Act( AT_PLAIN, "$n replaces the ammunition cell in $p.", ch, wield, NULL, TO_ROOM );

    }
  else  if ( wield->Value[3] == WEAPON_BOWCASTER )
    {

      if ( obj && obj->ItemType != ITEM_BOLT )
        {
          SendToCharacter( "&RYour hands are too full to reload your bowcaster.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          if ( obj->Value[0] > wield->Value[5] )
            {
              SendToCharacter( "That cartridge is too big for your bowcaster.", ch);
              return;
            }
          UnequipCharacter( ch, obj );
          checkammo = true;
          charge = obj->Value[0];
          SeparateOneObjectFromGroup( obj );
          ExtractObject( obj );
        }
      else
        {
          for ( obj = ch->LastCarrying; obj; obj = obj->PreviousContent )
            {
              if ( obj->ItemType == ITEM_BOLT)
                {
                  if ( obj->Value[0] > wield->Value[5] )
                    {
                      SendToCharacter( "That cartridge is too big for your bowcaster.", ch);
                      continue;
                    }
                  checkammo = true;
		  charge = obj->Value[0];
                  SeparateOneObjectFromGroup( obj );
                  ExtractObject( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          SendToCharacter( "&RYou don't seem to have any quarrels to reload your bowcaster with.\r\n&w", ch);
          return;
        }

      Echo( ch, "You replace your quarrel pack.\r\nYour bowcaster is charged with %d energy bolts.\r\n", charge );
      Act( AT_PLAIN, "$n replaces the quarrels in $p.", ch, wield, NULL, TO_ROOM );

    }
  else
    {

      if ( obj && obj->ItemType != ITEM_BATTERY )
        {
          SendToCharacter( "&RYour hands are too full to replace the power cell.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          UnequipCharacter( ch, obj );
          checkammo = true;
          charge = obj->Value[0];
          SeparateOneObjectFromGroup( obj );
          ExtractObject( obj );
        }
      else
        {
          for ( obj = ch->LastCarrying; obj; obj = obj->PreviousContent )
            {
              if ( obj->ItemType == ITEM_BATTERY)
                {
                  checkammo = true;
                  charge = obj->Value[0];
                  SeparateOneObjectFromGroup( obj );
                  ExtractObject( obj );
		  break;
                }
            }
        }

      if (!checkammo)
        {
          SendToCharacter( "&RYou don't seem to have a power cell.\r\n&w", ch);
          return;
        }

      if (wield->Value[3] == WEAPON_LIGHTSABER )
        {
          Echo( ch, "You replace your power cell.\r\nYour lightsaber is charged to %d/%d units.\r\n", charge, charge );
          Act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
          Act( AT_PLAIN, "$p ignites with a bright glow.", ch, wield, NULL, TO_ROOM );
        }
      else if (wield->Value[3] == WEAPON_VIBRO_BLADE )
        {
          Echo( ch, "You replace your power cell.\r\nYour vibro-blade is charged to %d/%d units.\r\n", charge, charge );
          Act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
        }
      else if (wield->Value[3] == WEAPON_FORCE_PIKE )
        {
          Echo( ch, "You replace your power cell.\r\nYour force-pike is charged to %d/%d units.\r\n", charge, charge );
          Act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
        }
      else
        {
          Echo( ch, "You feel very foolish.\r\n" );
          Act( AT_PLAIN, "$n tries to jam a power cell into $p.", ch, wield, NULL, TO_ROOM );
        }
    }

  wield->Value[4] = charge;
}
