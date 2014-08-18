#include "character.h"
#include "mud.h"

void do_clantalk( Character *ch, char *argument )
{
  if (!IsAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  if ( IsNpc( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
  TalkChannel( ch, argument, CHANNEL_CLAN, "clantalk" );
}
