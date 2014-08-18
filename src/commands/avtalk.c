#include "character.h"
#include "mud.h"

void do_avtalk( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  TalkToChannel( ch, DrunkSpeech( argument, ch ), CHANNEL_AVTALK, "avtalk" );
}
