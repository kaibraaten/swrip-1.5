#include "character.hpp"
#include "mud.hpp"

void do_allclantalk( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "Huh?\r\n" );
      return;
    }

  TalkChannel( ch, argument, CHANNEL_ALLCLAN, "allclantalk" );
}

