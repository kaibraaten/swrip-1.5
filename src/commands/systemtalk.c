#include "character.h"
#include "ship.h"
#include "mud.h"

void do_systemtalk( Character *ch, char *argument )
{
  Ship *ship = GetShipFromCockpit(ch->in_room->Vnum);

  if ( !ship )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_SYSTEM, "systemtalk" );
}
