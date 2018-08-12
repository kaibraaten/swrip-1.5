#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_autotrack( Character *ch, char *argument )
{
  Ship *ship = nullptr;
  int the_chance = 0;

  if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      ch->Echo("&RThis isn't a spacecraft!\r\n");
      return;
    }

  if ( ship->Class == SHIP_PLATFORM )
    {
      ch->Echo("&RPlatforms don't have autotracking systems!\r\n");
      return;
    }

  if ( ship->Class == CAPITAL_SHIP )
    {
      ch->Echo("&RThis ship is too big for autotracking!\r\n");
      return;
    }

  if ( ship->Docked != NULL )
    {
      ch->Echo("&RYou can not autotrack while docked!\r\n");
      return;
    }

  if ( (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou aren't in the pilots chair!\r\n");
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      ch->Echo("&RYou'll have to turn off the ships autopilot first....\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_shipsystems]) ;

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("&RYour not sure which switch to flip.\r\n");
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

