#include "character.hpp"
#include "mud.hpp"

void do_yell( Character *ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, DrunkSpeech( argument, ch ), CHANNEL_YELL, "yell" );
}
