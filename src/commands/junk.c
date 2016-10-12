#include "character.h"
#include "mud.h"

void do_junk( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;

  OneArgument( argument, arg );

  if( !ch || !ch->InRoom )
    return;

  if ( IsNullOrEmpty( arg ) || !StrCmp( arg, ch->Name ) )
    {
      SendToCharacter( "Junk what?", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  obj = GetObjectInListReverse( ch, arg, ch->InRoom->LastContent );

  if ( !obj )
    {
      SendToCharacter( "You can't find it.\r\n", ch );
      return;
    }

  SeparateOneObjectFromGroup(obj);

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

  ObjProgSacTrigger( ch, obj );

  if ( IsObjectExtracted(obj) )
    return;

  if ( cur_obj == obj->serial )
    global_objcode = rOBJ_SACCED;

  ExtractObject( obj );
}
