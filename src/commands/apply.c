#include "mud.h"
#include "character.h"

/*
 * Apply a salve/ointment                                       -Thoric
 */
void do_apply( Character *ch, char *argument )
{
  Object *obj;
  ch_ret retcode;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Apply what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( obj = GetCarriedObject( ch, argument ) ) == NULL )
    {
      send_to_char( "You do not have that.\r\n", ch );
      return;
    }

  if ( obj->item_type != ITEM_SALVE )
    {
      act( AT_ACTION, "$n starts to rub $p on $mself...",  ch, obj, NULL, TO_ROOM );
      act( AT_ACTION, "You try to rub $p on yourself...", ch, obj, NULL, TO_CHAR );
      return;
    }

  separate_obj( obj );

  --obj->value[1];
  if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
    {
      if ( !obj->action_desc || obj->action_desc[0]=='\0' )
        {
          act( AT_ACTION, "$n rubs $p onto $s body.",  ch, obj, NULL, TO_ROOM );
          if ( obj->value[1] <= 0 )
            act( AT_ACTION, "You apply the last of $p onto your body.", ch, obj, NULL, TO_CHAR );
          else
            act( AT_ACTION, "You apply $p onto your body.", ch, obj, NULL, TO_CHAR );
        }
      else
        actiondesc( ch, obj, NULL );
    }

  SetWaitState( ch, obj->value[2] );
  retcode = obj_cast_spell( obj->value[4], obj->value[0], ch, ch, NULL );

  if ( retcode == rNONE )
    retcode = obj_cast_spell( obj->value[5], obj->value[0], ch, ch, NULL );

  if ( !obj_extracted(obj) && obj->value[1] <= 0 )
    extract_obj( obj );
}
