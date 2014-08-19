#include "character.h"
#include "mud.h"

void do_ask( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_ASK, "ask" );
}
