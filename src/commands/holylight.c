#include "character.h"
#include "mud.h"

void do_holylight( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsBitSet(ch->act, PLR_HOLYLIGHT) )
    {
      RemoveBit(ch->act, PLR_HOLYLIGHT);
      send_to_char( "Holy light mode off.\r\n", ch );
    }
  else
    {
      SetBit(ch->act, PLR_HOLYLIGHT);
      send_to_char( "Holy light mode on.\r\n", ch );
    }
}
