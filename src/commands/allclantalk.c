#include "mud.h"

void do_allclantalk( CHAR_DATA *ch, char *argument )
{
  if (NOT_AUTHED(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  talk_channel( ch, argument, CHANNEL_ALLCLAN, "allclantalk" );
}
