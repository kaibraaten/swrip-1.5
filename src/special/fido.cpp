#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

bool spec_fido( Character *ch )
{
  Object *corpse = nullptr;
  Object *c_next = nullptr;
  Object *obj = nullptr;
  Object *obj_next = nullptr;

  if ( !IsAwake(ch) )
    return false;

  for ( corpse = ch->InRoom->FirstContent; corpse; corpse = c_next )
    {
      c_next = corpse->NextContent;
      if ( corpse->ItemType != ITEM_CORPSE_NPC )
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

