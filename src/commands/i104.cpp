#include "character.hpp"
#include "mud.hpp"

void do_i104( Character *ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  TalkChannel( ch, argument, CHANNEL_104, "i104" );
}
