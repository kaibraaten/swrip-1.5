#include <string.h>
#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"
#include "character.h"

void do_dock(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  int the_chance = 0;
  Ship *ship;
  Ship *eShip = NULL;

  strcpy( arg, argument );

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (! ship->spaceobject )
    {
      SendToCharacter("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->in_room->vnum))  == NULL )
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

  if (IsShipDisabled( ship ))
    {
      SendToCharacter("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }
  if (ship->statetdocking == SHIP_DISABLED)
    {
      SendToCharacter("&RYour docking port is damaged. Get it repaired!\r\n",ch);
      return;
    }

  if (ship->docking == SHIP_DOCKED)
    {
      SendToCharacter("&RTry undocking first!\r\n",ch);
      return;
    }
  if (!CanDock(ship))
    {
      SendToCharacter("&RTry undocking first!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      SendToCharacter("&RYou are already docked!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_TRACTORED && ship->tractoredby && ship->tractoredby->sclass >= ship->sclass )
    {
      SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored )
    {
      SendToCharacter("&RThe ship structure can not tolerate stresses from both tractorbeam and docking port simultaneously.\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      SendToCharacter("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->currspeed < 1 )
    {
      SendToCharacter("&RYou need to speed up a little first!\r\n",ch);
      return;
    }
  if ( ship->currspeed > 120 )
    {
      SendToCharacter("&RYou need to slow down first!\r\n",ch);
      return;
    }

  if (arg[0] == '\0')
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
  if( ship->sclass > eShip->sclass )
    {
      SendToCharacter("&RYou can not dock with a ship smaller than yours. Have them dock to you.\r\n",ch);
      return;
    }

  if (!CanDock(eShip))
    {
      SendToCharacter("&RYou can not seem to find an open docking port.\r\n",ch);
      return;
    }


  if ( eShip->currspeed >0 )
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

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;

  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);

  if ( GetRandomPercent( ) > the_chance )
    {
      SendToCharacter("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        {
          learn_from_failure( ch, gsn_starfighters );
          learn_from_failure( ch, gsn_shipdocking);
	}
      if ( ship->sclass == MIDSIZE_SHIP )
        {
          learn_from_failure( ch, gsn_midships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == CAPITAL_SHIP )
        {
          learn_from_failure( ch, gsn_capitalships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      return;
    }
  EchoToShip( AT_YELLOW , ship , "The ship slowly begins its docking maneveurs.");
  EchoToShip( AT_YELLOW , eShip , "The ship slowly begins its docking maneveurs.");
  ship->docked = eShip;
  ship->docking= SHIP_DOCK;
  ship->ch = ch;
}
