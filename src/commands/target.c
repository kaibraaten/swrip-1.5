#include <string.h>
#include "vector3_aux.h"
#include "ships.h"
#include "mud.h"
#include "character.h"
#include "turret.h"

void do_target(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  Ship *ship;
  Ship *target, *dship;
  char buf[MAX_STRING_LENGTH];
  bool is_turret = false;
  size_t turret_num = 0;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = GetShipFromTurret(ch->in_room->vnum))  == NULL )
        {
          send_to_char("&RYou must be in the gunners seat or turret of a ship to do that!\r\n",ch);
          return;
        }

      if ( ship->room.gunseat != ch->in_room->vnum )
        is_turret = true;

      if ( IsShipInHyperspace( ship ) && ship->sclass <= SHIP_PLATFORM)
        {
	  send_to_char("&RYou can only do that in realspace!\r\n",ch);
          return;
        }
      if (! ship->spaceobject && ship->sclass <= SHIP_PLATFORM)
        {
          send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
          return;
        }

      if ( IsShipAutoflying(ship) && ( !is_turret || !CheckPilot( ch, ship ) ) )
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

          if ( ch->in_room->vnum == ship->room.gunseat )
            ship->target0 = NULL;

	  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	    {
	      Turret *turret = ship->turret[turret_num];

	      if( ch->in_room->vnum == GetTurretRoom( turret ) )
		{
		  ClearTurretTarget( turret );
		}
	    }

          return;
        }

      if (ship->sclass > SHIP_PLATFORM)
        target = GetShipInRoom( ship->in_room , arg );
      else
        target = GetShipInRange( arg, ship );

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

      the_chance = IsNpc(ch) ? ch->top_level
        : (int)  (ch->pcdata->learned[gsn_weaponsystems]) ;
      if ( number_percent( ) < the_chance )
        {
	  send_to_char( "&GTracking target.\r\n", ch);
          act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 1 , do_target , SUB_PAUSE );
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
      if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
        return;
      send_to_char("&RYour concentration is broken. You fail to lock onto your target.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = GetShipFromTurret(ch->in_room->vnum)) == NULL )
    {
      return;
    }
  if (ship->sclass > SHIP_PLATFORM)
    target = GetShipInRoom( ship->in_room , arg );
  else
    target = GetShipInRange( arg, ship );

  if (  target == NULL || target == ship)
    {
      send_to_char("&RThe ship has left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  if ( ch->in_room->vnum == ship->room.gunseat )
    ship->target0 = target;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      Turret *turret = ship->turret[turret_num];

      if( ch->in_room->vnum == GetTurretRoom( turret ) )
	{
	  SetTurretTarget( turret, target );
	}
    }

  send_to_char( "&GTarget Locked.\r\n", ch);
  sprintf( buf , "You are being targetted by %s." , ship->name);
  EchoToCockpit( AT_BLOOD , target , buf );
  EchoToDockedShip( AT_YELLOW , ship, "The ship's computer receives targetting data through the docking port link." );

  if ( ch->in_room->vnum == ship->room.gunseat )
    for( dship = first_ship; dship; dship = dship->next )
      if( dship->docked && dship->docked == ship )
        dship->target0 = target;

  learn_from_success( ch, gsn_weaponsystems );

  if ( IsShipAutoflying(target) && !target->target0)
    {
      sprintf( buf , "You are being targetted by %s." , target->name);
      EchoToCockpit( AT_BLOOD , ship , buf );
      target->target0 = ship;
    }
}
