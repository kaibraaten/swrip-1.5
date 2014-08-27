#include "character.h"
#include "ship.h"
#include "mud.h"

void do_closebay( Character *ch, char *argument )
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

  if (ship->bayopen == false)
    {
      SendToCharacter("Bay doors are already closed!", ch);
      return;
    }

  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->bayopen = false;

  EchoToCockpit( AT_YELLOW , ship, "Bay Doors close");
  SendToCharacter("You close the bay doors.", ch);
  sprintf( buf ,"%s's bay doors close." , ship->name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}
