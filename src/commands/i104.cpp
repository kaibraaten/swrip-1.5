#include "character.hpp"
#include "mud.hpp"

void do_i104( Character *ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_104, "i104" );
}
