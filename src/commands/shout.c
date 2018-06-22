#include "character.h"
#include "mud.h"

void do_shout( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, DrunkSpeech( argument, ch ), CHANNEL_SHOUT, "shout" );
  SetWaitState( ch, 12 );
}
