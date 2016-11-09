#include "character.hpp"
#include "mud.hpp"

void do_clantalk( Character *ch, std::string argument )
{
  if (!IsAuthed(ch))
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  if ( !IsClanned( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  TalkChannel( ch, argument, CHANNEL_CLAN, "clantalk" );
}
