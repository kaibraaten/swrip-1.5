#include "character.hpp"
#include "mud.h"
#include "ship.h"

void do_autopilot(Character *ch, char *argument )
{
  Ship *ship;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the pilots seat!\r\n",ch);
      return;
    }

  if ( ! CheckPilot(ch,ship) )
    {
      SendToCharacter("&RHey! Thats not your ship!\r\n",ch);
      return;
    }

  if ( ship->State == SHIP_DOCKED )
    {
      if(ship->Docked == NULL || ( ship->Docked->Class > MIDSIZE_SHIP && ship->Class > MIDSIZE_SHIP ))
        {
          SendToCharacter("&RNot until after you've launched!\r\n",ch);
          return;
        }
      SendToCharacter("&RNot while you are docked!\r\n",ch);
      return;
    }

  if ( ship->WeaponSystems.Target )
    {
      ship->AutoTrack = false;
    }


  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );

  if ( ( ship->Autopilot == true && StrCmp(argument,"on") )
       || !StrCmp(argument,"off") )
    {
      ship->Autopilot=false;
      SendToCharacter( "&GYou toggle the autopilot.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Autopilot OFF.");
    }
  else
    {
      if( ship->State == SHIP_LANDED )
        {
          SendToCharacter("&RNot while you are docked!\r\n",ch);
          return;
        }
      ship->Autopilot=true;
      ship->AutoRecharge = true;
      SendToCharacter( "&GYou toggle the autopilot.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Autopilot ON.");
    }
}
