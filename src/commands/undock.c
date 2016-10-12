#include <string.h>
#include "mud.h"
#include "ship.h"
#include "character.h"
#include "skill.h"

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

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( (ship->autopilot || ship->type == MOB_SHIP)  )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      SendToCharacter( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( ship->docked && ship->tractoredby &&
       ship->docked != ship->tractoredby )
    {
      SendToCharacter("&RYou can not do that in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->docked == NULL && ship->docking == SHIP_READY)
    {
      SendToCharacter("&RYou aren't docked!\r\n",ch);
      return;
    }

  eShip = ship->docked;

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->learned[gsn_midships]) ;
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int) (ch->PCData->learned[gsn_capitalships]);
  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        {
          LearnFromFailure( ch, gsn_starfighters );
          LearnFromFailure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == MIDSIZE_SHIP )
        {
          LearnFromFailure( ch, gsn_midships );
          LearnFromFailure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == CAPITAL_SHIP )
	{
          LearnFromFailure( ch, gsn_capitalships );
          LearnFromFailure( ch, gsn_shipdocking);
        }
      return;
    }
  if( ship->docking == SHIP_DOCKED )
    EchoToShip( AT_YELLOW , ship , "The ship unlocks the clamps and begins to drift away.");
  else
    EchoToShip( AT_YELLOW , ship , "You abort the docking manuever.");

  if ( ship->location )
    ship->shipstate = SHIP_LANDED;
  else
    ship->shipstate = SHIP_READY;
  ship->docking = SHIP_READY;
  ship->currspeed = 0;
  ship->docked = NULL;

  if( eShip )
    {
      EchoToShip( AT_YELLOW , eShip , "Ship undocking. Clamps released.");
      eShip->docked = NULL;
      eShip->currspeed = 0;
      if ( eShip->location )
        eShip->shipstate = SHIP_LANDED;
      else
        eShip->shipstate = SHIP_READY;
    }


  if ( ship->sclass == FIGHTER_SHIP )
    {
      LearnFromSuccess( ch, gsn_starfighters );
      LearnFromSuccess( ch, gsn_shipdocking);
    }
  if ( ship->sclass == MIDSIZE_SHIP )
    {
      LearnFromSuccess( ch, gsn_midships );
      LearnFromSuccess( ch, gsn_shipdocking);
    }
  if ( ship->sclass == CAPITAL_SHIP )
    {
      LearnFromSuccess( ch, gsn_capitalships );
      LearnFromSuccess( ch, gsn_shipdocking);
    }
}
