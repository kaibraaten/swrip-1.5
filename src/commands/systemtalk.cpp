#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"

void do_systemtalk( Character *ch, std::string argument )
{
  Ship *ship = GetShipFromCockpit(ch->InRoom->Vnum);

  if ( !ship )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  TalkChannel( ch, argument, CHANNEL_SYSTEM, "systemtalk" );
}
