#include "mud.h"
#include "character.h"

void do_arm( Character *ch, char *argument )
{
  Object *obj;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      Echo( ch, "Mob's cant do that!\r\n" );
      return;
    }

  if ( ch->pcdata->learned[gsn_grenades] <= 0 )
    {
      Echo( ch, "You have no idea how to do that.\r\n" );
      return;
    }

  obj = GetEquipmentOnCharacter( ch, WEAR_HOLD );

  if ( !obj || obj->item_type != ITEM_GRENADE )
    {
      Echo( ch, "You don't seem to be holding a grenade!\r\n" );
      return;
    }

  obj->timer = 1;
  FreeMemory( obj->armed_by );
  obj->armed_by = CopyString ( ch->name );

  Echo( ch, "You arm %s.\r\n", obj->short_descr );
  Act( AT_PLAIN, "$n arms $p.", ch, obj, NULL, TO_ROOM );

  LearnFromSuccess( ch , gsn_grenades );
}
