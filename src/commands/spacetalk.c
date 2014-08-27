#include "character.h"
#include "mud.h"
#include "ship.h"

void do_spacetalk( Character *ch, char *argument )
{
  Ship *ship = GetShipFromCockpit(ch->in_room->vnum);

  if ( !ship )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_SPACE, "spacetalk" );
}
