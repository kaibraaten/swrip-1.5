#include <string.h>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"

void do_undock(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  int the_chance = 0;
  Ship *ship;
  Ship *eShip = NULL;

  strcpy( arg, argument );

  if ( ( ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
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

  if  ( ship->Class == SHIP_PLATFORM )
    {
      SendToCharacter( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( ship->Docked && ship->TractoredBy
       && ship->Docked != ship->TractoredBy )
    {
      SendToCharacter("&RYou can not do that in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->Docked == NULL && ship->Docking == SHIP_READY)
    {
      SendToCharacter("&RYou aren't docked!\r\n",ch);
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
      SendToCharacter("&RYou can't figure out which lever to use.\r\n",ch);

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
    EchoToShip( AT_YELLOW , ship , "The ship unlocks the clamps and begins to drift away.");
  else
    EchoToShip( AT_YELLOW , ship , "You abort the docking manuever.");

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
