#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"

bool spec_fido( Character *ch )
{
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

      std::list<Object*> objectsInCorpse(corpse->Objects());

      for(Object *obj : objectsInCorpse)
        {
          ObjectFromObject( obj );
          ObjectToRoom( obj, ch->InRoom );
        }

      ExtractObject( corpse );
      return true;
    }

  return false;
}

