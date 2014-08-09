#include "turret.h"
#include "character.h"
#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"

void do_fire(Character *ch, char *argument )
{
  int the_chance, origthe_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];
  bool is_turret = false;
  int turret_num = 0;

  if (  (ship = ship_from_turret(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the gunners chair or turret of a ship to do that!\r\n",ch);
      return;
    }
  if ( ship->room.gunseat != ch->in_room->vnum )
    is_turret = true;

  if ( ship_is_in_hyperspace( ship ) && ship->sclass <= SHIP_PLATFORM )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->spaceobject == NULL && ship->sclass <= SHIP_PLATFORM)
    {
      send_to_char("&RYou can't do that until after you've finished launching!\r\n",ch);
      return;
    }
  if ( ship->energy <5 )
    {
      send_to_char("&RTheres not enough energy left to fire!\r\n",ch);
      return;
    }

  if ( is_autoflying(ship) && !is_turret )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) ( ch->stats.perm_dex*2 + ch->pcdata->learned[gsn_spacecombat]/3
              + ch->pcdata->learned[gsn_spacecombat2]/3 + ch->pcdata->learned[gsn_spacecombat3]/3 );
  origthe_chance = the_chance;

  if ( ship->sclass > SHIP_PLATFORM && !is_npc(ch))
    ((ch->pcdata->learned[gsn_speeders] == 100) ? (the_chance -= 100 - ch->pcdata->learned[gsn_speedercombat]) : (the_chance = 0) );

  if ( ch->in_room->vnum == ship->room.gunseat && !str_prefix( argument , "lasers"))
    {

      if (ship->statet0 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships main laser is damaged.\r\n",ch);
          return;
        }
      if (ship->statet0 >= ship->lasers )
        {
          send_to_char("&RThe lasers are still recharging.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target ) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if (ship->sclass > SHIP_PLATFORM && ship->target0->in_room != ship->in_room)
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }

      if(ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of laser range.\r\n",ch);
              return;
	    }
        }

      if ( ship->sclass < CAPITAL_SHIP
           && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RThe main laser can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      ship->statet0++;

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / ( 10 * ( target->sclass + 1 ) );
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf , "Lasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "The ships lasers fire at %s but miss." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          sprintf( buf, "Laserfire from %s barely misses %s." , ship->name , target->name );
          if(ship->sclass > SHIP_PLATFORM)
            echo_to_room(AT_ORANGE, ship->in_room, buf);
          else
            echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          return;
        }
      sprintf( buf, "Laserfire from %s hits %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by lasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Your ships lasers hit %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      if (ship->sclass > SHIP_PLATFORM )
        learn_from_success( ch, gsn_speedercombat );

      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
      if( ship->sclass == SHIP_PLATFORM )
        damage_ship_ch( target, 100, 250, ch);
      else if( ship->sclass == CAPITAL_SHIP && target->sclass < CAPITAL_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( is_autoflying(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->room.gunseat && !str_prefix( argument , "ions") )
    {

      if (ship->statet0 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships main weapons are damaged.\r\n",ch);
          return;
        }
      if (ship->ions <= 0)
        {
          send_to_char("&RYou have no ion cannons to fire.\r\n", ch);
          return;
        }
      if (ship->statei0 >= ship->ions )
        {
          send_to_char("&RThe ion cannons are still recharging.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range(ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if (ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of ion range.\r\n",ch);
              return;
            }
        }
      if ( ship->sclass < CAPITAL_SHIP && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RThe main ion cannon can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
        }
      ship->statei0++;

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf , "Ion cannons fire from %s at you, but the blue plasma narrowly misses." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "The ships ion cannons fire at %s but the blue plasma narrowly misses." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
	  learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          sprintf( buf, "Blue ion plasma from %s narrowly misses %s." , ship->name , target->name );
          if(ship->sclass > SHIP_PLATFORM)
            echo_to_room(AT_ORANGE, ship->in_room, buf);
          else
            echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          return;
        }
      sprintf( buf, "Blue plasma from %s engulfs %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are engulfed by ion energy from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Blue plasma from your ship engulf %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      if (ship->sclass > SHIP_PLATFORM )
        learn_from_success( ch, gsn_speedercombat );

      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
      if( ship->sclass == SHIP_PLATFORM )
        damage_ship_ch( target, -200, -50, ch );
      else if( ship->sclass == CAPITAL_SHIP && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, -200, -50, ch );
      else
        damage_ship_ch( target, -75 , -10, ch );

      if ( is_autoflying(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->room.gunseat && !str_prefix( argument , "missile") )
    {
      if (ship->missilestate == MISSILE_DAMAGED)
	{
          send_to_char("&RThe ships missile launchers are dammaged.\r\n",ch);
          return;
        }
      if (ship->missiles <= 0)
        {
          send_to_char("&RYou have no missiles to fire!\r\n",ch);
          return;
        }
      if (ship->missilestate != MISSILE_READY )
        {
          send_to_char("&RThe missiles are still reloading.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if(ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of missile range.\r\n",ch);
              return;
            }
        }
      if ( ship->sclass < CAPITAL_SHIP
           && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RMissiles can only fire in a forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target)/(10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = URANGE( 20 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          send_to_char( "&RYou fail to lock onto your target!", ch );
          ship->missilestate = MISSILE_RELOAD_2;
          return;
        }
      if(ship->sclass <= SHIP_PLATFORM)
        new_missile( ship , target , ch , CONCUSSION_MISSILE );
      else
        damage_ship_ch(target, 75, 200, ch );
      ship->missiles-- ;
      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      echo_to_cockpit( AT_YELLOW , ship , "Missiles launched.");
      sprintf( buf , "Incoming missile from %s." , ship->name);
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_ship( AT_RED , target , "A large explosion vibrates through the ship." );

      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a missile towards %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      learn_from_success( ch, gsn_weaponsystems );
      if ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
        ship->missilestate = MISSILE_RELOAD;
      else
        ship->missilestate = MISSILE_FIRED;

      if ( is_autoflying(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
	}

      return;
    }
  if ( ch->in_room->vnum == ship->room.gunseat && !str_prefix( argument , "torpedo") )
    {
      if (ship->missilestate == MISSILE_DAMAGED)
        {
          send_to_char("&RThe ships missile launchers are dammaged.\r\n",ch);
          return;
        }
      if (ship->torpedos <= 0)
        {
          send_to_char("&RYou have no torpedos to fire!\r\n",ch);
          return;
        }
      if (ship->missilestate != MISSILE_READY )
        {
          send_to_char("&RThe torpedos are still reloading.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if(ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of torpedo range.\r\n",ch);
              return;
            }
        }
      if ( ship->sclass < CAPITAL_SHIP
           && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RTorpedos can only fire in a forward direction. You'll need to turn your ship!\r\n",ch);
	  return;
        }

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = URANGE( 20 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          send_to_char( "&RYou fail to lock onto your target!", ch );
          ship->missilestate = MISSILE_RELOAD_2;
          return;
        }
      if( ship->sclass <= SHIP_PLATFORM)
        new_missile( ship , target , ch , PROTON_TORPEDO );
      else
        damage_ship_ch( target, 200, 300, ch);
      ship->torpedos-- ;
      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      echo_to_cockpit( AT_YELLOW , ship , "Missiles launched.");
      sprintf( buf , "Incoming torpedo from %s." , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a torpedo towards %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        {
          echo_to_room(AT_ORANGE, ship->in_room, buf);
          echo_to_ship( AT_RED , target , "A large explosion vibrates through the ship." );
        }
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      learn_from_success( ch, gsn_weaponsystems );
      if ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
        ship->missilestate = MISSILE_RELOAD;
      else
	ship->missilestate = MISSILE_FIRED;

      if ( is_autoflying(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->room.gunseat && !str_prefix( argument , "rocket") )
    {
      if (ship->missilestate == MISSILE_DAMAGED)
        {
          send_to_char("&RThe ships missile launchers are damaged.\r\n",ch);
          return;
        }
      if (ship->rockets <= 0)
        {
          send_to_char("&RYou have no rockets to fire!\r\n",ch);
          return;
        }
      if (ship->missilestate != MISSILE_READY )
        {
          send_to_char("&RThe missiles are still reloading.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if (ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 800 )
            {
	      send_to_char("&RThat ship is out of rocket range.\r\n",ch);
              return;
            }
        }
      if ( ship->sclass < CAPITAL_SHIP
           && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RRockets can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = URANGE( 20 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          send_to_char( "&RYou fail to lock onto your target!", ch );
          ship->missilestate = MISSILE_RELOAD_2;
          return;
        }
      if( ship->sclass <= SHIP_PLATFORM)
        new_missile( ship , target , ch , HEAVY_ROCKET );
      else
        damage_ship_ch( target, 450, 550, ch );

      ship->rockets-- ;
      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      echo_to_cockpit( AT_YELLOW , ship , "Rocket launched.");
      sprintf( buf , "Incoming rocket from %s." , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a heavy rocket towards %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        {
	  echo_to_room(AT_ORANGE, ship->in_room, buf);
          echo_to_ship( AT_RED , target , "A large explosion vibrates through the ship." );
        }
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      learn_from_success( ch, gsn_weaponsystems );
      if ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
        ship->missilestate = MISSILE_RELOAD;
      else
        ship->missilestate = MISSILE_FIRED;

      if ( is_autoflying(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }


  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      TURRET_DATA *turret = ship->turret[turret_num];

      if ( ch->in_room->vnum == get_turret_room( turret ) && !str_prefix( argument , "lasers") )
	{
	  if ( is_turret_damaged( turret ) )
	    {
	      send_to_char("&RThe ships turret is damaged.\r\n",ch);
	      return;
	    }

	  if ( is_turret_recharging( turret ) )
	    {
	      send_to_char("&RThe turbolaser is recharging.\r\n",ch);
	      return;
	    }

	  if ( !turret_has_target( turret ) )
	    {
	      send_to_char("&RYou need to choose a target first.\r\n",ch);
	      return;
	    }

	  target = get_turret_target( turret );

	  if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
	    {
	      send_to_char("&RYour target seems to have left.\r\n",ch);
	      clear_turret_target( turret );
	      return;
	    }

	  if (ship->sclass <= SHIP_PLATFORM)
	    {
	      if( ship_distance_to_ship( ship, target ) > 1000 )
		{
		  send_to_char("&RThat ship is out of laser range.\r\n",ch);
		  return;
		}
	    }

	  /* At this point this function just increases turret's weapon_state,
	   * but as we refactor further it will handle the actual firing as well.
	   */
	  fire_turret( turret );

	  the_chance += target->sclass - CAPITAL_SHIP+1;
	  the_chance += ship->currspeed - target->currspeed;
	  the_chance += 100 - target->manuever;
	  the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
	  the_chance -= origthe_chance;
	  the_chance /= 2;
	  the_chance += origthe_chance;
	  the_chance = URANGE( 1 , the_chance , 99 );

	  act( AT_PLAIN, "$n presses the fire button.", ch,
	       NULL, argument , TO_ROOM );

	  if ( number_percent() > the_chance )
	    {
	      sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
	      echo_to_cockpit( AT_ORANGE , target , buf );
	      sprintf( buf , "Turbolasers fire from the ships turret at %s but miss." , target->name);
	      echo_to_cockpit( AT_ORANGE , ship , buf );
	      sprintf( buf, "%s fires at %s but misses." , ship->name, target->name );

	      if(ship->sclass > SHIP_PLATFORM)
		echo_to_room(AT_ORANGE, ship->in_room, buf);
	      else
		echo_to_nearby_ships( AT_ORANGE , ship , buf , target );

	      learn_from_failure( ch, gsn_spacecombat );
	      learn_from_failure( ch, gsn_spacecombat2 );
	      learn_from_failure( ch, gsn_spacecombat3 );
	      return;
	    }

	  sprintf( buf, "Turboasers fire from %s, hitting %s." , ship->name, target->name );

	  if(ship->sclass > SHIP_PLATFORM)
	    echo_to_room(AT_ORANGE, ship->in_room, buf);
	  else
	    echo_to_nearby_ships( AT_ORANGE, ship, buf, target );

	  sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
	  echo_to_cockpit( AT_BLOOD , target , buf );
	  sprintf( buf , "Turbolasers fire from the turret, hitting %s!" , target->name);
	  echo_to_cockpit( AT_YELLOW , ship , buf );
	  learn_from_success( ch, gsn_spacecombat );
	  learn_from_success( ch, gsn_spacecombat2 );
	  learn_from_success( ch, gsn_spacecombat3 );
	  echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

	  if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
	    damage_ship_ch( target, 100, 250, ch);
	  else if ( target->sclass <= MIDSIZE_SHIP )
	    damage_ship_ch( target, 50, 200, ch );
	  else
	    damage_ship_ch( target, 10 , 50, ch );

	  if ( is_autoflying(target) && target->target0 != ship && ship->spaceobject)
	    {
	      target->target0 = ship;
	      sprintf( buf , "You are being targetted by %s.", target->name);
	      echo_to_cockpit( AT_BLOOD , ship , buf );
	    }

	  return;
	}
    }

  send_to_char( "&RYou can't fire that!\r\n" , ch);
}
