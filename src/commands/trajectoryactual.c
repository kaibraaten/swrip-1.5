#include "character.h"
#include "ship.h"
#include "vector3_aux.h"
#include "mud.h"
#include "skill.h"

void do_trajectory_actual( Character *ch, char *argument )
{
  char  buf[MAX_STRING_LENGTH];
  char  arg2[MAX_INPUT_LENGTH];
  char  arg3[MAX_INPUT_LENGTH];
  int the_chance;
  Vector3 argvec;
  Ship *ship;

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
      SendToCharacter("&RYour not in the pilots seat.\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship))
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if (IsShipDisabled( ship ))
    {
      SendToCharacter("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }

  if  ( ship->ShipClass == SHIP_PLATFORM )
    {
      SendToCharacter( "&RPlatforms can't turn!\r\n" , ch );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship->ShipState == SHIP_DOCKED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }

  if (ship->ShipState != SHIP_READY)
    {
      SendToCharacter("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->Energy < ( ship->CurrentSpeed / 10 ) )
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

  if ( GetRandomPercent() > the_chance )
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

  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  SetVector( &argvec, atof( arg2 ), atof( arg3 ), atof( argument ) );

  if ( argvec.x == ship->Position.x
       && argvec.y == ship->Position.y
       && argvec.z == ship->Position.z )
    {
      Echo( ch , "The ship is already at %.0f %.0f %.0f!",
                 argvec.x, argvec.y, argvec.z );
      return;
    }

  if( argvec.x == 0 && argvec.y == 0 && argvec.z == 0 )
    argvec.z = ship->Position.z + 1;

  SetShipCourse( ship, &argvec );
  ship->Energy -= ship->CurrentSpeed / 10;

  Echo( ch ,"&GNew course set, approaching %.0f %.0f %.0f.\r\n",
	argvec.x, argvec.y, argvec.z );
  Act( AT_PLAIN, "$n manipulates the ships controls.", ch, NULL, argument , TO_ROOM );

  EchoToCockpit( AT_YELLOW ,ship, "The ship begins to turn.\r\n" );
  sprintf( buf, "%s turns altering its present course." , ship->Name );
  EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );

  if ( ship->ShipClass == FIGHTER_SHIP || ( ship->ShipClass == MIDSIZE_SHIP && ship->Maneuver > 50 ) )
    ship->ShipState = SHIP_BUSY_3;
  else if ( ship->ShipClass == MIDSIZE_SHIP || ( ship->ShipClass == CAPITAL_SHIP && ship->Maneuver > 50 ) )
    ship->ShipState = SHIP_BUSY_2;
  else
    ship->ShipState = SHIP_BUSY;

  if ( ship->ShipClass == FIGHTER_SHIP )
    LearnFromSuccess( ch, gsn_starfighters );
  if ( ship->ShipClass == MIDSIZE_SHIP )
    LearnFromSuccess( ch, gsn_midships );
  if ( ship->ShipClass == CAPITAL_SHIP )
    LearnFromSuccess( ch, gsn_capitalships );
}
