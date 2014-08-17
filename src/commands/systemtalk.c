#include "character.h"
#include "ships.h"
#include "mud.h"

void do_systemtalk( Character *ch, char *argument )
{
  Ship *ship = ship_from_cockpit(ch->in_room->vnum);

  if ( !ship )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  talk_channel( ch, argument, CHANNEL_SYSTEM, "systemtalk" );
}
