#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "room.hpp"

void do_spacetalk( Character *ch, char *argument )
{
  Ship *ship = GetShipFromCockpit(ch->InRoom->Vnum);

  if ( !ship )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  TalkChannel( ch, argument, CHANNEL_SPACE, "spacetalk" );
}

