#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

void do_arm( Character *ch, char *argument )
{
  Object *obj;

  if ( IsNpc(ch) || !ch->PCData )
    {
      Echo( ch, "Mob's cant do that!\r\n" );
      return;
    }

  if ( ch->PCData->Learned[gsn_grenades] <= 0 )
    {
      Echo( ch, "You have no idea how to do that.\r\n" );
      return;
    }

  obj = GetEquipmentOnCharacter( ch, WEAR_HOLD );

  if ( !obj || obj->ItemType != ITEM_GRENADE )
    {
      Echo( ch, "You don't seem to be holding a grenade!\r\n" );
      return;
    }

  obj->Timer = 1;
  FreeMemory( obj->ArmedBy );
  obj->ArmedBy = CopyString ( ch->Name );

  Echo( ch, "You arm %s.\r\n", obj->ShortDescr );
  Act( AT_PLAIN, "$n arms $p.", ch, obj, NULL, TO_ROOM );

  LearnFromSuccess( ch , gsn_grenades );
}
