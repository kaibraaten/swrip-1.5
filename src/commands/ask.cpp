#include "character.hpp"
#include "mud.hpp"

void do_ask( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  TalkChannel( ch, argument, CHANNEL_ASK, "ask" );
}

