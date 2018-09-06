#include "character.hpp"
#include "mud.hpp"

void do_shout( Character *ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  TalkChannel( ch, DrunkSpeech( argument, ch ), CHANNEL_SHOUT, "shout" );
  SetWaitState( ch, 12 );
}
