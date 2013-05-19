#include <string.h>
#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"

void do_dock(CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  int the_chance = 0;
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  strcpy( arg, argument );

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (! ship->spaceobject )
    {
      send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( (ship->autopilot || ship->type == MOB_SHIP)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }
  if (ship->statetdocking == SHIP_DISABLED)
    {
      send_to_char("&RYour docking port is damaged. Get it repaired!\r\n",ch);
      return;
    }

  if (ship->docking == SHIP_DOCKED)
    {
      send_to_char("&RTry undocking first!\r\n",ch);
      return;
    }
  if (!candock(ship))
    {
      send_to_char("&RTry undocking first!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou are already docked!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_TRACTORED && ship->tractoredby && ship->tractoredby->sclass >= ship->sclass )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored )
    {
      send_to_char("&RThe ship structure can not tolerate stresses from both tractorbeam and docking port simultaneously.\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->currspeed < 1 )
    {
      send_to_char("&RYou need to speed up a little first!\r\n",ch);
      return;
    }
  if ( ship->currspeed > 120 )
    {
      send_to_char("&RYou need to slow down first!\r\n",ch);
      return;
    }

  if (arg[0] == '\0')
    {
      send_to_char("&RDock where?\r\n",ch);
      return;
    }

  eShip = get_ship_here( arg, ship );

  if (  eShip == NULL )
    {
      send_to_char("&RThat ship isn't here!\r\n",ch);
      return;
    }
  if (  eShip == ship )
    {
      send_to_char("&RYou can't dock with your own ship!\r\n",ch);
      return;
    }
  if( ship->sclass > eShip->sclass )
    {
      send_to_char("&RYou can not dock with a ship smaller than yours. Have them dock to you.\r\n",ch);
      return;
    }

  if (!candock(eShip))
    {
      send_to_char("&RYou can not seem to find an open docking port.\r\n",ch);
      return;
    }


  if ( eShip->currspeed >0 )
    {
      send_to_char("&RThey need to be at a dead halt for the docking maneuver to begin.\r\n",ch);
      return;
    }

  if ( is_autoflying(eShip)  )
    {
      send_to_char("&RThe other ship needs to turn their autopilot off.\r\n",ch);
      return;
    }

  if ( ship_distance_to_ship(ship, eShip) > 100 )
    {
      send_to_char("&RYou aren't close enough to dock. Get a little closer first then try again.\r\n",ch);
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;

  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);

  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which lever to use.\r\n",ch);
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
  echo_to_ship( AT_YELLOW , ship , "The ship slowly begins its docking maneveurs.");
  echo_to_ship( AT_YELLOW , eShip , "The ship slowly begins its docking maneveurs.");
  ship->docked = eShip;
  ship->docking= SHIP_DOCK;
  ship->ch = ch;
}
