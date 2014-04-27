#include "character.h"
#include "mud.h"

void do_i105( CHAR_DATA *ch, char *argument )
{
  if (is_not_authed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, argument, CHANNEL_105, "i105" );
}
