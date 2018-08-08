#include "character.hpp"
#include "mud.hpp"

void do_newbiechat( Character *ch, char *argument )
{
  if ( ch->TopLevel > 5 )
    {
      ch->Echo("Aren't you a little old for the newbie channel?\r\n");
      return;
    }

  TalkChannel( ch, argument, CHANNEL_NEWBIE, "newbiechat" );
}

