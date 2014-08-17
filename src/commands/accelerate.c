#include "character.h"
#include "ships.h"
#include "mud.h"

void do_accelerate( Character *ch, char *argument )
{
  int the_chance;
  int change;
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RThe controls must be at the pilots chair...\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (IsShipDisabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to accelerate.\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->docking != SHIP_READY)
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if ( ship->tractoredby && ship->tractoredby->sclass > ship->sclass )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      send_to_char("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n",ch);
      return;
    }
  if ( ship->energy < abs((atoi(argument)-abs(ship->currspeed))/10) )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? 0
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) >= the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_failure( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_failure( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_failure( ch, gsn_capitalships );
      return;
    }

  change = atoi(argument);

  act( AT_PLAIN, "$n manipulates the ships controls.", ch,
       NULL, argument , TO_ROOM );

  if ( change > ship->currspeed )
    {
      ship->inorbitof = NULL;
      send_to_char( "&GAccelerating\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "The ship begins to accelerate.");
      EchoToDockedShip( AT_YELLOW , ship, "The hull groans at an increase in speed." );
      sprintf( buf, "%s begins to speed up." , ship->name );
      EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
    }

  if ( change < ship->currspeed )
    {
      send_to_char( "&GDecelerating\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "The ship begins to slow down.");
      EchoToDockedShip( AT_YELLOW , ship, "The hull groans as the ship slows." );
      sprintf( buf, "%s begins to slow down." , ship->name );
      EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
    }

  ship->energy -= abs((change-abs(ship->currspeed))/10);

  ship->currspeed = urange( 0 , change , ship->realspeed );

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_success( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_success( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_success( ch, gsn_capitalships );
}
