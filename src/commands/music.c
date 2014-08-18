#include "character.h"
#include "mud.h"

void do_music( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  TalkToChannel( ch, argument, CHANNEL_MUSIC, "sing" );
}
