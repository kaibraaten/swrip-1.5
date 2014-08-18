#include "character.h"
#include "mud.h"

void do_i103( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_103, "i103" );
}
