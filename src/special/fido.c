#include "character.h"
#include "mud.h"

bool spec_fido( Character *ch )
{
  Object *corpse;
  Object *c_next;
  Object *obj;
  Object *obj_next;

  if ( !IsAwake(ch) )
    return false;

  for ( corpse = ch->InRoom->FirstContent; corpse; corpse = c_next )
    {
      c_next = corpse->NextContent;
      if ( corpse->item_type != ITEM_CORPSE_NPC )
        continue;

      Act( AT_ACTION, "$n savagely devours a corpse.", ch, NULL, NULL, TO_ROOM );
      for ( obj = corpse->FirstContent; obj; obj = obj_next )
        {
          obj_next = obj->NextContent;
          ObjectFromObject( obj );
          ObjectToRoom( obj, ch->InRoom );
        }
      ExtractObject( corpse );
      return true;
    }

  return false;
}
