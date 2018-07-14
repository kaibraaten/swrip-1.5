#include "character.hpp"
#include "mud.hpp"

void do_afk( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if(IsBitSet(ch->Flags, PLR_AFK))
    {
      RemoveBit(ch->Flags, PLR_AFK);
      SendToCharacter( "You are no longer afk.\r\n", ch );
      Act(AT_GREY,"$n is no longer afk.", ch, NULL, NULL, TO_ROOM);
    }
  else
    {
      SetBit(ch->Flags, PLR_AFK);
      SendToCharacter( "You are now afk.\r\n", ch );
      Act(AT_GREY,"$n is now afk.", ch, NULL, NULL, TO_ROOM);
      return;
    }
}
