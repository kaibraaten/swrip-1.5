#include "character.h"
#include "mud.h"
#include "ships.h"

void do_guard( Character *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;


  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the pilots seat!\r\n",ch);
      return;
    }

  if ( ship->sclass != CAPITAL_SHIP  && ship->sclass != SHIP_PLATFORM )
    {
      send_to_char("&ROnly capital-class vessels and platforms have this feature.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );

  if ( !str_cmp(argument,"on" ) )
    {
      ship->guard=TRUE;
      send_to_char( "&GYou activate the guard system.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
      ship->currspeed = 0;
    }
  else if ( !str_cmp(argument,"off" ) )
    {
      ship->guard=FALSE;
      send_to_char( "&GYou shutdown the guard system.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
    }
  else
    {
      if (ship->guard == TRUE)
        {
          ship->guard=FALSE;
          send_to_char( "&GYou shutdown the guard system.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
        }
      else
        {
          ship->guard=TRUE;
          send_to_char( "&GYou activate the guard system.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
          ship->currspeed = 0;
        }
    }

  learn_from_success( ch, gsn_shipsystems );
}
