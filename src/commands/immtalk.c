#include "character.h"
#include "mud.h"

void do_immtalk( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  TalkToChannel( ch, argument, CHANNEL_IMMTALK, "immtalk" );
}
