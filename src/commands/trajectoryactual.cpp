#include "character.hpp"
#include "ship.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_trajectory_actual( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  int the_chance = 0;
  Vector3 argvec;
  Ship *ship = NULL;

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
      ch->Echo("&RYour not in the pilots seat.\r\n");
      return;
    }

  if ( IsShipAutoflying(ship))
    {
      ch->Echo("&RYou'll have to turn off the ships autopilot first.\r\n");
      return;
    }

  if (IsShipDisabled( ship ))
    {
      ch->Echo("&RThe ships drive is disabled. Unable to manuever.\r\n");
      return;
    }

  if  ( ship->Class == SHIP_PLATFORM )
    {
      ch->Echo("&RPlatforms can't turn!\r\n" );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      ch->Echo("&RYou can only do that in realspace!\r\n");
      return;
    }

  if (ship->State == SHIP_DOCKED)
    {
      ch->Echo("&RYou can't do that until after you've launched!\r\n");
      return;
    }

  if (ship->State != SHIP_READY)
    {
      ch->Echo("&RPlease wait until the ship has finished its current manouver.\r\n");
      return;
    }

  if ( ship->Thrusters.Energy.Current < ( ship->Thrusters.Speed.Current / 10 ) )
    {
      ch->Echo("&RTheres not enough fuel!\r\n");
      return;
    }

  if ( ship->Class == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_starfighters]) ;

  if ( ship->Class == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->Class == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? 0
      : (int) (ch->PCData->Learned[gsn_capitalships]);

  if ( GetRandomPercent() > the_chance )
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

  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  SetVector( &argvec, atof( arg2 ), atof( arg3 ), atof( argument ) );

  if ( argvec.x == ship->Position.x
       && argvec.y == ship->Position.y
       && argvec.z == ship->Position.z )
    {
      ch ->Echo("The ship is already at %.0f %.0f %.0f!",
                 argvec.x, argvec.y, argvec.z );
      return;
    }

  if( argvec.x == 0 && argvec.y == 0 && argvec.z == 0 )
    argvec.z = ship->Position.z + 1;

  SetShipCourse( ship, &argvec );
  ship->Thrusters.Energy.Current -= ship->Thrusters.Speed.Current / 10;

  ch ->Echo("&GNew course set, approaching %.0f %.0f %.0f.\r\n",
	argvec.x, argvec.y, argvec.z );
  Act( AT_PLAIN, "$n manipulates the ships controls.", ch, NULL, argument , TO_ROOM );

  EchoToCockpit( AT_YELLOW ,ship, "The ship begins to turn.\r\n" );
  sprintf( buf, "%s turns altering its present course." , ship->Name );
  EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );

  if ( ship->Class == FIGHTER_SHIP
       || ( ship->Class == MIDSIZE_SHIP && ship->Thrusters.Maneuver > 50 ) )
    ship->State = SHIP_BUSY_3;
  else if ( ship->Class == MIDSIZE_SHIP
	    || ( ship->Class == CAPITAL_SHIP && ship->Thrusters.Maneuver > 50 ) )
    ship->State = SHIP_BUSY_2;
  else
    ship->State = SHIP_BUSY;

  if ( ship->Class == FIGHTER_SHIP )
    LearnFromSuccess( ch, gsn_starfighters );
  if ( ship->Class == MIDSIZE_SHIP )
    LearnFromSuccess( ch, gsn_midships );
  if ( ship->Class == CAPITAL_SHIP )
    LearnFromSuccess( ch, gsn_capitalships );
}

