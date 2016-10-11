#include "character.h"
#include "mud.h"

bool spec_janitor( Character *ch )
{
  Object *trash;
  Object *trash_next;

  if ( !IsAwake(ch) )
    return false;

  for ( trash = ch->in_room->FirstContent; trash; trash = trash_next )
    {
      trash_next = trash->next_content;
      if ( !IsBitSet( trash->WearFlags, ITEM_TAKE )
           ||    IS_OBJ_STAT( trash, ITEM_BURRIED ) )
        continue;
      if ( trash->item_type == ITEM_DRINK_CON
           ||   trash->item_type == ITEM_TRASH
           ||   trash->cost < 10
           ||  (trash->Prototype->vnum == OBJ_VNUM_SHOPPING_BAG
                &&  !trash->first_content) )
        {
          Act( AT_ACTION, "$n picks up some trash.", ch, NULL, NULL, TO_ROOM );
          ObjectFromRoom( trash );
          ObjectToCharacter( trash, ch );
          return true;
        }
    }

  return false;
}
