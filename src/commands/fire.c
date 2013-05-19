#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"

void do_fire(CHAR_DATA *ch, char *argument )
{
  int the_chance, origthe_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];
  bool turret = FALSE;
  if (  (ship = ship_from_turret(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the gunners chair or turret of a ship to do that!\r\n",ch);
      return;
    }
  if ( ship->gunseat != ch->in_room->vnum )
    turret = TRUE;

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

  if ( is_autoflying(ship) && !turret )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int) ( ch->perm_dex*2 + ch->pcdata->learned[gsn_spacecombat]/3
              + ch->pcdata->learned[gsn_spacecombat2]/3 + ch->pcdata->learned[gsn_spacecombat3]/3 );
  origthe_chance = the_chance;

  if ( ship->sclass > SHIP_PLATFORM && !IS_NPC(ch))
    ((ch->pcdata->learned[gsn_speeders] == 100) ? (the_chance -= 100 - ch->pcdata->learned[gsn_speedercombat]) : (the_chance = 0) );

  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "lasers"))
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

  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "ions") )
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

  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "missile") )
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
  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "torpedo") )
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

  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "rocket") )
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

  if ( ch->in_room->vnum == ship->turret1 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet1 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet1 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is recharging.\r\n",ch);
          return;
        }
      if (ship->target1 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target1;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target1 = NULL;
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

      ship->statet1++;

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
      if ( number_percent( ) > the_chance )
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
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Turbolasers fire from the turret, hitting %s!." , target->name);
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
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->turret2 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet2 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet2 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target2 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target2;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target ) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
	  ship->target2 = NULL;
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

      ship->statet2++;
      the_chance += target->sclass - CAPITAL_SHIP+1;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );

      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          if(ship->sclass > SHIP_PLATFORM)
            echo_to_room(AT_ORANGE, ship->in_room, buf);
          else
            echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
	echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
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
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret3 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet3 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet3 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target3 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target3;
      if (!ship_in_range( ship, target)  )
	{
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target3 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet3++;

      the_chance += target->sclass - CAPITAL_SHIP+1;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!" , target->name);
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

      if ( is_autoflying(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret4 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet4 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet4 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target4 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target4;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target4 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
	{
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet4++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
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

      if ( is_autoflying(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret5 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet5 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet5 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target5 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target5;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target5 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet5++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
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

      if ( is_autoflying(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
	  echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret6 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet6 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet6 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target6 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target6;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target6 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet6++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
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

      if ( is_autoflying(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret7 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet7 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet7 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target7 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target7;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target7 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }

      ship->statet7++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
	  echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
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

      if ( is_autoflying(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret8 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet8 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet8 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target8 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target8;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target8 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet8++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
	  learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
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

      if ( is_autoflying(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret9 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet9 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet9 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target9 == NULL )
        {
	  return;
        }
      target = ship->target9;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target9 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet9++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
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

      if ( is_autoflying(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret0 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet10 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet10 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target10 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target10;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
	  ship->target10 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }

      ship->statet10++;
      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
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

      if ( is_autoflying(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  send_to_char( "&RYou can't fire that!\r\n" , ch);
}
