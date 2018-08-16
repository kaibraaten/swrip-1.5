#include "character.hpp"
#include "mud.hpp"

void do_yell( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  TalkChannel( ch, DrunkSpeech( argument, ch ), CHANNEL_YELL, "yell" );
}
