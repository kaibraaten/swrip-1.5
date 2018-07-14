#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"

void do_openbay( Character *ch, char *argument )
{
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

  if ( GetShipFromPilotSeat(ch->InRoom->Vnum) == NULL
       && GetShipFromHangar(ch->InRoom->Vnum) == NULL )
    {
      SendToCharacter("&RYou aren't in the pilots chair or hangar of a ship!\r\n",ch);
      return;
    }

  if ( GetShipFromPilotSeat(ch->InRoom->Vnum) )
    ship = GetShipFromPilotSeat(ch->InRoom->Vnum);
  else
    ship = GetShipFromHangar(ch->InRoom->Vnum);

  if ( ship->Rooms.Hangar == INVALID_VNUM )
    {
      SendToCharacter("&RThis ship.hppas no hangar!\r\n",ch);
      return;
    }

  if ( ship->BayOpen )
    {
      SendToCharacter("Bay doors are already open!",ch);
      return;
    }

  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->BayOpen = true;

  EchoToCockpit( AT_YELLOW , ship, "Bay Doors Open");
  SendToCharacter("You open the bay doors", ch);
  sprintf( buf ,"%s's bay doors open." , ship->Name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}
