#include "character.h"
#include "mud.h"

void do_yell( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, DrunkSpeech( argument, ch ), CHANNEL_YELL, "yell" );
}
