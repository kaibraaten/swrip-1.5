#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"

bool spec_fido( Character *ch )
{
  Object *obj = nullptr;
  Object *obj_next = nullptr;

  if ( !IsAwake(ch) )
    return false;

  std::list<Object*> corpsesToEat = Filter(ch->InRoom->Objects(),
                                           [](const auto corpse)
                                           {
                                             return corpse->ItemType == ITEM_CORPSE_NPC;
                                           });

  for(Object *corpse : corpsesToEat)
    {
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

