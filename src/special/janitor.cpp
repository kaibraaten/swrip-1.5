#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"

bool spec_janitor( Character *ch )
{
  if ( !IsAwake(ch) )
    return false;

  std::list<Object*> itemsToPickUp = Filter(ch->InRoom->Objects(),
                                            [](const auto obj)
                                            {
                                              return IsBitSet(obj->WearFlags, ITEM_TAKE)
                                                && !IS_OBJ_STAT(obj, ITEM_BURRIED)
                                                && (obj->ItemType == ITEM_DRINK_CON
                                                    || obj->ItemType == ITEM_TRASH
                                                    || obj->Cost < 10
                                                    || (obj->Prototype->Vnum == OBJ_VNUM_SHOPPING_BAG
                                                        && obj->FirstContent == nullptr));
                                            });

  for(Object *trash : itemsToPickUp)
    {
      Act( AT_ACTION, "$n picks up some trash.", ch, NULL, NULL, TO_ROOM );
      ObjectFromRoom( trash );
      ObjectToCharacter( trash, ch );
      return true;
    }

  return false;
}

