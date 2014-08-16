#include "character.h"
#include "mud.h"

bool spec_fido( Character *ch )
{
  OBJ_DATA *corpse;
  OBJ_DATA *c_next;
  OBJ_DATA *obj;
  OBJ_DATA *obj_next;

  if ( !IsAwake(ch) )
    return false;

  for ( corpse = ch->in_room->first_content; corpse; corpse = c_next )
    {
      c_next = corpse->next_content;
      if ( corpse->item_type != ITEM_CORPSE_NPC )
        continue;

      act( AT_ACTION, "$n savagely devours a corpse.", ch, NULL, NULL, TO_ROOM );
      for ( obj = corpse->first_content; obj; obj = obj_next )
        {
          obj_next = obj->next_content;
          obj_from_obj( obj );
          obj_to_room( obj, ch->in_room );
        }
      extract_obj( corpse );
      return true;
    }

  return false;
}
