#include "character.h"
#include "mud.h"

void do_immtalk( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_IMMTALK, "immtalk" );
}
