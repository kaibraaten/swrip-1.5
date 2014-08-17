#include "character.h"
#include "mud.h"
#include "ships.h"

void do_guard( Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;


  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->in_room->vnum))  == NULL )
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
  if ( GetRandomPercent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );

  if ( !StrCmp(argument,"on" ) )
    {
      ship->guard=true;
      send_to_char( "&GYou activate the guard system.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
      ship->currspeed = 0;
    }
  else if ( !StrCmp(argument,"off" ) )
    {
      ship->guard=false;
      send_to_char( "&GYou shutdown the guard system.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
    }
  else
    {
      if (ship->guard == true)
        {
          ship->guard=false;
          send_to_char( "&GYou shutdown the guard system.\r\n", ch);
          EchoToCockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
        }
      else
        {
          ship->guard=true;
          send_to_char( "&GYou activate the guard system.\r\n", ch);
          EchoToCockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
          ship->currspeed = 0;
        }
    }

  learn_from_success( ch, gsn_shipsystems );
}
