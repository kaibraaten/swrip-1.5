#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "room.hpp"

void do_openbay( Character *ch, char *argument )
{
  Ship *ship = nullptr;
  char buf[MAX_STRING_LENGTH];

  if ( GetShipFromPilotSeat(ch->InRoom->Vnum) == NULL
       && GetShipFromHangar(ch->InRoom->Vnum) == NULL )
    {
      ch->Echo("&RYou aren't in the pilots chair or hangar of a ship!\r\n");
      return;
    }

  if ( GetShipFromPilotSeat(ch->InRoom->Vnum) )
    ship = GetShipFromPilotSeat(ch->InRoom->Vnum);
  else
    ship = GetShipFromHangar(ch->InRoom->Vnum);

  if ( ship->Rooms.Hangar == INVALID_VNUM )
    {
      ch->Echo("&RThis ship has no hangar!\r\n");
      return;
    }

  if ( ship->BayOpen )
    {
      ch->Echo("Bay doors are already open!");
      return;
    }

  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->BayOpen = true;

  EchoToCockpit( AT_YELLOW , ship, "Bay Doors Open");
  ch->Echo("You open the bay doors");
  sprintf( buf ,"%s's bay doors open." , ship->Name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}
