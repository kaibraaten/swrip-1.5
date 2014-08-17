#include "character.h"
#include "mud.h"

void do_afk( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if(IsBitSet(ch->act, PLR_AFK))
    {
      RemoveBit(ch->act, PLR_AFK);
      send_to_char( "You are no longer afk.\r\n", ch );
      act(AT_GREY,"$n is no longer afk.", ch, NULL, NULL, TO_ROOM);
    }
  else
    {
      SetBit(ch->act, PLR_AFK);
      send_to_char( "You are now afk.\r\n", ch );
      act(AT_GREY,"$n is now afk.", ch, NULL, NULL, TO_ROOM);
      return;
    }
}
