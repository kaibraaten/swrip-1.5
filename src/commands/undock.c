#include <string.h>
#include "mud.h"

void do_undock(CHAR_DATA *ch, char *argument)
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

  if ( ship->docked && ship->tractoredby &&
       ship->docked != ship->tractoredby )
    {
      send_to_char("&RYou can not do that in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->docked == NULL && ship->docking == SHIP_READY)
    {
      send_to_char("&RYou aren't docked!\r\n",ch);
      return;
    }

  eShip = ship->docked;

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
  if( ship->docking == SHIP_DOCKED )
    echo_to_ship( AT_YELLOW , ship , "The ship unlocks the clamps and begins to drift away.");
  else
    echo_to_ship( AT_YELLOW , ship , "You abort the docking manuever.");

  if ( ship->location )
    ship->shipstate = SHIP_LANDED;
  else
    ship->shipstate = SHIP_READY;
  ship->docking = SHIP_READY;
  ship->currspeed = 0;
  ship->docked = NULL;

  if( eShip )
    {
      echo_to_ship( AT_YELLOW , eShip , "Ship undocking. Clamps released.");
      eShip->docked = NULL;
      eShip->currspeed = 0;
      if ( eShip->location )
        eShip->shipstate = SHIP_LANDED;
      else
        eShip->shipstate = SHIP_READY;
    }


  if ( ship->sclass == FIGHTER_SHIP )
    {
      learn_from_success( ch, gsn_starfighters );
      learn_from_success( ch, gsn_shipdocking);
    }
  if ( ship->sclass == MIDSIZE_SHIP )
    {
      learn_from_success( ch, gsn_midships );
      learn_from_success( ch, gsn_shipdocking);
    }
  if ( ship->sclass == CAPITAL_SHIP )
    {
      learn_from_success( ch, gsn_capitalships );
      learn_from_success( ch, gsn_shipdocking);
    }
}
