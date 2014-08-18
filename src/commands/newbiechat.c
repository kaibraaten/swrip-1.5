#include "character.h"
#include "mud.h"

void do_newbiechat( Character *ch, char *argument )
{
  if ( ch->top_level > 5 )
    {
      send_to_char( "Aren't you a little old for the newbie channel?\r\n", ch );
      return;
    }

  TalkToChannel( ch, argument, CHANNEL_NEWBIE, "newbiechat" );
}
