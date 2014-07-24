#include "character.h"
#include "mud.h"

void do_music( Character *ch, char *argument )
{
  if (is_not_authed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, argument, CHANNEL_MUSIC, "sing" );
}
