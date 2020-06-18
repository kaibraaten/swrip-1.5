#include "character.hpp"
#include "mud.hpp"

void do_clantalk( std::shared_ptr<Character> ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( !IsClanned( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  TalkChannel( ch, argument, CHANNEL_CLAN, "clantalk" );
}

