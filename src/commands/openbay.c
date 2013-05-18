#include "mud.h"

void do_openbay( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];

  if ( ship_from_pilotseat(ch->in_room->vnum) == NULL
       && ship_from_hanger(ch->in_room->vnum) == NULL )
    {
      send_to_char("&RYou aren't in the pilots chair or hanger of a ship!\r\n",ch);
      return;
    }

  if ( ship_from_pilotseat(ch->in_room->vnum) )
    ship = ship_from_pilotseat(ch->in_room->vnum);
  else
    ship = ship_from_hanger(ch->in_room->vnum);

  if ( ship->hanger == 0 )
    {
      send_to_char("&RThis ship has no hanger!\r\n",ch);
      return;
    }

  if (ship->bayopen == TRUE)
    {
      send_to_char("Bay doors are already open!",ch);
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->bayopen = TRUE;

  echo_to_cockpit( AT_YELLOW , ship, "Bay Doors Open");
  send_to_char("You open the bay doors", ch);
  sprintf( buf ,"%s's bay doors open." , ship->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}
