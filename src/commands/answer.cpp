#include "character.hpp"
#include "mud.hpp"

void do_answer( Character *ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_ASK, "answer" );
}
