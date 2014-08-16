#include "character.h"
#include "mud.h"

void do_i105( Character *ch, char *argument )
{
  if (IsNotAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, argument, CHANNEL_105, "i105" );
}
