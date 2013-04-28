/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars: Rise in Power Code Additions to Star Wars Reality 1.0         *
 * copyright (c) 1999 by the Coding Team at Star Wars: Rise in Power        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                     Original RiP - Space Module 2                        *
 ****************************************************************************/

#include <math.h>
#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"
#include "vector3_aux.h"

void affectshipcargo( SHIP_DATA *ship, int typeCargo, int amount );
bool candock( SHIP_DATA *ship );

bool ship_was_in_range( SHIP_DATA *ship, SHIP_DATA *target )
{
  return target && ship && target != ship
    && ship_distance_to_ship( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3);
}

void do_jumpvector( CHAR_DATA *ch, char *argument )
{
  int the_chance, num;
  float randnum;
  Vector3 projected;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];

  num = number_range( 1, 16 );
  randnum = 1.0/(float) num;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou have to be in realspace to do that!\r\n", ch);
      return;
    }

  target = get_ship( argument );
  if ( !target )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  if ( target == ship )
    {
      send_to_char( "You can figure out where you are going on your own.\r\n", ch );
      return;
    }

  if (!ship_was_in_range( ship, target ))
    {
      send_to_char( "No log for that ship.\r\n", ch);
      return;
    }
  if (target->shipstate == SHIP_LANDED)
    {
      send_to_char( "No log for that ship.\r\n", ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_jumpvector]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou cant figure out the course vectors correctly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  if( target->shipstate == SHIP_HYPERSPACE )
    {
      projected.x = (target->pos.x - target->originpos.x)*randnum;
      projected.y = (target->pos.y - target->originpos.y)*randnum;
      projected.z = (target->pos.z - target->originpos.z)*randnum;

      send_to_char("After some deliberation, you figure out its projected course.\r\n", ch);
      sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
	      target->name, projected.x, projected.y, projected.z );
      echo_to_cockpit( AT_BLOOD, ship , buf );
      learn_from_success( ch, gsn_jumpvector );
      return;
    }

  projected.x = (target->hyperpos.x - target->originpos.x)*randnum;
  projected.y = (target->hyperpos.y - target->originpos.y)*randnum;
  projected.z = (target->hyperpos.z - target->originpos.z)*randnum;

  send_to_char("After some deliberation, you figure out its projected course.\r\n", ch);
  sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
	  target->name, projected.x, projected.y, projected.z  );
  echo_to_cockpit( AT_BLOOD, ship , buf );
  learn_from_success( ch, gsn_jumpvector );
}

void do_reload( CHAR_DATA *ch, char *argument )
{
  /* Reload code added by Darrik Vequir */
  char arg[MAX_INPUT_LENGTH];
  SHIP_DATA *ship;
  short price = 0;

  strcpy( arg, argument );

  if (arg[0] == '\0')
    {
      send_to_char("&RYou need to specify a target!\r\n",ch);
      return;
    }

  if ( ( ship = ship_in_room( ch->in_room , argument ) ) == NULL )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if (ship->shipstate == SHIP_DISABLED )
    price += 200;
  if ( ship->missilestate == MISSILE_DAMAGED )
    price += 100;
  if ( ship->statet0 == LASER_DAMAGED )
    price += 50;
  if ( ship->statet1 == LASER_DAMAGED )
    price += 50;
  if ( ship->statet2 == LASER_DAMAGED )
    price += 50;

  if ( ch->pcdata && ch->pcdata->clan && !str_cmp(ch->pcdata->clan->name,ship->owner) )
    {
      if ( ch->pcdata->clan->funds < price )
        {
          ch_printf(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n", ch->pcdata->clan->name );
          return;
        }

      ch->pcdata->clan->funds -= price;
      ch_printf(ch, "&GIt costs %s %ld credits to ready this ship for launch.\r\n", ch->pcdata->clan->name, price );
    }
  else if ( str_cmp( ship->owner , "Public" ) )
    {
      if ( ch->gold < price )
        {
          ch_printf(ch, "&RYou don't have enough funds to prepare this ship for launch.\r\n");
          return;
        }

      ch->gold -= price;
      ch_printf(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );
    }

  ship->energy = ship->maxenergy;
  ship->shield = 0;
  ship->autorecharge = FALSE;
  ship->autotrack = FALSE;
  ship->autospeed = FALSE;
  ship->hull = ship->maxhull;

  ship->missilestate = MISSILE_READY;
  ship->statet0 = LASER_READY;
  ship->statet1 = LASER_READY;
  ship->statet2 = LASER_READY;
  ship->shipstate = SHIP_LANDED;

  return;

}

void do_openbay( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];

  if ( ship_from_pilotseat(ch->in_room->vnum) == NULL
       && ship_from_hanger(ch->in_room->vnum) == NULL )
    {
      send_to_char("&RYou aren't in the pilots chair or hanger of a ship!\r\n",ch);
      return;
    }

  if ( ship_from_pilotseat(ch->in_room->vnum) )
    ship = ship_from_pilotseat(ch->in_room->vnum);
  else
    ship = ship_from_hanger(ch->in_room->vnum);

  if ( ship->hanger == 0 )
    {
      send_to_char("&RThis ship has no hanger!\r\n",ch);
      return;
    }

  if (ship->bayopen == TRUE)
    {
      send_to_char("Bay doors are already open!",ch);
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->bayopen = TRUE;

  echo_to_cockpit( AT_YELLOW , ship, "Bay Doors Open");
  send_to_char("You open the bay doors", ch);
  sprintf( buf ,"%s's bay doors open." , ship->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}

void do_closebay( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];
  if ( ship_from_pilotseat(ch->in_room->vnum) == NULL
       && ship_from_hanger(ch->in_room->vnum) == NULL )
    {
      send_to_char("&RYou aren't in the pilots chair or hanger of a ship!\r\n",ch);
      return;
    }

  if ( ship_from_pilotseat(ch->in_room->vnum) )
    ship = ship_from_pilotseat(ch->in_room->vnum);
  else
    ship = ship_from_hanger(ch->in_room->vnum);

  if ( ship->hanger == 0 )
    {
      send_to_char("&RThis ship has no hanger!\r\n",ch);
      return;
    }

  if (ship->bayopen == FALSE)
    {
      send_to_char("Bay doors are already closed!", ch);
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->bayopen = FALSE;

  echo_to_cockpit( AT_YELLOW , ship, "Bay Doors close");
  send_to_char("You close the bay doors.", ch);
  sprintf( buf ,"%s's bay doors close." , ship->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}

#if 0
void do_tractorbeam( CHAR_DATA *ch, char *argument )
{

  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];

  strcpy( arg, argument );

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if ( !check_pilot( ch , ship ) )
    {
      send_to_char("This isn't your ship!\r\n" , ch );
      return;
    }

  if ( ship->tractorbeam == 0 )
    {
      send_to_char("You might want to install a tractorbeam!\r\n" , ch );
      return;
    }

  if ( ship->hanger == 0 )
    {
      send_to_char("No hanger available.\r\n",ch);
      return;
    }

  if ( !ship->bayopen )
    {
      send_to_char("Your hanger is closed.\r\n",ch);
      return;
    }


  if ( (ship = ship_from_pilotseat(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou need to be in the pilot seat!\r\n",ch);
      return;
    }


  if (ship->shipstate == SHIP_DISABLED)
    {
      send_to_char("&RThe ships drive is disabled. No power available.\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_HYPERSPACE)
    {

      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship->shipstate != SHIP_READY)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }




  if ( argument[0] == '\0' )
    {
      send_to_char("&RCapture what?\r\n",ch);
      return;
    }

  target = get_ship_here( argument , ship );

  if ( target == NULL )
    {
      send_to_char("&RI don't see that here.\r\n",ch);
      return;
    }

  if ( target->docked != NULL )
    {
      send_to_char("&RThat ship is docked!\r\n",ch);
      return;
    }
  if ( target == ship )
    {
      send_to_char("&RYou can't capture yourself!\r\n",ch);
      return;
    }

  if( ship_distance_to_ship( ship, target ) >= (100+ship->tractorbeam*2) )
    {
      send_to_char("&R That ship is too far away! You'll have to fly a litlle closer.\r\n",ch);
      return;
    }

  if (ship->sclass != SHIP_DEBRIS && ship->sclass <= target->class)
    {
      send_to_char("&RThat ship is too big for your hanger.\r\n",ch);
      return;
    }

  if  ( target->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RYou can't capture platforms.\r\n" , ch );
      return;
    }

  if ( target->sclass == CAPITAL_SHIP)
    {
      send_to_char("&RYou can't capture capital ships.\r\n",ch);
      return;
    }


  if ( ship->energy < (25 + 25*target->class) )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }




  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_tractorbeams]);

  /* This is just a first guess the_chance modifier, feel free to change if needed */

  the_chance = the_chance * ( ship->tractorbeam / (target->currspeed+1 ) );

  if ( number_percent( ) < the_chance )
    {
      set_char_color( AT_GREEN, ch );
      send_to_char( "Capture sequence initiated.\r\n", ch);
      act( AT_PLAIN, "$n begins the capture sequence.", ch,
           NULL, argument , TO_ROOM );
      echo_to_ship( AT_YELLOW , ship , "ALERT: Ship is being captured, all hands to docking bay." );
      echo_to_ship( AT_YELLOW , target , "The ship shudders as a tractorbeam locks on." );
      sprintf( buf , "You are being captured by %s." , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );

      if ( (target->autopilot || target->type == MOB_SHIP) && !target->target0)
        target->target0 = ship;


      target->dest = STRALLOC(ship->name);
      target->shipstate = SHIP_LAND;
      target->currspeed = 0;
      target->autopilot = FALSE;

      learn_from_success( ch, gsn_tractorbeams );
      return;

    }
  send_to_char("You fail to work the controls properly.\r\n",ch);
  echo_to_ship( AT_YELLOW , target , "The ship shudders and then stops as a tractorbeam attemps to lock on and fails." );
  sprintf( buf , "The %s attempted to capture your ship!" , ship->name);
  echo_to_cockpit( AT_BLOOD , target , buf );
  if ( (target->autopilot || target->type == MOB_SHIP) && !target->target0)
    target->target0 = ship;


  learn_from_failure( ch, gsn_tractorbeams );

  return;
}
#endif

void do_tractorbeam(CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
        {
          send_to_char("&RYou must be in the copilot's seat of a ship to do that!\r\n",ch);
          return;
        }

      if ( ship->sclass > SHIP_PLATFORM )
        {
          send_to_char("&RThis isn't a spacecraft!\r\n",ch);
          return;
        }
      if ( !ship->tractorbeam )
        {
          send_to_char("&RThis craft does not have a tractorbeam!\r\n",ch);
          return;
        }



      if (ship->shipstate == SHIP_HYPERSPACE || !ship->spaceobject )
        {
          send_to_char("&RYou can only do that in realspace!\r\n",ch);
          return;
        }

      if (ship->docking != SHIP_READY )
        {
          send_to_char("&RThe ship structure can not tolerate pressure from both tractorbeam and docking port.\r\n",ch);
          return;
        }
      if (ship->shipstate == SHIP_TRACTORED)
        {
          send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
          return;
        }

      if ( autofly(ship) )
        {
          send_to_char("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
          return;
        }

      if (arg[0] == '\0')
        {
          send_to_char("&RYou need to specify a target!\r\n",ch);
          return;
        }

      if ( !str_cmp( arg, "none") )
        {
          send_to_char("&GTractorbeam set to no target.\r\n",ch);
          if( ship->tractored && ship->tractored->tractoredby == ship )
            {
              ship->tractored->tractoredby = NULL;
              if( ship->tractored->location )
                ship->tractored->shipstate = SHIP_LANDED;
              else if ( ship->tractored->shipstate != SHIP_DOCKED ||
                        ship->tractored->shipstate != SHIP_DISABLED )
                ship->tractored->shipstate = SHIP_READY;

            }
          ship->tractored = NULL;
          return;
        }

      if( ship->tractored )
        {
          send_to_char("&RReleasing previous target.\r\n",ch);
          ship->tractored->tractoredby = NULL;
          if( ship->tractored->location )
            ship->tractored->shipstate = SHIP_LANDED;
          else if ( ship->tractored->shipstate != SHIP_DOCKED ||
                    ship->tractored->shipstate != SHIP_DISABLED )
            ship->tractored->shipstate = SHIP_READY;
        }


      target = get_ship_here( arg, ship );


      if (  target == NULL )
        {
          send_to_char("&RThat ship isn't here!\r\n",ch);
          return;
        }

      if (  target == ship )
        {
          send_to_char("&RYou can't tractor your own ship!\r\n",ch);
          return;
        }

      if ( !str_cmp(ship->owner, "Trainer") && str_cmp(target->owner, "Trainer") )
        {
          send_to_char("&RTrainers can only target other trainers!!\r\n",ch);
          return;
        }
      if ( str_cmp(ship->owner, "Trainer") && !str_cmp(target->owner, "Trainer") )
        {
          send_to_char("&ROnly trainers can target other trainers!!\r\n",ch);
          return;
        }

      if ( ship->energy < (25 + 25*target->sclass) )
        {
          send_to_char("&RTheres not enough fuel!\r\n",ch);
          return;
        }
      if( ship->sclass <= SHIP_PLATFORM)
        {
	  if ( ship_distance_to_ship( ship, target ) > 100+ship->tractorbeam )
            {
              send_to_char("&RThat ship is too far away to tractor.\r\n",ch);
              return;
            }
        }

      the_chance = IS_NPC(ch) ? ch->top_level
        : (int)  (ch->pcdata->learned[gsn_tractorbeams]) ;

      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GTracking target.\r\n", ch);
          act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 1 , do_tractorbeam , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_tractorbeams );
      return;

    case 1:
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
      send_to_char("&RYour concentration is broken. You fail to lock onto your target.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = ship_from_coseat(ch->in_room->vnum)) == NULL )
    {
      return;
    }
  target = get_ship_here( arg, ship );

  if (  target == NULL || target == ship)
    {
      send_to_char("&RThe ship has left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_tractorbeams]) ;

  the_chance += target->sclass - ship->sclass;
  the_chance += ship->currspeed - target->currspeed;
  the_chance += ship->manuever - target->manuever;
  the_chance -= ship_distance_to_ship( ship, target ) /(10*(target->sclass+1));
  the_chance /= 2;
  the_chance = URANGE( 1 , the_chance , 99 );

  if ( number_percent( ) >= the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_tractorbeams );
      return;
    }

  ship->tractored = target;
  target->tractoredby = ship;
  target->shipstate = SHIP_TRACTORED;
  ship->energy -= 25 + 25*target->sclass;

  if ( target->sclass <= ship->sclass )
    {
      target->currspeed = ship->tractorbeam/2;
      ship_set_course_to_ship( target, ship );
    }

  if ( target->sclass > ship->sclass )
    {
      ship->currspeed = ship->tractorbeam/2;
      ship_set_course_to_ship( ship, target );
    }

  send_to_char( "&GTarget Locked.\r\n", ch);
  sprintf( buf , "You have been locked in a tractor beam by %s." , ship->name);
  echo_to_cockpit( AT_BLOOD , target , buf );

  sound_to_room( ch->in_room , "!!SOUND(targetlock)" );
  learn_from_success( ch, gsn_tractorbeams );

  if ( autofly(target) && !target->target0 && str_cmp( target->owner, ship->owner ) )
    {
      sprintf( buf , "You are being targetted by %s." , target->name);
      echo_to_cockpit( AT_BLOOD , ship , buf );
      target->target0 = ship;
    }
}

void do_adjusttractorbeam(CHAR_DATA *ch, char *argument )
{
  char buf[MAX_INPUT_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  SHIP_DATA *ship, *eShip;

  strcpy( arg, argument );

  if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the copilot's seat of a ship to do that!\r\n",ch);
      return;
    }

  if ( !ship->tractored || ship->tractored->tractoredby != ship )
    {
      if ( ship->tractored && ship->tractored->tractoredby != ship )
        ship->tractored = NULL;
      send_to_char("&RYour tractor beam is not trained on a ship.\r\n",ch);
      return;
    }

  if (arg[0] == '\0')
    {
      sprintf( buf, "&RCurrent tractor beam settings: ");
      if( ship->statettractor == SHIP_DISABLED )
        strcat( buf, "Disabled.\r\n" );
      if( ship->tractored == NULL )
        strcat( buf, "Deactivated.\r\n" );
      if( ship->tractored && ship->tractored->shipstate == SHIP_TRACTORED )
        strcat( buf, "Pulling Target.\r\n" );
      if( ship->tractored && ship->tractored->shipstate >= SHIP_DOCKED )
        strcat( buf, "Docking Port Approach.\r\n" );
      if( ship->tractored && ( ship->tractored->shipstate == SHIP_LAND_2 || ship->tractored->shipstate == SHIP_LAND ) )
        strcat( buf, "Hanger Approach.\r\n" );
      ch_printf(ch, "&RCurrent tractor beam settings: %s\r\n", buf);
      return;
    }

  eShip = ship->tractored;

  act( AT_PLAIN, "$n flips a switch on the control panell.", ch,
       NULL, argument , TO_ROOM );

  if( str_cmp( arg, "undock" ) && eShip->docked && eShip->docked != ship)
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set on docked ship. Undock it first.\r\n" );
      return;
    }

  if( eShip->sclass >= ship->sclass )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set on ship of a greater or equal mass as our own. It will not move.\r\n" );
      return;
    }

  if ( !eShip->spaceobject )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Target is on the ground. There is no need to adjust the tractor beam.\r\n" );
      return;
    }

  if ( !str_cmp( arg, "pull") || !str_cmp( arg, "none" ) )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to pull target.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      STRFREE(eShip->dest);
      return;
    }
  if ( !str_cmp( arg, "abort" ) )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Manuever aborted. Tractor beam returned to default setting.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      STRFREE(eShip->dest);
      return;
    }

  if ( !str_cmp( arg, "dock") )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
        {
          send_to_char("&RYou aren't close enough to dock target.\r\n",ch);
          return;
        }

      if ( !candock( eShip ) || !candock( ship ) )
        {
          send_to_char("&RYou have no empty docking port.\r\n",ch);
          return;
        }

      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to dock target.\r\n" );
      eShip->docking = SHIP_DOCK;
      eShip->docked = ship;
      return;
    }

  if ( !str_cmp( arg, "land") )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
        {
          send_to_char("&RYou aren't close enough to the target to pull it into your hanger.\r\n",ch);
          return;
        }

      if ( !ship->hanger )
        {
          send_to_char("&RYou have no hanger!\r\n",ch);
          return;
        }

      if( !ship->bayopen )
        {
          send_to_char("&RThe bay is not open.\r\n",ch);
          return;
        }

      if( ship->sclass < eShip->sclass || eShip->sclass == SHIP_PLATFORM || eShip->sclass == CAPITAL_SHIP )
        {
          send_to_char("&RThat ship can not land in your bay.\r\n",ch);
          return;
        }

      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to land target.\r\n" );
      eShip->shipstate = SHIP_LAND;
      eShip->dest = STRALLOC(ship->name);
      return;
    }

  if ( !str_cmp( arg, "undock" ) )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
        {
          send_to_char("&RYou aren't close enough to the target to pull it off its position.\r\n",ch);
          return;
        }

      if ( !eShip->docked )
        {
          send_to_char("&RYour target is not docked.\r\n",ch);
          return;
        }
      echo_to_cockpit( AT_YELLOW, ship, "Tractor beam set to undock target.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked->statettractor = SHIP_DISABLED;
      eShip->statettractor = SHIP_DISABLED;
      echo_to_cockpit( AT_RED, eShip, "As a ship is torn from your docking bay, the clamps are damaged!." );
      echo_to_cockpit( AT_RED, ship, "As your ship is torn from the docking bay, the clamps are damaged!." );
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      return;
    }
}

void do_undock(CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  int the_chance = 0;
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  strcpy( arg, argument );

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
      send_to_char("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( (ship->autopilot || ship->type == MOB_SHIP)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't move!\r\n" , ch );
      return;
    }
  if (ship->shipstate == SHIP_HYPERSPACE)
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if ( ship->docked && ship->tractoredby &&
       ship->docked != ship->tractoredby )
    {
      send_to_char("&RYou can not do that in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->docked == NULL && ship->docking == SHIP_READY)
    {
      send_to_char("&RYou aren't docked!\r\n",ch);
      return;
    }
  eShip = ship->docked;

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        {
          learn_from_failure( ch, gsn_starfighters );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == MIDSIZE_SHIP )
        {
          learn_from_failure( ch, gsn_midships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == CAPITAL_SHIP )
        {
          learn_from_failure( ch, gsn_capitalships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      return;
    }
  if( ship->docking == SHIP_DOCKED )
    echo_to_ship( AT_YELLOW , ship , "The ship unlocks the clamps and begins to drift away.");
  else
    echo_to_ship( AT_YELLOW , ship , "You abort the docking manuever.");

  if ( ship->location )
    ship->shipstate = SHIP_LANDED;
  else
    ship->shipstate = SHIP_READY;
  ship->docking = SHIP_READY;
  ship->currspeed = 0;
  ship->docked = NULL;

  if( eShip )
    {
      echo_to_ship( AT_YELLOW , eShip , "Ship undocking. Clamps released.");
      eShip->docked = NULL;
      eShip->currspeed = 0;
      if ( eShip->location )
        eShip->shipstate = SHIP_LANDED;
      else
        eShip->shipstate = SHIP_READY;
    }


  if ( ship->sclass == FIGHTER_SHIP )
    {
      learn_from_success( ch, gsn_starfighters );
      learn_from_success( ch, gsn_shipdocking);
    }
  if ( ship->sclass == MIDSIZE_SHIP )
    {
      learn_from_success( ch, gsn_midships );
      learn_from_success( ch, gsn_shipdocking);
    }
  if ( ship->sclass == CAPITAL_SHIP )
    {
      learn_from_success( ch, gsn_capitalships );
      learn_from_success( ch, gsn_shipdocking);
    }


}

bool candock( SHIP_DATA *ship )
{
  int count = 0;
  SHIP_DATA *dship;
  int ports;

  if ( !ship )
    return FALSE;

  if ( ship->docked )
    count++;

  for( dship = first_ship; dship; dship = dship->next )
    if( dship->docked && dship->docked == ship )
      count++;

  if ( ship->dockingports && count >= ship->dockingports )
    return FALSE;

  if ( ship->sclass < SHIP_PLATFORM )
    ports = ship->sclass + 1;

  if ( ship->sclass != SHIP_PLATFORM && count >= ports )
    return FALSE;

  return TRUE;
}

void do_dock(CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  int the_chance = 0;
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  strcpy( arg, argument );

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


  if (! ship->spaceobject )
    {
      send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( (ship->autopilot || ship->type == MOB_SHIP)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't move!\r\n" , ch );
      return;
    }
  if (ship->shipstate == SHIP_HYPERSPACE)
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_DISABLED)
    {
      send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }
  if (ship->statetdocking == SHIP_DISABLED)
    {
      send_to_char("&RYour docking port is damaged. Get it repaired!\r\n",ch);
      return;
    }

  if (ship->docking == SHIP_DOCKED)
    {
      send_to_char("&RTry undocking first!\r\n",ch);
      return;
    }
  if (!candock(ship))
    {
      send_to_char("&RTry undocking first!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou are already docked!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_TRACTORED && ship->tractoredby && ship->tractoredby->sclass >= ship->sclass )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored )
    {
      send_to_char("&RThe ship structure can not tolerate stresses from both tractorbeam and docking port simultaneously.\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->currspeed < 1 )
    {
      send_to_char("&RYou need to speed up a little first!\r\n",ch);
      return;
    }
  if ( ship->currspeed > 120 )
    {
      send_to_char("&RYou need to slow down first!\r\n",ch);
      return;
    }

  if (arg[0] == '\0')
    {
      send_to_char("&RDock where?\r\n",ch);
      return;
    }

  eShip = get_ship_here( arg, ship );

  if (  eShip == NULL )
    {
      send_to_char("&RThat ship isn't here!\r\n",ch);
      return;
    }
  if (  eShip == ship )
    {
      send_to_char("&RYou can't dock with your own ship!\r\n",ch);
      return;
    }
  if( ship->sclass > eShip->sclass )
    {
      send_to_char("&RYou can not dock with a ship smaller than yours. Have them dock to you.\r\n",ch);
      return;
    }


  if (!candock(eShip))
    {
      send_to_char("&RYou can not seem to find an open docking port.\r\n",ch);
      return;
    }


  if ( eShip->currspeed >0 )
    {
      send_to_char("&RThey need to be at a dead halt for the docking maneuver to begin.\r\n",ch);
      return;
    }

  if ( autofly(eShip)  )
    {
      send_to_char("&RThe other ship needs to turn their autopilot off.\r\n",ch);
      return;
    }

  if ( ship_distance_to_ship(ship, eShip) > 100 )
    {
      send_to_char("&RYou aren't close enough to dock. Get a little closer first then try again.\r\n",ch);
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;

  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);

  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        {
          learn_from_failure( ch, gsn_starfighters );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == MIDSIZE_SHIP )
        {
          learn_from_failure( ch, gsn_midships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == CAPITAL_SHIP )
        {
          learn_from_failure( ch, gsn_capitalships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      return;
    }
  echo_to_ship( AT_YELLOW , ship , "The ship slowly begins its docking maneveurs.");
  echo_to_ship( AT_YELLOW , eShip , "The ship slowly begins its docking maneveurs.");
  ship->docked = eShip;
  ship->docking= SHIP_DOCK;
  ship->ch = ch;
  return;
  /*
    case 1:
    if ( !ch->dest_buf )
    return;
    strcpy(arg, ch->dest_buf);
    DISPOSE( ch->dest_buf);
    break;

    case SUB_TIMER_DO_ABORT:
    DISPOSE( ch->dest_buf );
    ch->substate = SUB_NONE;
    ship->docked = NULL;
    send_to_char("&RDocking maneuver aborted.\r\n", ch);
    return;
    }

    ch->substate = SUB_NONE;
  */
}

void dockship( CHAR_DATA *ch, SHIP_DATA *ship )
{

  if ( ship->statetdocking == SHIP_DISABLED )
    {
      echo_to_ship( AT_YELLOW , ship , "Maneuver Aborted. Docking clamps damaged.");
      echo_to_ship( AT_YELLOW , ship->docked, "The ship aborted the docking manuever.");
      ship->docking = SHIP_READY;
      ship->docked = NULL;
      return;
    }
  if ( ship->docked->statetdocking == SHIP_DISABLED )
    {
      echo_to_ship( AT_YELLOW , ship->docked , "Maneuver Aborted. Docking clamps damaged.");
      echo_to_ship( AT_YELLOW , ship, "The ship aborted the docking manuever.");
      ship->docking = SHIP_READY;
      ship->docked = NULL;
      return;
    }

  echo_to_ship( AT_YELLOW , ship , "The ship finishing its docking manuevers.");
  echo_to_ship( AT_YELLOW , ship->docked, "The ship finishes its docking manuevers.");

  ship->docking = SHIP_DOCKED;
  ship->currspeed = 0;
  vector_copy( &ship->pos, &ship->docked->pos );

  if( ch )
    {
      if ( ship->sclass == FIGHTER_SHIP )
        {
          learn_from_success( ch, gsn_starfighters );
          learn_from_success( ch, gsn_shipdocking);
        }
      if ( ship->sclass == MIDSIZE_SHIP )
        {
          learn_from_success( ch, gsn_midships );
          learn_from_success( ch, gsn_shipdocking);
        }
      if ( ship->sclass == CAPITAL_SHIP )
        {
          learn_from_success( ch, gsn_capitalships );
          learn_from_success( ch, gsn_shipdocking);
        }
    }
}

void do_request(CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int the_chance = 0;
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  strcpy( arg, argument );

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_HYPERSPACE )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char("&RRequest the opening of the baydoors of what ship?\r\n",ch);
      return;
    }

  eShip = get_ship_here(arg,ship);

  if ( eShip == NULL )
    {
      send_to_char("&RThat ship isn't here!\r\n",ch);
      return;
    }

  if ( eShip == ship )
    {
      send_to_char("&RIf you have bay doors, why not open them yourself?\r\n",ch);
      return;
    }

  if ( eShip->hanger == 0 )
    {
      send_to_char("&RThat ship has no hanger!",ch);
      return;
    }

  if ( !autofly(eShip) )
    {
      send_to_char("&RThe other ship needs to have its autopilot turned on.\r\n",ch);
      return;
    }

  if( ship_distance_to_ship(eShip, ship) > 100*((ship->comm)+(eShip->comm)+20))
    {
      send_to_char("&RThat ship is out of the range of your comm system.\r\n&w", ch);
      return;
    }

  if( ship_distance_to_ship(eShip, ship) > 100*(ship->sensor+10)*((eShip->sclass)+1))
    {
      send_to_char("&RThat ship is too far away to remotely open bay doors.\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_fake_signal]);
  if ( (eShip->sclass == SHIP_PLATFORM ? 1 : (number_percent( ) >= the_chance)) && !check_pilot(ch,eShip) )
    {
      send_to_char("&RHey! That's not your ship!",ch);
      return;
    }

  if ( eShip->bayopen == TRUE )
    {
      send_to_char("&RThat ship's bay doors are already open!\r\n",ch);
      return;
    }
  if ( the_chance && !check_pilot(ch, eShip) )
    learn_from_success(ch, gsn_fake_signal);

  send_to_char("&RYou open the bay doors of the remote ship.",ch);
  act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
  eShip->bayopen = TRUE;
  sprintf( buf ,"%s's bay doors open." , eShip->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}

void do_shiptrack( CHAR_DATA *ch, char *argument)
{
  SHIP_DATA *ship;
  SPACE_DATA *spaceobject;
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = one_argument( argument , arg);
  argument = one_argument( argument , arg1);
  argument = one_argument( argument , arg2);
  argument = one_argument( argument , arg3);

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou can only do that in space!\r\n",ch);
      return;
    }

  if( !str_cmp( arg, "dist" ) )
    {
      ship->tcount = atoi(arg1);
      send_to_char("&RJump distance set!\r\n",ch);
      return;
    }

  if( !str_cmp( arg, "set" ) )
    {
      Vector3 head;

      if (ship->shipstate == SHIP_HYPERSPACE )
        {
          send_to_char("&RYou can only do that in realspace!\r\n",ch);
          return;
        }

      if( !is_number(arg1) || !is_number(arg2) || !is_number(arg3) )
        {
          send_to_char( "Syntax: shiptrack set <X Heading> <Y Heading> <Z Heading>.\r\n", ch);
          return;
        }

      vector_set( &head, atoi(arg1), atoi(arg2), atoi(arg3) );
      sprintf( buf, "%.0f %.0f %.0f", ship->pos.x + head.x,
	       ship->pos.y + head.y, ship->pos.z + head.z );

      if( head.x < 1000 )
	head.x *= 10000;

      if( head.y < 1000 )
	head.y *= 10000;

      if( head.z < 1000 )
	head.z *= 10000;

      ship->trackvector.x = head.x;
      ship->trackvector.y = head.y;
      ship->trackvector.z = head.z;

      ship->tracking = TRUE;
      ship->ch = ch;
      do_trajectory( ch, buf);

      vector_set( &ship->jump, ship->pos.x + head.x,
		  ship->pos.y + head.y, ship->pos.z + head.z );

      for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
        if( space_in_range( ship, spaceobject ) )
          {
            ship->currjump = spaceobject;
            break;
          }
      if( !spaceobject )
        ship->currjump = ship->spaceobject;

      if( ship->jump.x > MAX_COORD || ship->jump.y > MAX_COORD || ship->jump.z > MAX_COORD
	  || ship->jump.x < -MAX_COORD || ship->jump.y < -MAX_COORD || ship->jump.z < -MAX_COORD
	  || ship->pos.x > MAX_COORD || ship->pos.y > MAX_COORD || ship->pos.z > MAX_COORD
	  || ship->pos.x < -MAX_COORD || ship->pos.y < -MAX_COORD || ship->pos.z < -MAX_COORD
	  || ship->head.x > MAX_COORD || ship->head.y > MAX_COORD || ship->head.z > MAX_COORD
	  || ship->head.x < -MAX_COORD || ship->head.y < -MAX_COORD || ship->head.z < -MAX_COORD )
        {
          echo_to_cockpit( AT_RED, ship, "WARNING... Jump coordinates outside of the known galaxy.");
          echo_to_cockpit( AT_RED, ship, "WARNING... Hyperjump NOT set.");
          ship->currjump = NULL;
          ship->tracking = FALSE;
          return;
        }

      ship->hyperdistance = vector_distance( &ship->pos, &ship->jump ) / 50;
      ship->orighyperdistance = ship->hyperdistance;

      send_to_char( "Course laid in. Beginning tracking program.\r\n", ch);
      return;
    }
  if( !str_cmp( arg, "stop" ) || !str_cmp( arg, "halt" ))
    {
      ship->tracking = FALSE;
      send_to_char( "Tracking program cancelled.\r\n", ch);
      if( ship->shipstate == SHIP_HYPERSPACE )
        do_hyperspace( ch, "off" );
    }
}

void do_transship(CHAR_DATA *ch, char *argument)
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int arg3, origShipyard;
  SHIP_DATA *ship;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  ship = get_ship( arg1 );
  if ( !ship )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  arg3 = atoi( arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Usage: transship <ship> <vnum>\r\n", ch );
      return;
    }

  origShipyard = ship->shipyard;

  ship->shipyard = arg3;
  ship->shipstate = SHIP_READY;

  if ( ship->sclass == SHIP_PLATFORM && ship->type != MOB_SHIP )
    {
      send_to_char( "Only nonmob midship/starfighters", ch );
      return;
    }

  extract_ship( ship );
  ship_to_room( ship , ship->shipyard );

  ship->location = ship->shipyard;
  ship->lastdoc = ship->shipyard;
  ship->shipstate = SHIP_LANDED;
  ship->shipyard = origShipyard;

  if (ship->spaceobject)
    ship_from_spaceobject( ship, ship->spaceobject );



  save_ship(ship);

  send_to_char( "Ship Transfered.\r\n", ch );
}

void transship(SHIP_DATA *ship, int destination)
{
  int origShipyard;


  if ( !ship )
    return;

  origShipyard = ship->shipyard;

  ship->shipyard = destination;
  ship->shipstate = SHIP_READY;

  extract_ship( ship );
  ship_to_room( ship , ship->shipyard );

  ship->location = ship->shipyard;
  ship->lastdoc = ship->shipyard;
  ship->shipstate = SHIP_LANDED;
  ship->shipyard = origShipyard;

  if (ship->spaceobject)
    ship_from_spaceobject( ship, ship->spaceobject );

  save_ship(ship);
}

void do_override(CHAR_DATA *ch, char *argument)
{

  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_HYPERSPACE )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char("&ROverride the controls of what ship?\r\n", ch);
      return;
    }

  eShip = get_ship_here(arg,ship);

  if ( eShip == NULL )
    {
      send_to_char("&RThat ship isn't here!\r\n",ch);
      return;
    }

  if ( eShip == ship )
    {
      send_to_char("&RYou are in the cockpit, just hit the controls!\r\n", ch);
      return;
    }

  if( ship_distance_to_ship(eShip, ship) > 100*((ship->comm)+(eShip->comm)+20))
    {
      send_to_char("&RThat ship is out of the range of your comm system.\r\n&w", ch);
      return;
    }

  if ( !check_pilot(ch,eShip) )
    {
      send_to_char("&RHey! That's not your ship!",ch);
      return;
    }

  if ( !str_cmp( arg2, "shields" ) )
    {
      if( eShip->shield == 0 )
        {
          eShip->autorecharge=TRUE;
          send_to_char( "&GShields on. Confirmed.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Shields ON. Autorecharge ON.");
          return;
        }
      else
        {
          eShip->shield = 0;
          eShip->autorecharge=FALSE;
          send_to_char("Shields down. Confirmed", ch);
          return;
        }
    }
  if ( !str_cmp( arg2, "closebay" ) )
    {
      eShip->bayopen=FALSE;
      send_to_char( "&GBays Close. Confirmed.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , eShip , "Bays Open");
      sprintf( buf ,"%s's bay doors close." , eShip->name );
      echo_to_nearby_ships( AT_YELLOW, eShip, buf , NULL );
      return;
    }

  if ( !str_cmp( arg2, "stop" ) )
    {
      eShip->currspeed = 0;
      send_to_char( "&GBraking Thrusters. Confirmed.\r\n", ch);
      echo_to_cockpit( AT_GREY , eShip , "Braking thrusters fire and the ship stops");
      sprintf( buf ,"%s decelerates." , eShip->name );
      echo_to_nearby_ships( AT_GREY, eShip, buf , NULL );
      return;
    }

  if ( !str_cmp( arg2, "autopilot" ) )
    {
      if ( ship->autopilot )
        {
          eShip->autopilot=FALSE;
          send_to_char( "&GYou toggle the autopilot.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Autopilot OFF.");
          return;
        }
      else if ( !ship->autopilot )
        {
          eShip->autopilot=TRUE;
          send_to_char( "&GYou toggle the autopilot.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Autopilot ON.");
          return;
        }
    }

  if ( !str_cmp( arg2, "openbay" ) )
    {
      send_to_char("&RYou open the bay doors of the remote ship.",ch);
      act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
      eShip->bayopen = TRUE;
      sprintf( buf ,"%s's bay doors open." , eShip->name );
      echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
      return;
    }

  send_to_char("Choices: shields - Toggle shields   autopilot - Toggle autopilot\r\n", ch);
  send_to_char("         openbay   closebay  stop  \r\n", ch);
  return;
}

void do_guard( CHAR_DATA *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;


  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the pilots seat!\r\n",ch);
      return;
    }

  if ( ship->sclass != CAPITAL_SHIP  && ship->sclass != SHIP_PLATFORM )
    {
      send_to_char("&ROnly capital-class vessels and platforms have this feature.\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panell.", ch,
       NULL, argument , TO_ROOM );

  if ( !str_cmp(argument,"on" ) )
    {
      ship->guard=TRUE;
      send_to_char( "&GYou activate the guard system.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
      ship->currspeed = 0;
    }
  else if ( !str_cmp(argument,"off" ) )
    {
      ship->guard=FALSE;
      send_to_char( "&GYou shutdown the guard system.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
    }
  else
    {
      if (ship->guard == TRUE)
        {
          ship->guard=FALSE;
          send_to_char( "&GYou shutdown the guard system.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
        }
      else
        {
          ship->guard=TRUE;
          send_to_char( "&GYou activate the guard system.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
          ship->currspeed = 0;
        }
    }

  learn_from_success( ch, gsn_shipsystems );
  return;
}

void do_sabotage(CHAR_DATA *ch, char *argument )
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

      the_chance = IS_NPC(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_sabotage]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin your work.\r\n", ch);
          act( AT_PLAIN, "$n begins working on the ship's $T.", ch,
               NULL, argument , TO_ROOM );
          if ( !str_cmp(arg,"hull") )
            add_timer ( ch , TIMER_DO_FUN , 15 , do_sabotage , 1 );
          else
            add_timer ( ch , TIMER_DO_FUN , 15 , do_sabotage , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to figure out where to start.\r\n",ch);
      learn_from_failure( ch, gsn_sabotage );
      return;

    case 1:
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
      change = URANGE( 0 ,
                       number_range( (int) ( ch->pcdata->learned[gsn_sabotage] / 2 ) , (int) (ch->pcdata->learned[gsn_sabotage]) ),
                       ( ship->hull ) );
      ship->hull -= change;
      ch_printf( ch, "&GSabotage complete.. Hull strength decreased by %d points.\r\n", change );
    }

  if ( !str_cmp(arg,"drive") )
    {
      if (ship->location == ship->lastdoc)
        ship->shipstate = SHIP_DISABLED;
      else if ( ship->shipstate == SHIP_HYPERSPACE )
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

void do_refuel(CHAR_DATA *ch, char *argument )
{
}

void do_fuel(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship, *eShip;
  int amount = 0;
  char arg1[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];


  argument = one_argument( argument, arg1 );

  if (  (ship = ship_from_hanger(ch->in_room->vnum))  == NULL )
    {
      if ( (ship = ship_from_entrance(ch->in_room->vnum)) == NULL )
        {
          send_to_char("&RYou must be in the hanger or the entrance of a ship to do that!\r\n",ch);
          return;
        }
    }

  if( /* arg2[0] == '\0' || */arg1[0] == '\0' || !is_number(arg1) )
    {
      send_to_char( "Syntax: Fuel <amount> <ship>", ch);
      return;
    }

  if( argument[0] == '\0' || !str_cmp(argument, "" ))
    {
      if( !ship->docked )
        {
          for( eShip = first_ship; eShip; eShip = eShip->next )
            if( eShip->docked && eShip->docked == ship )
              break;
        }
      else
        eShip = ship->docked;
    }

  /*  if( !eShip )
      {
      eShip = ship_in_room( ch->in_room, argument );

      if( !eShip )
      {
      eShip = get_ship( argument );
      if( eShip && (!eShip->docked || eShip->docked != ship ) )
      eShip = NULL;
      }
      }
  */
  if( !eShip || eShip == NULL )
    {
      send_to_char( "Ship not docked. Fuel what ship?", ch );
      return;
    }

  amount = atoi(arg1);

  if( amount >= ship->energy )
    {
      send_to_char( "&RError: Ordered energy over current stock. Sending everything but 1 unit.\r\n", ch );
      amount = ship->energy - 1;
    }

  if( amount + eShip->energy > eShip->maxenergy )
    {
      send_to_char( "&rError: Ordered energy over target capacity. Filling tanks.\r\n", ch );
      amount = eShip->maxenergy - eShip->energy;
    }

  if( ship->sclass != SHIP_PLATFORM )
    ship->energy -= amount;

  eShip->energy += amount;

  sprintf( buf, "&YFuel order filled: &O%s: %d\r\n", eShip->name, amount );
  echo_to_cockpit( AT_YELLOW, ship, buf );
  send_to_char( buf, ch );
  sprintf( buf, "&YFuel remaining: %d\r\n", ship->energy );
  echo_to_cockpit( AT_YELLOW, ship, buf );
  send_to_char( buf, ch );

}


void do_renameship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  CLAN_DATA *clan;
  if ( (ship = ship_from_cockpit( ch->in_room->vnum ) ) == NULL)
    {
      send_to_char( "You must be in the cockpit of a ship to do that!\r\n", ch);
      return;
    }

  if( ( (clan = get_clan(ship->owner)) == NULL ) || str_cmp( clan->leader, ch->name ) )
    if( str_cmp( ship->owner, ch->name ) )
      {
        send_to_char( "&RImperial Database: &WYou do not own this ship.\r\n", ch);
        return;
      }

  if( get_ship( argument ) != NULL )
    {
      send_to_char( "&RImperial Database: &WA ship already exists of that name.\r\n", ch);
      return;
    }


  if( ch->gold < 50000 )
    {
      send_to_char( "&RImperial Database: &WYou do not have enough credits for this request.\r\n", ch);
      return;
    }


  ch->gold -= 50000;
  STRFREE( ship->personalname );
  ship->personalname            = STRALLOC( argument );
  save_ship( ship );
  send_to_char( "&RImperial Database: &WTransaction Complete. Name changed.", ch );
}

void target_ship( SHIP_DATA *ship, SHIP_DATA *target )
{
  char buf[MAX_STRING_LENGTH];

  ship->target0 = target;
  sprintf( buf , "You are being targetted by %s." , ship->name);
  echo_to_cockpit( AT_BLOOD , target , buf );
  sprintf( buf , "The ship targets %s." , target->name);
  echo_to_cockpit( AT_BLOOD , ship , buf );
}

bool check_hostile( SHIP_DATA *ship )
{
  long distance = -1, tempdistance;
  SHIP_DATA *target;
  SHIP_DATA *enemy = NULL;
  char buf[MAX_STRING_LENGTH];

  if ( !autofly(ship) || ship->sclass == SHIP_DEBRIS )
    return FALSE;

  for( target = first_ship; target; target = target->next )
    {
      if( !ship_in_range( ship, target ) )
        continue;

      if ( !str_cmp( ship->owner , "The Empire" ) )
        {
          if ( !str_cmp( target->owner , "The Rebel Alliance" ) || !str_cmp( target->owner , "The New Republic"))
            {
              tempdistance = ship_distance_to_ship( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( (!str_cmp( ship->owner , "The Rebel Alliance" )) || (!str_cmp( ship->owner , "The New Republic" )))
        {
          if ( !str_cmp( target->owner , "The Empire" ) )
            {
              tempdistance = ship_distance_to_ship( ship, target );
              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( !str_cmp( ship->owner , "Pirates" ) )
        {
          if ( str_cmp(target->owner, "Pirates") )
            {
              tempdistance = ship_distance_to_ship( ship, target );
              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( !str_cmp( ship->owner , "Zsinj" ) )
        {
          if ( str_cmp(target->owner, "Zsinj") )
            {
              tempdistance = ship_distance_to_ship( ship, target );
              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }
      if ( !str_cmp( ship->owner , "Empire SpecOps" ) )
        {
          if ( str_cmp(target->owner, "Empire SpecOps") &&
               str_cmp(target->owner, "The Empire") &&
               target->type != SHIP_IMPERIAL )
            {
              tempdistance = ship_distance_to_ship( ship, target );
              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  sprintf( buf, "%ld %ld %s %s", distance, tempdistance, ship->name, target->name );
                  bug( buf );
                  enemy = target;
                }
            }
        }

    }

  if ( enemy )
    {
      target_ship( ship, enemy );
      return TRUE;
    }
  return FALSE;

}
