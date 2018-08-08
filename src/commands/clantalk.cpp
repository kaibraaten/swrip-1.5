#include "character.hpp"
#include "mud.hpp"

void do_clantalk( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n", ch);
      return;
    }

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "Huh?\r\n", ch );
      return;
    }

  TalkChannel( ch, argument, CHANNEL_CLAN, "clantalk" );
}

