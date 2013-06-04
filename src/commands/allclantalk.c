#include "character.h"
#include "mud.h"

void do_allclantalk( CHAR_DATA *ch, char *argument )
{
  if (is_not_authed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  if ( is_npc( ch ) || !is_clanned( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  talk_channel( ch, argument, CHANNEL_ALLCLAN, "allclantalk" );
}
