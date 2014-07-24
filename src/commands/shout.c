#include "character.h"
#include "mud.h"

void do_shout( Character *ch, char *argument )
{
  if (is_not_authed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, drunk_speech( argument, ch ), CHANNEL_SHOUT, "shout" );
  set_wait_state( ch, 12 );
}
