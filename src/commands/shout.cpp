#include "character.hpp"
#include "mud.hpp"

void do_shout( Character *ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, DrunkSpeech( argument, ch ), CHANNEL_SHOUT, "shout" );
  SetWaitState( ch, 12 );
}
