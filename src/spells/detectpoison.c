#include "mud.h"

ch_ret spell_detect_poison( int sn, int level, Character *ch, void *vo )
{
  Object *obj = (Object *) vo;

  set_char_color( AT_MAGIC, ch);
  if ( obj->item_type == ITEM_DRINK_CON || obj->item_type == ITEM_FOOD )
    {
      if ( obj->value[3] != 0 )
        send_to_char( "You smell poisonous fumes.\r\n", ch );
      else
        send_to_char( "It looks very delicious.\r\n", ch );
    }
  else
    {
      send_to_char( "It doesn't look poisoned.\r\n", ch );
    }

  return rNONE;
}
