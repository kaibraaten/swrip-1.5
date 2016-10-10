#include "character.h"
#include "mud.h"
#include "ship.h"

void do_autopilot(Character *ch, char *argument )
{
  Ship *ship;

  if (  (ship = GetShipFromCockpit(ch->in_room->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->in_room->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the pilots seat!\r\n",ch);
      return;
    }

  if ( ! CheckPilot(ch,ship) )
    {
      SendToCharacter("&RHey! Thats not your ship!\r\n",ch);
      return;
    }

  if ( ship->shipstate == SHIP_DOCKED )
    {
      if(ship->docked == NULL || ( ship->docked->sclass > MIDSIZE_SHIP && ship->sclass > MIDSIZE_SHIP ))
        {
          SendToCharacter("&RNot until after you've launched!\r\n",ch);
          return;
        }
      SendToCharacter("&RNot while you are docked!\r\n",ch);
      return;
    }

  if ( ship->target0 )
    {
      ship->autotrack = false;
    }


  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );

  if ( ( ship->autopilot == true && StrCmp(argument,"on") )
       || !StrCmp(argument,"off") )
    {
      ship->autopilot=false;
      SendToCharacter( "&GYou toggle the autopilot.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Autopilot OFF.");
    }
  else
    {
      if( ship->shipstate == SHIP_LANDED )
        {
          SendToCharacter("&RNot while you are docked!\r\n",ch);
          return;
        }
      ship->autopilot=true;
      ship->autorecharge = true;
      SendToCharacter( "&GYou toggle the autopilot.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Autopilot ON.");
    }
}
