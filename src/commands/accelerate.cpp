#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_accelerate( Character *ch, char *argument )
{
  int the_chance = 0;
  int change = 0;
  Ship *ship = nullptr;
  char buf[MAX_STRING_LENGTH] = { '\0' };

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
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
      ch->Echo("&RThe controls must be at the pilots chair...\r\n");
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      ch->Echo("&RYou'll have to turn off the ships autopilot first.\r\n");
      return;
    }

  if ( ship->Class == SHIP_PLATFORM )
    {
      ch->Echo( "&RPlatforms can't move!\r\n" );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      ch->Echo("&RYou can only do that in realspace!\r\n");
      return;
    }

  if (IsShipDisabled( ship ))
    {
      ch->Echo("&RThe ships drive is disabled. Unable to accelerate.\r\n");
      return;
    }

  if (ship->State == SHIP_LANDED)
    {
      ch->Echo("&RYou can't do that until after you've launched!\r\n");
      return;
    }

  if (ship->Docking != SHIP_READY)
    {
      ch->Echo("&RYou can't do that while docked to another ship!\r\n");
      return;
    }

  if ( ship->TractoredBy && ship->TractoredBy->Class > ship->Class )
    {
      ch->Echo("&RYou can not move in a tractorbeam!\r\n");
      return;
    }

  if (ship->WeaponSystems.TractorBeam.Tractoring != nullptr
      && ship->WeaponSystems.TractorBeam.Tractoring->Class > ship->Class )
    {
      ch->Echo("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n");
      return;
    }

  if ( ship->Thrusters.Energy.Current < abs((atoi(argument)-abs(ship->Thrusters.Speed.Current))/10) )
    {
      ch->Echo("&RTheres not enough fuel!\r\n");
      return;
    }

  if ( ship->Class == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel : (int) (ch->PCData->Learned[gsn_starfighters]) ;

  if ( ship->Class == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel : (int)  (ch->PCData->Learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->Class == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? 0 : (int) (ch->PCData->Learned[gsn_capitalships]);

  if ( GetRandomPercent() >= the_chance )
    {
      ch->Echo("&RYou fail to work the controls properly.\r\n");

      if ( ship->Class == FIGHTER_SHIP )
        LearnFromFailure( ch, gsn_starfighters );

      if ( ship->Class == MIDSIZE_SHIP )
        LearnFromFailure( ch, gsn_midships );

      if ( ship->Class == CAPITAL_SHIP )
        LearnFromFailure( ch, gsn_capitalships );

      return;
    }

  change = atoi(argument);

  Act( AT_PLAIN, "$n manipulates the ships controls.", ch,
       NULL, argument , TO_ROOM );

  if ( change > ship->Thrusters.Speed.Current )
    {
      ship->InOrbitOf = NULL;
      ch->Echo( "&GAccelerating\r\n" );
      EchoToCockpit( AT_YELLOW , ship , "The ship begins to accelerate.");
      EchoToDockedShip( AT_YELLOW , ship, "The hull groans at an increase in speed." );
      sprintf( buf, "%s begins to speed up." , ship->Name );
      EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
    }

  if ( change < ship->Thrusters.Speed.Current )
    {
      ch->Echo( "&GDecelerating.\r\n" );
      EchoToCockpit( AT_YELLOW , ship , "The ship begins to slow down.");
      EchoToDockedShip( AT_YELLOW , ship, "The hull groans as the ship slows." );
      sprintf( buf, "%s begins to slow down." , ship->Name );
      EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
    }

  ship->Thrusters.Energy.Current -= abs((change-abs(ship->Thrusters.Speed.Current))/10);
  ship->Thrusters.Speed.Current = urange( 0 , change , ship->Thrusters.Speed.Max );

  if ( ship->Class == FIGHTER_SHIP )
    LearnFromSuccess( ch, gsn_starfighters );
  if ( ship->Class == MIDSIZE_SHIP )
    LearnFromSuccess( ch, gsn_midships );
  if ( ship->Class == CAPITAL_SHIP )
    LearnFromSuccess( ch, gsn_capitalships );
}

