#include "ships.h"
#include "mud.h"
#include "character.h"

void do_shiptalk( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = ship_from_cockpit(ch->in_room->vnum);

  if ( !ship )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  talk_channel( ch, argument, CHANNEL_SHIP, "shiptalk" );
}
