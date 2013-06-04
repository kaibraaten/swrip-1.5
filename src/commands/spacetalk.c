#include "character.h"
#include "mud.h"
#include "ships.h"

void do_spacetalk( Character *ch, char *argument )
{
  SHIP_DATA *ship = ship_from_cockpit(ch->in_room->vnum);

  if ( !ship )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  talk_channel( ch, argument, CHANNEL_SPACE, "spacetalk" );
}
