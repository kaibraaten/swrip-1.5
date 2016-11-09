#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"

void do_autotrack( Character *ch, char *argument )
{
  Ship *ship;
  int the_chance;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if ( ship->Class == SHIP_PLATFORM )
    {
      SendToCharacter("&RPlatforms don't have autotracking systems!\r\n",ch);
      return;
    }
  if ( ship->Class == CAPITAL_SHIP )
    {
      SendToCharacter("&RThis ship is too big for autotracking!\r\n",ch);
      return;
    }
  if ( ship->Docked != NULL )
    {
      SendToCharacter("&RYou can not autotrack while docked!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou aren't in the pilots chair!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_shipsystems]) ;
  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYour not sure which switch to flip.\r\n",ch);
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );

  if (ship->AutoTrack)
    {
      ship->AutoTrack = false;
      EchoToCockpit( AT_YELLOW , ship, "Autotracking off.");
    }
  else
    {
      ship->AutoTrack = true;
      EchoToCockpit( AT_YELLOW , ship, "Autotracking on.");
    }

  LearnFromSuccess( ch, gsn_shipsystems );
}
