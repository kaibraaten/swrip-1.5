#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"

ch_ret spell_detect_poison( int sn, int level, Character *ch, void *vo )
{
  Object *obj = (Object *) vo;

  SetCharacterColor( AT_MAGIC, ch);
  if ( obj->ItemType == ITEM_DRINK_CON || obj->ItemType == ITEM_FOOD )
    {
      if ( obj->Value[3] != 0 )
        ch->Echo("You smell poisonous fumes.\r\n");
      else
        ch->Echo("It looks very delicious.\r\n");
    }
  else
    {
      ch->Echo("It doesn't look poisoned.\r\n");
    }

  return rNONE;
}

