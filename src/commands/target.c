#include <string.h>
#include "vector3_aux.h"
#include "ships.h"
#include "mud.h"
#include "character.h"

void do_target(CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target, *dship;
  char buf[MAX_STRING_LENGTH];
  bool turret = FALSE;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = ship_from_turret(ch->in_room->vnum))  == NULL )
        {
          send_to_char("&RYou must be in the gunners seat or turret of a ship to do that!\r\n",ch);
          return;
        }
      if ( ship->gunseat != ch->in_room->vnum )
        turret = TRUE;

      if ( ship_is_in_hyperspace( ship ) && ship->sclass <= SHIP_PLATFORM)
        {
	  send_to_char("&RYou can only do that in realspace!\r\n",ch);
          return;
        }
      if (! ship->spaceobject && ship->sclass <= SHIP_PLATFORM)
        {
          send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
          return;
        }

      if ( is_autoflying(ship) && ( !turret || !check_pilot( ch, ship ) ) )
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
          send_to_char("&GTarget set to none.\r\n",ch);
          if ( ch->in_room->vnum == ship->gunseat )
            ship->target0 = NULL;
          if ( ch->in_room->vnum == ship->turret1 )
            ship->target1 = NULL;
          if ( ch->in_room->vnum == ship->turret2 )
            ship->target2 = NULL;
          if ( ch->in_room->vnum == ship->turret3 )
            ship->target3 = NULL;
          if ( ch->in_room->vnum == ship->turret4 )
            ship->target4 = NULL;
          if ( ch->in_room->vnum == ship->turret5 )
            ship->target5 = NULL;
          if ( ch->in_room->vnum == ship->turret6 )
            ship->target6 = NULL;
          if ( ch->in_room->vnum == ship->turret7 )
            ship->target7 = NULL;
          if ( ch->in_room->vnum == ship->turret8 )
            ship->target8 = NULL;
          if ( ch->in_room->vnum == ship->turret9 )
            ship->target9 = NULL;
          if ( ch->in_room->vnum == ship->turret0 )
	    ship->target10 = NULL;
          return;
        }
      if (ship->sclass > SHIP_PLATFORM)
        target = ship_in_room( ship->in_room , arg );
      else
        target = get_ship_here( arg, ship );


      if (  target == NULL )
        {
          send_to_char("&RThat ship isn't here!\r\n",ch);
          return;
        }

      if (  target == ship )
        {
          send_to_char("&RYou can't target your own ship!\r\n",ch);
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

      if( ship->sclass <= SHIP_PLATFORM)
        {
          if ( ship_distance_to_ship( ship, target ) > 5000 )
            {
              send_to_char("&RThat ship is too far away to target.\r\n",ch);
              return;
            }
        }

      the_chance = is_npc(ch) ? ch->top_level
        : (int)  (ch->pcdata->learned[gsn_weaponsystems]) ;
      if ( number_percent( ) < the_chance )
        {
	  send_to_char( "&GTracking target.\r\n", ch);
          act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 1 , do_target , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_weaponsystems );
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
      send_to_char("&RYour concentration is broken. You fail to lock onto your target.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = ship_from_turret(ch->in_room->vnum)) == NULL )
    {
      return;
    }
  if (ship->sclass > SHIP_PLATFORM)
    target = ship_in_room( ship->in_room , arg );
  else
    target = get_ship_here( arg, ship );

  if (  target == NULL || target == ship)
    {
      send_to_char("&RThe ship has left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  if ( ch->in_room->vnum == ship->gunseat )
    ship->target0 = target;

  if ( ch->in_room->vnum == ship->turret1 )
    ship->target1 = target;

  if ( ch->in_room->vnum == ship->turret2 )
    ship->target2 = target;

  if ( ch->in_room->vnum == ship->turret3 )
    ship->target3 = target;

  if ( ch->in_room->vnum == ship->turret4 )
    ship->target4 = target;

  if ( ch->in_room->vnum == ship->turret5 )
    ship->target5 = target;

  if ( ch->in_room->vnum == ship->turret6 )
    ship->target6 = target;

  if ( ch->in_room->vnum == ship->turret7 )
    ship->target7 = target;

  if ( ch->in_room->vnum == ship->turret8 )
    ship->target8 = target;

  if ( ch->in_room->vnum == ship->turret9 )
    ship->target9 = target;

  if ( ch->in_room->vnum == ship->turret0 )
    ship->target0 = target;

  send_to_char( "&GTarget Locked.\r\n", ch);
  sprintf( buf , "You are being targetted by %s." , ship->name);
  echo_to_cockpit( AT_BLOOD , target , buf );
  echo_to_docked( AT_YELLOW , ship, "The ship's computer receives targetting data through the docking port link." );

  if ( ch->in_room->vnum == ship->gunseat )
    for( dship = first_ship; dship; dship = dship->next )
      if( dship->docked && dship->docked == ship )
        dship->target0 = target;

  sound_to_room( ch->in_room , "!!SOUND(targetlock)" );
  learn_from_success( ch, gsn_weaponsystems );

  if ( is_autoflying(target) && !target->target0)
    {
      sprintf( buf , "You are being targetted by %s." , target->name);
      echo_to_cockpit( AT_BLOOD , ship , buf );
      target->target0 = ship;
    }
}