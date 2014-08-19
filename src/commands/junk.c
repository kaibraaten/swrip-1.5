#include "character.h"
#include "mud.h"

void do_junk( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;

  OneArgument( argument, arg );

  if( !ch || !ch->in_room )
    return;

  if ( arg[0] == '\0' || !StrCmp( arg, ch->name ) )
    {
      SendToCharacter( "Junk what?", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  obj = GetObjectInListReverse( ch, arg, ch->in_room->last_content );

  if ( !obj )
    {
      SendToCharacter( "You can't find it.\r\n", ch );
      return;
    }

  separate_obj(obj);

  if ( !CAN_WEAR(obj, ITEM_TAKE) )
    {
      Act( AT_PLAIN, "$p is not an acceptable item.", ch, obj, 0, TO_CHAR );
      return;
    }

  if ( obj->item_type != ITEM_CONTAINER
       && obj->item_type != ITEM_ARMOR
       && obj->item_type != ITEM_TRASH
       && obj->item_type != ITEM_KEY
       && obj->item_type != ITEM_DRINK_CON
       && obj->item_type != ITEM_MEDPAC )
    {
      Act( AT_PLAIN, "$p is not an acceptable item.", ch, obj, 0, TO_CHAR );
      return;
    }

  oprog_sac_trigger( ch, obj );

  if ( IsObjectExtracted(obj) )
    return;

  if ( cur_obj == obj->serial )
    global_objcode = rOBJ_SACCED;

  ExtractObject( obj );
}
