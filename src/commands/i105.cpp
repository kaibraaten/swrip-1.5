#include "character.hpp"
#include "mud.hpp"

void do_i105( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_105, "i105" );
}
