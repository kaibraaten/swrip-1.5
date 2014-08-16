#include <string.h>
#include "mud.h"
#include "ships.h"
#include "character.h"

void do_sabotage(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
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

      if ( str_cmp( argument , "hull" ) && str_cmp( argument , "drive" ) &&
           str_cmp( argument , "launcher" ) && str_cmp( argument , "laser" ) &&
           str_cmp( argument , "docking" ) && str_cmp( argument , "tractor" ) )
        {
          send_to_char("&RYou need to specify something to sabotage:\r\n",ch);
          send_to_char("&rTry: hull, drive, launcher, laser, docking, or tractor.\r\n",ch);
          return;
        }

      the_chance = IsNpc(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_sabotage]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin your work.\r\n", ch);
          act( AT_PLAIN, "$n begins working on the ship's $T.", ch,
               NULL, argument , TO_ROOM );
          if ( !str_cmp(arg,"hull") )
            add_timer ( ch , TIMER_DO_FUN , 15 , do_sabotage , SUB_PAUSE );
          else
            add_timer ( ch , TIMER_DO_FUN , 15 , do_sabotage , SUB_PAUSE );
          ch->dest_buf = str_dup(arg);
	  return;
        }
      send_to_char("&RYou fail to figure out where to start.\r\n",ch);
      learn_from_failure( ch, gsn_sabotage );
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
      send_to_char("&RYou are distracted and fail to finish your work.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = ship_from_engine(ch->in_room->vnum)) == NULL )
    {
      return;
    }

  if ( !str_cmp(arg,"hull") )
    {
      change = urange( 0 ,
                       number_range( (int) ( ch->pcdata->learned[gsn_sabotage] / 2 ) , (int) (ch->pcdata->learned[gsn_sabotage]) ),
                       ( ship->hull ) );
      ship->hull -= change;
      ch_printf( ch, "&GSabotage complete.. Hull strength decreased by %d points.\r\n", change );
    }

  if ( !str_cmp(arg,"drive") )
    {
      if (ship->location == ship->lastdoc)
        ship->shipstate = SHIP_DISABLED;
      else if ( ship_is_in_hyperspace( ship ) )
        send_to_char("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n", ch);
      else
	ship->shipstate = SHIP_DISABLED;
      send_to_char("&GShips drive damaged.\r\n", ch);
    }

  if ( !str_cmp(arg,"docking") )
    {
      ship->statetdocking = SHIP_DISABLED;
      send_to_char("&GDocking bay sabotaged.\r\n", ch);
    }
  if ( !str_cmp(arg,"tractor") )
    {
      ship->statettractor = SHIP_DISABLED;
      send_to_char("&GTractorbeam sabotaged.\r\n", ch);
    }
  if ( !str_cmp(arg,"launcher") )
    {
      ship->missilestate = MISSILE_DAMAGED;
      send_to_char("&GMissile launcher sabotaged.\r\n", ch);
    }

  if ( !str_cmp(arg,"laser") )
    {
      ship->statet0 = LASER_DAMAGED;
      send_to_char("&GMain laser sabotaged.\r\n", ch);
    }

  act( AT_PLAIN, "$n finishes the work.", ch,
       NULL, argument , TO_ROOM );

  sprintf(buf, "%s has sabotaged %s!", ch->name, ship->name );
  bug(buf, 0);

  learn_from_success( ch, gsn_sabotage );
}
