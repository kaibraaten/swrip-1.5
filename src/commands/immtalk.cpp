#include "character.hpp"
#include "mud.hpp"

void do_immtalk( Character *ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_IMMTALK, "immtalk" );
}
