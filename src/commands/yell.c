#include "character.h"
#include "mud.h"

void do_yell( CHAR_DATA *ch, char *argument )
{
  if (NOT_AUTHED(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, drunk_speech( argument, ch ), CHANNEL_YELL, "yell" );
}
