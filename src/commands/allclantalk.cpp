#include "character.hpp"
#include "mud.h"

void do_allclantalk( Character *ch, char *argument )
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

  TalkChannel( ch, argument, CHANNEL_ALLCLAN, "allclantalk" );
}
