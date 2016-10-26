#include <string.h>
#include "ship.h"
#include "vector3_aux.h"
#include "mud.h"
#include "character.h"
#include "skill.h"

void do_dock(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  int the_chance = 0;
  Ship *ship;
  Ship *eShip = NULL;

  strcpy( arg, argument );

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->ShipClass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (! ship->Spaceobject )
    {
      SendToCharacter("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( (ship->Autopilot || ship->Type == MOB_SHIP)  )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->ShipClass == SHIP_PLATFORM )
    {
      SendToCharacter( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (IsShipDisabled( ship ))
    {
      SendToCharacter("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }
  if (ship->DockingState == SHIP_DISABLED)
    {
      SendToCharacter("&RYour docking port is damaged. Get it repaired!\r\n",ch);
      return;
    }

  if (ship->Docking == SHIP_DOCKED)
    {
      SendToCharacter("&RTry undocking first!\r\n",ch);
      return;
    }
  if (!CanDock(ship))
    {
      SendToCharacter("&RTry undocking first!\r\n",ch);
      return;
    }
  if (ship->ShipState == SHIP_LANDED)
    {
      SendToCharacter("&RYou are already docked!\r\n",ch);
      return;
    }
  if (ship->ShipState == SHIP_TRACTORED && ship->TractoredBy && ship->TractoredBy->ShipClass >= ship->ShipClass )
    {
      SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->Tractoring )
    {
      SendToCharacter("&RThe ship structure can not tolerate stresses from both tractorbeam and docking port simultaneously.\r\n",ch);
      return;
    }
  if (ship->ShipState != SHIP_READY)
    {
      SendToCharacter("&RPlease wait until the ship has finished its current maneuver.\r\n",ch);
      return;
    }

  if ( ship->Engine.Speed.Current < 1 )
    {
      SendToCharacter("&RYou need to speed up a little first!\r\n",ch);
      return;
    }
  if ( ship->Engine.Speed.Current > 120 )
    {
      SendToCharacter("&RYou need to slow down first!\r\n",ch);
      return;
    }

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter("&RDock where?\r\n",ch);
      return;
    }

  eShip = GetShipInRange( arg, ship );

  if (  eShip == NULL )
    {
      SendToCharacter("&RThat ship isn't here!\r\n",ch);
      return;
    }
  if (  eShip == ship )
    {
      SendToCharacter("&RYou can't dock with your own ship!\r\n",ch);
      return;
    }
  if( ship->ShipClass > eShip->ShipClass )
    {
      SendToCharacter("&RYou can not dock with a ship smaller than yours. Have them dock to you.\r\n",ch);
      return;
    }

  if (!CanDock(eShip))
    {
      SendToCharacter("&RYou can not seem to find an open docking port.\r\n",ch);
      return;
    }


  if ( eShip->Engine.Speed.Current >0 )
    {
      SendToCharacter("&RThey need to be at a dead halt for the docking maneuver to begin.\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(eShip)  )
    {
      SendToCharacter("&RThe other ship needs to turn their autopilot off.\r\n",ch);
      return;
    }

  if ( GetShipDistanceToShip(ship, eShip) > 100 )
    {
      SendToCharacter("&RYou aren't close enough to dock. Get a little closer first then try again.\r\n",ch);
      return;
    }

  if ( ship->ShipClass == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_starfighters]) ;

  if ( ship->ShipClass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_midships]) ;

  if ( ship->ShipClass == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int) (ch->PCData->Learned[gsn_capitalships]);

  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->ShipClass == FIGHTER_SHIP )
        {
          LearnFromFailure( ch, gsn_starfighters );
          LearnFromFailure( ch, gsn_shipdocking);
	}
      if ( ship->ShipClass == MIDSIZE_SHIP )
        {
          LearnFromFailure( ch, gsn_midships );
          LearnFromFailure( ch, gsn_shipdocking);
        }
      if ( ship->ShipClass == CAPITAL_SHIP )
        {
          LearnFromFailure( ch, gsn_capitalships );
          LearnFromFailure( ch, gsn_shipdocking);
        }
      return;
    }
  EchoToShip( AT_YELLOW , ship , "The ship slowly begins its docking maneuvers.");
  EchoToShip( AT_YELLOW , eShip , "The ship slowly begins its docking maneuvers.");
  ship->Docked = eShip;
  ship->Docking= SHIP_DOCK;
  ship->Ch = ch;
}
