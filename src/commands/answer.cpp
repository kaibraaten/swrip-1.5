#include "character.hpp"
#include "mud.hpp"

void do_answer( std::shared_ptr<Character> ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n" );
      return;
    }

  TalkChannel( ch, argument, CHANNEL_ASK, "answer" );
}

