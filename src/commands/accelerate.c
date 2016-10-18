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

  if (  (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RThe controls must be at the pilots chair...\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
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
      SendToCharacter("&RThe ships drive is disabled. Unable to accelerate.\r\n",ch);
      return;
    }
  if (ship->ShipState == SHIP_LANDED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->Docking != SHIP_READY)
    {
      SendToCharacter("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if ( ship->TractoredBy && ship->TractoredBy->ShipClass > ship->ShipClass )
    {
      SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->Tractored && ship->Tractored->ShipClass > ship->ShipClass )
    {
      SendToCharacter("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n",ch);
      return;
    }
  if ( ship->Energy < abs((atoi(argument)-abs(ship->CurrentSpeed))/10) )
    {
      SendToCharacter("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->ShipClass == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_starfighters]) ;
  if ( ship->ShipClass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_midships]) ;
  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->ShipClass == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? 0
      : (int) (ch->PCData->Learned[gsn_capitalships]);
  if ( GetRandomPercent() >= the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      if ( ship->ShipClass == FIGHTER_SHIP )
        LearnFromFailure( ch, gsn_starfighters );
      if ( ship->ShipClass == MIDSIZE_SHIP )
        LearnFromFailure( ch, gsn_midships );
      if ( ship->ShipClass == CAPITAL_SHIP )
        LearnFromFailure( ch, gsn_capitalships );
      return;
    }

  change = atoi(argument);

  Act( AT_PLAIN, "$n manipulates the ships controls.", ch,
       NULL, argument , TO_ROOM );

  if ( change > ship->CurrentSpeed )
    {
      ship->InOrbitOf = NULL;
      SendToCharacter( "&GAccelerating\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "The ship begins to accelerate.");
      EchoToDockedShip( AT_YELLOW , ship, "The hull groans at an increase in speed." );
      sprintf( buf, "%s begins to speed up." , ship->Name );
      EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
    }

  if ( change < ship->CurrentSpeed )
    {
      SendToCharacter( "&GDecelerating\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "The ship begins to slow down.");
      EchoToDockedShip( AT_YELLOW , ship, "The hull groans as the ship slows." );
      sprintf( buf, "%s begins to slow down." , ship->Name );
      EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
    }

  ship->Energy -= abs((change-abs(ship->CurrentSpeed))/10);

  ship->CurrentSpeed = urange( 0 , change , ship->RealSpeed );

  if ( ship->ShipClass == FIGHTER_SHIP )
    LearnFromSuccess( ch, gsn_starfighters );
  if ( ship->ShipClass == MIDSIZE_SHIP )
    LearnFromSuccess( ch, gsn_midships );
  if ( ship->ShipClass == CAPITAL_SHIP )
    LearnFromSuccess( ch, gsn_capitalships );
}
