#include "mud.h"
#include "ships.h"
#include "character.h"

void do_openbay( Character *ch, char *argument )
{
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

  if ( GetShipFromPilotSeat(ch->in_room->vnum) == NULL
       && GetShipFromHangar(ch->in_room->vnum) == NULL )
    {
      send_to_char("&RYou aren't in the pilots chair or hanger of a ship!\r\n",ch);
      return;
    }

  if ( GetShipFromPilotSeat(ch->in_room->vnum) )
    ship = GetShipFromPilotSeat(ch->in_room->vnum);
  else
    ship = GetShipFromHangar(ch->in_room->vnum);

  if ( ship->room.hanger == 0 )
    {
      send_to_char("&RThis ship has no hanger!\r\n",ch);
      return;
    }

  if (ship->bayopen == true)
    {
      send_to_char("Bay doors are already open!",ch);
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->bayopen = true;

  EchoToCockpit( AT_YELLOW , ship, "Bay Doors Open");
  send_to_char("You open the bay doors", ch);
  sprintf( buf ,"%s's bay doors open." , ship->name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}
