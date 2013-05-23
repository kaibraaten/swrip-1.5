#include "character.h"
#include "mud.h"

void do_clantalk( CHAR_DATA *ch, char *argument )
{
  if (NOT_AUTHED(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  if ( is_npc( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
  talk_channel( ch, argument, CHANNEL_CLAN, "clantalk" );
}
