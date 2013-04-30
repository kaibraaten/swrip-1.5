#include "mud.h"

void do_newbiechat( CHAR_DATA *ch, char *argument )
{
  if ( ch->top_level > 5 )
    {
      send_to_char( "Aren't you a little old for the newbie channel?\r\n", ch );
      return;
    }

  talk_channel( ch, argument, CHANNEL_NEWBIE, "newbiechat" );
}
