#include "mud.hpp"

ch_ret spell_detect_poison( int sn, int level, Character *ch, void *vo )
{
  Object *obj = (Object *) vo;

  SetCharacterColor( AT_MAGIC, ch);
  if ( obj->ItemType == ITEM_DRINK_CON || obj->ItemType == ITEM_FOOD )
    {
      if ( obj->Value[3] != 0 )
        SendToCharacter( "You smell poisonous fumes.\r\n", ch );
      else
        SendToCharacter( "It looks very delicious.\r\n", ch );
    }
  else
    {
      SendToCharacter( "It doesn't look poisoned.\r\n", ch );
    }

  return rNONE;
}
