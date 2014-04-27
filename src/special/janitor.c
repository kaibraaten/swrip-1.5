#include "character.h"
#include "mud.h"

bool spec_janitor( CHAR_DATA *ch )
{
  OBJ_DATA *trash;
  OBJ_DATA *trash_next;

  if ( !is_awake(ch) )
    return FALSE;

  for ( trash = ch->in_room->first_content; trash; trash = trash_next )
    {
      trash_next = trash->next_content;
      if ( !IS_SET( trash->wear_flags, ITEM_TAKE )
           ||    IS_OBJ_STAT( trash, ITEM_BURRIED ) )
        continue;
      if ( trash->item_type == ITEM_DRINK_CON
           ||   trash->item_type == ITEM_TRASH
           ||   trash->cost < 10
           ||  (trash->pIndexData->vnum == OBJ_VNUM_SHOPPING_BAG
                &&  !trash->first_content) )
        {
          act( AT_ACTION, "$n picks up some trash.", ch, NULL, NULL, TO_ROOM );
          obj_from_room( trash );
          obj_to_char( trash, ch );
          return TRUE;
        }
    }

  return FALSE;
}
