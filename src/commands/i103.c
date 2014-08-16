#include "character.h"
#include "mud.h"

void do_i103( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, argument, CHANNEL_103, "i103" );
}
