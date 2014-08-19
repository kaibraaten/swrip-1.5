#include "character.h"
#include "mud.h"

void do_holylight( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsBitSet(ch->act, PLR_HOLYLIGHT) )
    {
      RemoveBit(ch->act, PLR_HOLYLIGHT);
      SendToCharacter( "Holy light mode off.\r\n", ch );
    }
  else
    {
      SetBit(ch->act, PLR_HOLYLIGHT);
      SendToCharacter( "Holy light mode on.\r\n", ch );
    }
}
