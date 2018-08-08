#include "character.hpp"
#include "mud.hpp"

bool spec_janitor( Character *ch )
{
  Object *trash;
  Object *trash_next;

  if ( !IsAwake(ch) )
    return false;

  for ( trash = ch->InRoom->FirstContent; trash; trash = trash_next )
    {
      trash_next = trash->NextContent;
      if ( !IsBitSet( trash->WearFlags, ITEM_TAKE )
           ||    IS_OBJ_STAT( trash, ITEM_BURRIED ) )
        continue;
      if ( trash->ItemType == ITEM_DRINK_CON
           ||   trash->ItemType == ITEM_TRASH
           ||   trash->Cost < 10
           ||  (trash->Prototype->Vnum == OBJ_VNUM_SHOPPING_BAG
                &&  !trash->FirstContent) )
        {
          Act( AT_ACTION, "$n picks up some trash.", ch, NULL, NULL, TO_ROOM );
          ObjectFromRoom( trash );
          ObjectToCharacter( trash, ch );
          return true;
        }
    }

  return false;
}

