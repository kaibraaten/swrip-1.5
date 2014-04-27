#include "character.h"
#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"

void do_trajectory_actual( CHAR_DATA *ch, char *argument )
{
  char  buf[MAX_STRING_LENGTH];
  char  arg2[MAX_INPUT_LENGTH];
  char  arg3[MAX_INPUT_LENGTH];
  int the_chance;
  Vector3 argvec;
  SHIP_DATA *ship;

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
      send_to_char("&RYour not in the pilots seat.\r\n",ch);
      return;
    }

  if ( is_autoflying(ship))
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }
  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't turn!\r\n" , ch );
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_DOCKED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }
  if ( ship->energy < (ship->currspeed/10) )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = is_npc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = is_npc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = is_npc(ch) ? 0
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) > the_chance )
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

  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );

  vector_set( &argvec, atof( arg2 ), atof( arg3 ), atof( argument ) );

  if ( argvec.x == ship->pos.x
       && argvec.y == ship->pos.y
       && argvec.z == ship->pos.z )
    {
      ch_printf( ch , "The ship is already at %.0f %.0f %.0f!",
                 argvec.x, argvec.y, argvec.z );
      return;
    }

  if( argvec.x == 0 && argvec.y == 0 && argvec.z == 0 )
    argvec.z = ship->pos.z + 1;

  ship_set_course( ship, &argvec );
  ship->energy -= (ship->currspeed/10);

  ch_printf( ch ,"&GNew course set, approaching %.0f %.0f %.0f.\r\n",
             argvec.x, argvec.y, argvec.z );
  act( AT_PLAIN, "$n manipulates the ships controls.", ch, NULL, argument , TO_ROOM );

  echo_to_cockpit( AT_YELLOW ,ship, "The ship begins to turn.\r\n" );
  sprintf( buf, "%s turns altering its present course." , ship->name );
  echo_to_nearby_ships( AT_ORANGE , ship , buf , NULL );

  if ( ship->sclass == FIGHTER_SHIP || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
    ship->shipstate = SHIP_BUSY_3;
  else if ( ship->sclass == MIDSIZE_SHIP || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
    ship->shipstate = SHIP_BUSY_2;
  else
    ship->shipstate = SHIP_BUSY;

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_success( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_success( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_success( ch, gsn_capitalships );
}
