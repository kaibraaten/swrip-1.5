#include "character.h"
#include "mud.h"

void do_clantalk( Character *ch, char *argument )
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
