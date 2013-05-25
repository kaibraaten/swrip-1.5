#include <string.h>
#include "mud.h"
#include "ships.h"
#include "character.h"
#include "turret.h"

void do_repairship(CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance, change;
  SHIP_DATA *ship;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = ship_from_engine(ch->in_room->vnum))  == NULL )
        {
          send_to_char("&RYou must be in the engine room of a ship to do that!\r\n",ch);
          return;
        }

      if ( str_cmp( argument , "hull" )
	   && str_cmp( argument , "drive" )
           && str_cmp( argument , "launcher" )
	   && str_cmp( argument , "laser" )
           && str_prefix( "turret ", argument )
           && str_cmp( argument , "docking" )
	   && str_cmp( argument , "tractor" ) )
        {
          send_to_char("&RYou need to spceify something to repair:\r\n",ch);
          ch_printf( ch, "&rTry: hull, drive, launcher, laser, docking, tractor or turret <1 - %d>\r\n", MAX_NUMBER_OF_TURRETS_IN_SHIP);
	  return;
        }

      the_chance = is_npc(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_shipmaintenance]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin your repairs\r\n", ch);
          act( AT_PLAIN, "$n begins repairing the ships $T.", ch,
               NULL, argument , TO_ROOM );
          if ( !str_cmp(arg,"hull") )
            add_timer ( ch , TIMER_DO_FUN , 15 , do_repairship , 1 );
          else
            add_timer ( ch , TIMER_DO_FUN , 5 , do_repairship , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to locate the source of the problem.\r\n",ch);
      learn_from_failure( ch, gsn_shipmaintenance );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
        return;
      send_to_char("&RYou are distracted and fail to finish your repairs.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = ship_from_engine(ch->in_room->vnum)) == NULL )
    {
      return;
    }

  if ( !str_cmp(arg,"hull") )
    {
      change = URANGE( 0 ,
                       number_range( (int) ( ch->pcdata->learned[gsn_shipmaintenance] / 2 ) , (int) (ch->pcdata->learned[gsn_shipmaintenance]) ),
                       ( ship->maxhull - ship->hull ) );
      ship->hull += change;
      ch_printf( ch, "&GRepair complete. Hull strength inreased by %d points.\r\n", change );
    }

  if ( !str_cmp(arg,"drive") )
    {
      if (ship->location == ship->lastdoc)
        ship->shipstate = SHIP_LANDED;
      else if ( ship_is_in_hyperspace( ship ) )
        send_to_char("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n", ch);
      else
        ship->shipstate = SHIP_READY;
      send_to_char("&GShips drive repaired.\r\n", ch);
    }

  if ( !str_cmp(arg,"docking") )
    {
      ship->statetdocking = SHIP_READY;
      send_to_char("&GDocking bay repaired.\r\n", ch);
    }
  if ( !str_cmp(arg,"tractor") )
    {
      ship->statettractor = SHIP_READY;
      send_to_char("&GTractorbeam repaired.\r\n", ch);
    }
  if ( !str_cmp(arg,"launcher") )
    {
      ship->missilestate = MISSILE_READY;
      send_to_char("&GMissile launcher repaired.\r\n", ch);
    }

  if ( !str_cmp(arg,"laser") )
    {
      ship->statet0 = LASER_READY;
      send_to_char("&GMain laser repaired.\r\n", ch);
    }

  if( !str_prefix( "turret ", arg ) )
    {
      char number_string[MAX_INPUT_LENGTH];
      long turret_number = 0;
      TURRET_DATA *turret = NULL;

      argument = one_argument( arg, number_string );
      turret_number = strtol( number_string, 0, 10 );

      if( turret_number < 1 || turret_number > MAX_NUMBER_OF_TURRETS_IN_SHIP )
	{
	  ch_printf( ch, "Turret range is 1 - %d.\r\n", MAX_NUMBER_OF_TURRETS_IN_SHIP );
	  return;
	}

      turret = ship->turret[turret_number - 1];

      if( !is_turret_installed( turret ) )
	{
	  ch_printf( ch, "This ship doesn't have that many turrets installed.\r\n" );
	  return;
	}

      reset_turret( turret );
      ch_printf( ch, "&GLaser Turret %d repaired.\r\n", turret_number );
    }

  act( AT_PLAIN, "$n finishes the repairs.", ch,
       NULL, argument , TO_ROOM );

  learn_from_success( ch, gsn_shipmaintenance );
}
