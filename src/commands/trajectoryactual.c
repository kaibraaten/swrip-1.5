#include "character.h"
#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"

void do_trajectory_actual( Character *ch, char *argument )
{
  char  buf[MAX_STRING_LENGTH];
  char  arg2[MAX_INPUT_LENGTH];
  char  arg3[MAX_INPUT_LENGTH];
  int the_chance;
  Vector3 argvec;
  Ship *ship;

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
  if  ( ship->sclass == SHIP_PLATFORM )
    {
      SendToCharacter( "&RPlatforms can't turn!\r\n" , ch );
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_DOCKED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      SendToCharacter("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }
  if ( ship->energy < (ship->currspeed/10) )
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
  if ( GetRandomPercent() > the_chance )
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

  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  SetVector( &argvec, atof( arg2 ), atof( arg3 ), atof( argument ) );

  if ( argvec.x == ship->pos.x
       && argvec.y == ship->pos.y
       && argvec.z == ship->pos.z )
    {
      ChPrintf( ch , "The ship is already at %.0f %.0f %.0f!",
                 argvec.x, argvec.y, argvec.z );
      return;
    }

  if( argvec.x == 0 && argvec.y == 0 && argvec.z == 0 )
    argvec.z = ship->pos.z + 1;

  SetShipCourse( ship, &argvec );
  ship->energy -= (ship->currspeed/10);

  ChPrintf( ch ,"&GNew course set, approaching %.0f %.0f %.0f.\r\n",
             argvec.x, argvec.y, argvec.z );
  Act( AT_PLAIN, "$n manipulates the ships controls.", ch, NULL, argument , TO_ROOM );

  EchoToCockpit( AT_YELLOW ,ship, "The ship begins to turn.\r\n" );
  sprintf( buf, "%s turns altering its present course." , ship->name );
  EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );

  if ( ship->sclass == FIGHTER_SHIP || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
    ship->shipstate = SHIP_BUSY_3;
  else if ( ship->sclass == MIDSIZE_SHIP || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
    ship->shipstate = SHIP_BUSY_2;
  else
    ship->shipstate = SHIP_BUSY;

  if ( ship->sclass == FIGHTER_SHIP )
    LearnFromSuccess( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    LearnFromSuccess( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    LearnFromSuccess( ch, gsn_capitalships );
}
