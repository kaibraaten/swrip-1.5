#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_shiptalk( Character *ch, std::string argument )
{
  std::shared_ptr<Ship> ship = GetShipFromCockpit(ch->InRoom->Vnum);

  if ( !ship )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  TalkChannel( ch, argument, CHANNEL_SHIP, "shiptalk" );
}

