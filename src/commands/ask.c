#include "character.h"
#include "mud.h"

void do_ask( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_ASK, "ask" );
}
