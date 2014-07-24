#include "character.h"
#include "mud.h"

ch_ret spell_create_food( int sn, int level, Character *ch, void *vo )
{
  OBJ_DATA *mushroom;

  mushroom = create_object( get_obj_index( OBJ_VNUM_MUSHROOM ), 0 );
  mushroom->value[0] = 5 + level;
  act( AT_MAGIC, "$p suddenly appears.", ch, mushroom, NULL, TO_ROOM );
  act( AT_MAGIC, "$p suddenly appears.", ch, mushroom, NULL, TO_CHAR );
  mushroom = obj_to_room( mushroom, ch->in_room );
  return rNONE;
}
