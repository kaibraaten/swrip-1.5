#include "character.hpp"
#include "mud.hpp"

void do_music( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_MUSIC, "sing" );
}
