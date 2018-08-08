#include "character.hpp"
#include "mud.hpp"

void do_i103( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  TalkChannel( ch, argument, CHANNEL_103, "i103" );
}


