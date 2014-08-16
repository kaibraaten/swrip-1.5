#include "mud.h"
#include "character.h"

void do_arm( Character *ch, char *argument )
{
  OBJ_DATA *obj;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      ch_printf( ch, "Mob's cant do that!\r\n" );
      return;
    }

  if ( ch->pcdata->learned[gsn_grenades] <= 0 )
    {
      ch_printf( ch, "You have no idea how to do that.\r\n" );
      return;
    }

  obj = GetEquipmentOnCharacter( ch, WEAR_HOLD );

  if ( !obj || obj->item_type != ITEM_GRENADE )
    {
      ch_printf( ch, "You don't seem to be holding a grenade!\r\n" );
      return;
    }

  obj->timer = 1;
  STRFREE ( obj->armed_by );
  obj->armed_by = STRALLOC ( ch->name );

  ch_printf( ch, "You arm %s.\r\n", obj->short_descr );
  act( AT_PLAIN, "$n arms $p.", ch, obj, NULL, TO_ROOM );

  learn_from_success( ch , gsn_grenades );
}
