#include "ship.h"
#include "mud.h"
#include "character.hpp"

void do_shiptalk( Character *ch, char *argument )
{
  Ship *ship = GetShipFromCockpit(ch->InRoom->Vnum);

  if ( !ship )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_SHIP, "shiptalk" );
}
