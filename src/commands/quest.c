#include "character.h"
#include "mud.h"

void do_quest( CHAR_DATA *ch, char *argument )
{
  if (NOT_AUTHED(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, argument, CHANNEL_QUEST, "quest" );
}
