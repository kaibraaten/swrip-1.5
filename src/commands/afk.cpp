#include "character.hpp"
#include "mud.hpp"

void do_afk( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if(IsBitSet(ch->Flags, PLR_AFK))
    {
      RemoveBit(ch->Flags, PLR_AFK);
      ch->Echo( "You are no longer afk.\r\n" );
      Act(AT_GREY,"$n is no longer afk.", ch, NULL, NULL, TO_ROOM);
    }
  else
    {
      SetBit(ch->Flags, PLR_AFK);
      ch->Echo( "You are now afk.\r\n" );
      Act(AT_GREY,"$n is now afk.", ch, NULL, NULL, TO_ROOM);
      return;
    }
}

