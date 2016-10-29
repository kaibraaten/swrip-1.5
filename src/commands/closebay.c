#include "character.h"
#include "ship.h"
#include "mud.h"

void do_closebay( Character *ch, char *argument )
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
      SendToCharacter("&RThis ship has no hangar!\r\n",ch);
      return;
    }

  if (ship->BayOpen == false)
    {
      SendToCharacter("Bay doors are already closed!", ch);
      return;
    }

  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->BayOpen = false;

  EchoToCockpit( AT_YELLOW , ship, "Bay Doors close");
  SendToCharacter("You close the bay doors.", ch);
  sprintf( buf ,"%s's bay doors close." , ship->Name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}
