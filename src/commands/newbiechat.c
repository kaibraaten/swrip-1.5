#include "character.h"
#include "mud.h"

void do_newbiechat( Character *ch, char *argument )
{
  if ( ch->TopLevel > 5 )
    {
      SendToCharacter( "Aren't you a little old for the newbie channel?\r\n", ch );
      return;
    }

  TalkChannel( ch, argument, CHANNEL_NEWBIE, "newbiechat" );
}
