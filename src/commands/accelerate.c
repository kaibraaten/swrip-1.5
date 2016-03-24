#include "character.h"
#include "ship.h"
#include "mud.h"
#include "skill.h"

void do_accelerate( Character *ch, char *argument )
{
  int the_chance;
  int change;
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

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

  if (  (ship = GetShipFromPilotSeat(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RThe controls must be at the pilots chair...\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
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
      SendToCharacter("&RThe ships drive is disabled. Unable to accelerate.\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->docking != SHIP_READY)
    {
      SendToCharacter("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if ( ship->tractoredby && ship->tractoredby->sclass > ship->sclass )
    {
      SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      SendToCharacter("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n",ch);
      return;
    }
  if ( ship->energy < abs((atoi(argument)-abs(ship->currspeed))/10) )
    {
      SendToCharacter("&RTheres not enough fuel!\r\n",ch);
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
  if ( GetRandomPercent() >= the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        LearnFromFailure( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        LearnFromFailure( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        LearnFromFailure( ch, gsn_capitalships );
      return;
    }

  change = atoi(argument);

  Act( AT_PLAIN, "$n manipulates the ships controls.", ch,
       NULL, argument , TO_ROOM );

  if ( change > ship->currspeed )
    {
      ship->inorbitof = NULL;
      SendToCharacter( "&GAccelerating\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "The ship begins to accelerate.");
      EchoToDockedShip( AT_YELLOW , ship, "The hull groans at an increase in speed." );
      sprintf( buf, "%s begins to speed up." , ship->name );
      EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
    }

  if ( change < ship->currspeed )
    {
      SendToCharacter( "&GDecelerating\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "The ship begins to slow down.");
      EchoToDockedShip( AT_YELLOW , ship, "The hull groans as the ship slows." );
      sprintf( buf, "%s begins to slow down." , ship->name );
      EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
    }

  ship->energy -= abs((change-abs(ship->currspeed))/10);

  ship->currspeed = urange( 0 , change , ship->realspeed );

  if ( ship->sclass == FIGHTER_SHIP )
    LearnFromSuccess( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    LearnFromSuccess( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    LearnFromSuccess( ch, gsn_capitalships );
}
