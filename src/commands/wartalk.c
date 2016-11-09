#include "character.hpp"
#include "mud.h"

void do_wartalk( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_WARTALK, "war" );
}
