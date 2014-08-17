#include <string.h>
#include "vector3_aux.h"
#include "mud.h"
#include "ships.h"
#include "character.h"

void do_tractorbeam(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  Ship *ship;
  Ship *target;
  char buf[MAX_STRING_LENGTH];

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = GetShipFromCoSeat(ch->in_room->vnum))  == NULL )
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

      if ( IsShipInHyperspace( ship ) || !ship->spaceobject )
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

      if ( IsShipAutoflying(ship) )
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
                        !IsShipDisabled( ship->tractored ) )
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
                    !IsShipDisabled( ship->tractored ) )
            ship->tractored->shipstate = SHIP_READY;
        }


      target = GetShipInRange( arg, ship );


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
          send_to_char("&RTrainers can only target other trainers!\r\n",ch);
          return;
        }
      if ( str_cmp(ship->owner, "Trainer") && !str_cmp(target->owner, "Trainer") )
        {
          send_to_char("&ROnly trainers can target other trainers!\r\n",ch);
          return;
        }

      if ( ship->energy < (25 + 25 * ((int)target->sclass) ) )
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

      the_chance = IsNpc(ch) ? ch->top_level
        : (int)  (ch->pcdata->learned[gsn_tractorbeams]) ;

      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GTracking target.\r\n", ch);
          act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 1 , do_tractorbeam , SUB_PAUSE );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_tractorbeams );
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
      if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
        return;
      send_to_char("&RYour concentration is broken. You fail to lock onto your target.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = GetShipFromCoSeat(ch->in_room->vnum)) == NULL )
    {
      return;
    }
  target = GetShipInRange( arg, ship );

  if (  target == NULL || target == ship)
    {
      send_to_char("&RThe ship has left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_tractorbeams]) ;

  the_chance += target->sclass - ship->sclass;
  the_chance += ship->currspeed - target->currspeed;
  the_chance += ship->manuever - target->manuever;
  the_chance -= ship_distance_to_ship( ship, target ) /(10*(target->sclass+1));
  the_chance /= 2;
  the_chance = urange( 1 , the_chance , 99 );

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
  EchoToCockpit( AT_BLOOD , target , buf );

  learn_from_success( ch, gsn_tractorbeams );

  if ( IsShipAutoflying(target) && !target->target0 && str_cmp( target->owner, ship->owner ) )
    {
      sprintf( buf , "You are being targetted by %s." , target->name);
      EchoToCockpit( AT_BLOOD , ship , buf );
      target->target0 = ship;
    }
}
