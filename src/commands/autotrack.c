#include "character.h"
#include "mud.h"
#include "ships.h"

void do_autotrack( Character *ch, char *argument )
{
  Ship *ship;
  int the_chance;

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char("&RPlatforms don't have autotracking systems!\r\n",ch);
      return;
    }
  if ( ship->sclass == CAPITAL_SHIP )
    {
      send_to_char("&RThis ship is too big for autotracking!\r\n",ch);
      return;
    }
  if ( ship->docked != NULL )
    {
      send_to_char("&RYou can not autotrack while docked!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou aren't in the pilots chair!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( GetRandomPercent( ) > the_chance )
    {
      send_to_char("&RYour not sure which switch to flip.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  if (ship->autotrack)
    {
      ship->autotrack = false;
      EchoToCockpit( AT_YELLOW , ship, "Autotracking off.");
    }
  else
    {
      ship->autotrack = true;
      EchoToCockpit( AT_YELLOW , ship, "Autotracking on.");
    }

  learn_from_success( ch, gsn_shipsystems );
}
