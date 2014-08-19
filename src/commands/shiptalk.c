#include "ships.h"
#include "mud.h"
#include "character.h"

void do_shiptalk( Character *ch, char *argument )
{
  Ship *ship = GetShipFromCockpit(ch->in_room->vnum);

  if ( !ship )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_SHIP, "shiptalk" );
}
