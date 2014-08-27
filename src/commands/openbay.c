#include "mud.h"
#include "ship.h"
#include "character.h"

void do_openbay( Character *ch, char *argument )
{
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

  if ( GetShipFromPilotSeat(ch->in_room->vnum) == NULL
       && GetShipFromHangar(ch->in_room->vnum) == NULL )
    {
      SendToCharacter("&RYou aren't in the pilots chair or hanger of a ship!\r\n",ch);
      return;
    }

  if ( GetShipFromPilotSeat(ch->in_room->vnum) )
    ship = GetShipFromPilotSeat(ch->in_room->vnum);
  else
    ship = GetShipFromHangar(ch->in_room->vnum);

  if ( ship->room.hanger == 0 )
    {
      SendToCharacter("&RThis ship has no hanger!\r\n",ch);
      return;
    }

  if (ship->bayopen == true)
    {
      SendToCharacter("Bay doors are already open!",ch);
      return;
    }

  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->bayopen = true;

  EchoToCockpit( AT_YELLOW , ship, "Bay Doors Open");
  SendToCharacter("You open the bay doors", ch);
  sprintf( buf ,"%s's bay doors open." , ship->name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}
