#include "character.h"
#include "ship.h"
#include "vector3_aux.h"
#include "mud.h"
#include "skill.h"

void do_trajectory( Character *ch, char *argument )
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

  if ( ship->Class > SHIP_PLATFORM )
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

  if  ( ship->Class == SHIP_PLATFORM )
    {
      SendToCharacter( "&RPlatforms can't turn!\r\n" , ch );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship->State == SHIP_LANDED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }

  if (ship->Docking != SHIP_READY)
    {
      SendToCharacter("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }

  if (ship->State != SHIP_READY && ship->State != SHIP_TRACTORED)
    {
      SendToCharacter("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->Thrusters.Energy.Current < ( ship->Thrusters.Speed.Current / 10 ) )
    {
      SendToCharacter("&RTheres not enough fuel!\r\n",ch);
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
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);

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
  InitializeVector( &argvec );

  if( !IsNullOrEmpty( arg2 ) )
    argvec.x = atof( arg2 );

  if( !IsNullOrEmpty( arg3 ) )
    argvec.y = atof( arg3 );

  if( !IsNullOrEmpty( argument ) )
    argvec.z = atof( argument );
  else if ( argvec.x != ship->Position.x && argvec.y != ship->Position.y )
    argvec.z = 0;
  else
    argvec.z = 1;

  CopyVector( &ship->Heading, &argvec );
  ship->Thrusters.Energy.Current -= ship->Thrusters.Speed.Current / 10;

  Echo( ch ,"&GNew course set, approaching %.0f %.0f %.0f.\r\n",
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
