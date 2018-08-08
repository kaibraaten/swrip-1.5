#include "character.hpp"
#include "mud.hpp"

void do_music( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  TalkChannel( ch, argument, CHANNEL_MUSIC, "sing" );
}

