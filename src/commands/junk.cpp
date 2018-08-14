#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"

void do_junk( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;

  OneArgument( argument, arg );

  if( !ch || !ch->InRoom )
    return;

  if ( IsNullOrEmpty( arg ) || !StrCmp( arg, ch->Name ) )
    {
      ch->Echo("Junk what?");
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  obj = GetObjectInListReverse( ch, arg, ch->InRoom->Objects() );

  if ( !obj )
    {
      ch->Echo("You can't find it.\r\n");
      return;
    }

  SeparateOneObjectFromGroup(obj);

  if ( !CAN_WEAR(obj, ITEM_TAKE) )
    {
      Act( AT_PLAIN, "$p is not an acceptable item.", ch, obj, 0, TO_CHAR );
      return;
    }

  if ( obj->ItemType != ITEM_CONTAINER
       && obj->ItemType != ITEM_ARMOR
       && obj->ItemType != ITEM_TRASH
       && obj->ItemType != ITEM_KEY
       && obj->ItemType != ITEM_DRINK_CON
       && obj->ItemType != ITEM_MEDPAC )
    {
      Act( AT_PLAIN, "$p is not an acceptable item.", ch, obj, 0, TO_CHAR );
      return;
    }

  ObjProgSacTrigger( ch, obj );

  if ( IsObjectExtracted(obj) )
    return;

  if ( cur_obj == obj->Serial )
    global_objcode = rOBJ_SACCED;

  ExtractObject( obj );
}


