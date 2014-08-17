#include "character.h"
#include "mud.h"
#include "ships.h"

void do_autopilot(Character *ch, char *argument )
{
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

  if ( ! CheckPilot(ch,ship) )
    {
      send_to_char("&RHey! Thats not your ship!\r\n",ch);
      return;
    }

  if ( ship->shipstate == SHIP_DOCKED )
    {
      if(ship->docked == NULL || ( ship->docked->sclass > MIDSIZE_SHIP && ship->sclass > MIDSIZE_SHIP ))
        {
          send_to_char("&RNot until after you've launched!\r\n",ch);
          return;
        }
      send_to_char("&RNot while you are docked!\r\n",ch);
      return;
    }

  if ( ship->target0 )
    {
      ship->autotrack = false;
    }


  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );

  if ( ( ship->autopilot == true && StrCmp(argument,"on") )
       || !StrCmp(argument,"off") )
    {
      ship->autopilot=false;
      send_to_char( "&GYou toggle the autopilot.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Autopilot OFF.");
    }
  else
    {
      if( ship->shipstate == SHIP_LANDED )
        {
          send_to_char("&RNot while you are docked!\r\n",ch);
          return;
        }
      ship->autopilot=true;
      ship->autorecharge = true;
      send_to_char( "&GYou toggle the autopilot.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Autopilot ON.");
    }
}
