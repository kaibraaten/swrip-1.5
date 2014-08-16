#include "character.h"
#include "mud.h"

void do_shout( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, drunk_speech( argument, ch ), CHANNEL_SHOUT, "shout" );
  SetWaitState( ch, 12 );
}
