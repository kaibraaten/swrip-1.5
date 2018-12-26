#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_undock(Character *ch, std::string argument)
{
  int the_chance = 0;
  std::shared_ptr<Ship> ship;
  std::shared_ptr<Ship> eShip;

  if ( ( ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      ch->Echo("&RThis isn't a spacecraft!\r\n");
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou aren't in the pilot's seat.\r\n");
      return;
    }

  if ( (ship->Autopilot || ship->Type == MOB_SHIP)  )
    {
      ch->Echo("&RYou'll have to turn off the ship's autopilot first.\r\n");
      return;
    }

  if  ( ship->Class == SHIP_PLATFORM )
    {
      ch->Echo("&RPlatforms can't move!\r\n" );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      ch->Echo("&RYou can only do that in realspace!\r\n");
      return;
    }

  if ( ship->Docked && ship->TractoredBy
       && ship->Docked != ship->TractoredBy )
    {
      ch->Echo("&RYou can not do that in a tractor beam!\r\n");
      return;
    }

  if (ship->Docked == NULL && ship->Docking == SHIP_READY)
    {
      ch->Echo("&RYou aren't docked!\r\n");
      return;
    }

  eShip = ship->Docked;

  if ( ship->Class == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_starfighters]) ;

  if ( ship->Class == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_midships]) ;

  if ( ship->Class == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int) (ch->PCData->Learned[gsn_capitalships]);

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("&RYou can't figure out which lever to use.\r\n");

      if ( ship->Class == FIGHTER_SHIP )
        {
          LearnFromFailure( ch, gsn_starfighters );
          LearnFromFailure( ch, gsn_shipdocking);
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          LearnFromFailure( ch, gsn_midships );
          LearnFromFailure( ch, gsn_shipdocking);
        }

      if ( ship->Class == CAPITAL_SHIP )
	{
          LearnFromFailure( ch, gsn_capitalships );
          LearnFromFailure( ch, gsn_shipdocking);
        }

      return;
    }

  if( ship->Docking == SHIP_DOCKED )
    EchoToShip( AT_YELLOW, ship, "The ship unlocks the clamps and begins to drift away.");
  else
    EchoToShip( AT_YELLOW, ship, "You abort the docking maneuver.");

  if ( ship->Location )
    ship->State = SHIP_LANDED;
  else
    ship->State = SHIP_READY;

  ship->Docking = SHIP_READY;
  ship->Thrusters.Speed.Current = 0;
  ship->Docked = NULL;

  if( eShip )
    {
      EchoToShip( AT_YELLOW , eShip , "Ship undocking. Clamps released.");
      eShip->Docked = NULL;
      eShip->Thrusters.Speed.Current = 0;

      if ( eShip->Location )
        eShip->State = SHIP_LANDED;
      else
        eShip->State = SHIP_READY;
    }

  if ( ship->Class == FIGHTER_SHIP )
    {
      LearnFromSuccess( ch, gsn_starfighters );
      LearnFromSuccess( ch, gsn_shipdocking);
    }

  if ( ship->Class == MIDSIZE_SHIP )
    {
      LearnFromSuccess( ch, gsn_midships );
      LearnFromSuccess( ch, gsn_shipdocking);
    }

  if ( ship->Class == CAPITAL_SHIP )
    {
      LearnFromSuccess( ch, gsn_capitalships );
      LearnFromSuccess( ch, gsn_shipdocking);
    }
}
