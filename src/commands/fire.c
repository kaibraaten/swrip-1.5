#include "turret.h"
#include "character.h"
#include "ship.h"
#include "vector3_aux.h"
#include "mud.h"
#include "missile.h"
#include "skill.h"

void do_fire(Character *ch, char *argument )
{
  int the_chance, origthe_chance;
  Ship *ship;
  Ship *target;
  char buf[MAX_STRING_LENGTH];
  bool is_turret = false;
  int turret_num = 0;

  if (  (ship = GetShipFromTurret(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the gunners chair or turret of a ship to do that!\r\n",ch);
      return;
    }
  if ( ship->Rooms.Gunseat != ch->InRoom->Vnum )
    is_turret = true;

  if ( IsShipInHyperspace( ship ) && ship->Class <= SHIP_PLATFORM )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->Spaceobject == NULL && ship->Class <= SHIP_PLATFORM)
    {
      SendToCharacter("&RYou can't do that until after you've finished launching!\r\n",ch);
      return;
    }
  if ( ship->Thrusters.Energy.Current < 5 )
    {
      SendToCharacter("&RTheres not enough energy left to fire!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) && !is_turret )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int) ( ch->Stats.PermDex*2 + ch->PCData->Learned[gsn_spacecombat]/3
              + ch->PCData->Learned[gsn_spacecombat2]/3 + ch->PCData->Learned[gsn_spacecombat3]/3 );
  origthe_chance = the_chance;

  if ( ship->Class > SHIP_PLATFORM && !IsNpc(ch))
    ((ch->PCData->Learned[gsn_speeders] == 100) ? (the_chance -= 100 - ch->PCData->Learned[gsn_speedercombat]) : (the_chance = 0) );

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "lasers"))
    {

      if (ship->WeaponSystems.Laser.State == LASER_DAMAGED)
        {
          SendToCharacter("&RThe ships main laser is damaged.\r\n",ch);
          return;
        }
      
      if (ship->WeaponSystems.Laser.State >= ship->WeaponSystems.Laser.Count )
        {
          SendToCharacter("&RThe lasers are still recharging.\r\n",ch);
          return;
        }

      if (ship->WeaponSystems.Target == NULL )
        {
          SendToCharacter("&RYou need to choose a target first.\r\n",ch);
          return;
        }

      target = ship->WeaponSystems.Target;

      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target ) )
        {
          SendToCharacter("&RYour target seems to have left.\r\n",ch);
          ship->WeaponSystems.Target = NULL;
          return;
        }

      if (ship->Class > SHIP_PLATFORM && ship->WeaponSystems.Target->InRoom != ship->InRoom)
        {
          SendToCharacter("&RYour target seems to have left.\r\n",ch);
          ship->WeaponSystems.Target = NULL;
          return;
        }

      if(ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 1000 )
            {
              SendToCharacter("&RThat ship is out of laser range.\r\n",ch);
              return;
	    }
        }

      if ( ship->Class < CAPITAL_SHIP
           && !IsShipFacingShip( ship, target ) )
        {
          SendToCharacter("&RThe main laser can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      ship->WeaponSystems.Laser.State++;

      the_chance += target->Class - ship->Class;
      the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
      the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
      the_chance -= GetShipDistanceToShip( ship, target ) / ( 10 * ( target->Class + 1 ) );
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = urange( 1 , the_chance , 99 );

      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( GetRandomPercent() > the_chance )
        {
          sprintf( buf , "Lasers fire from %s at you but miss." , ship->Name);
          EchoToCockpit( AT_ORANGE , target , buf );
          sprintf( buf , "The ships lasers fire at %s but miss." , target->Name);
          EchoToCockpit( AT_ORANGE , ship , buf );
          LearnFromFailure( ch, gsn_spacecombat );
          LearnFromFailure( ch, gsn_spacecombat2 );
          LearnFromFailure( ch, gsn_spacecombat3 );
          sprintf( buf, "Laserfire from %s barely misses %s." , ship->Name , target->Name );
          if(ship->Class > SHIP_PLATFORM)
            EchoToRoom(AT_ORANGE, ship->InRoom, buf);
          else
            EchoToNearbyShips( AT_ORANGE , ship , buf , target );
          return;
        }
      sprintf( buf, "Laserfire from %s hits %s." , ship->Name, target->Name );
      if(ship->Class > SHIP_PLATFORM)
        EchoToRoom(AT_ORANGE, ship->InRoom, buf);
      else
        EchoToNearbyShips( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by lasers from %s!" , ship->Name);
      EchoToCockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Your ships lasers hit %s!." , target->Name);
      EchoToCockpit( AT_YELLOW , ship , buf );
      LearnFromSuccess( ch, gsn_spacecombat );
      LearnFromSuccess( ch, gsn_spacecombat2 );
      LearnFromSuccess( ch, gsn_spacecombat3 );
      if (ship->Class > SHIP_PLATFORM )
        LearnFromSuccess( ch, gsn_speedercombat );

      EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
      if( ship->Class == SHIP_PLATFORM )
        DamageShip( target, 100, 250, ch, NULL);
      else if( ship->Class == CAPITAL_SHIP && target->Class < CAPITAL_SHIP )
        DamageShip( target, 50, 200, ch, NULL );
      else
        DamageShip( target, 10 , 50, ch, NULL );

      if ( IsShipAutoflying(target) && target->WeaponSystems.Target != ship && ship->Spaceobject)
        {
          target->WeaponSystems.Target = ship;
          sprintf( buf , "You are being targetted by %s." , target->Name);
          EchoToCockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "ions") )
    {

      if (ship->WeaponSystems.Laser.State == LASER_DAMAGED)
        {
          SendToCharacter("&RThe ships main weapons are damaged.\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.IonCannon.Count <= 0)
        {
          SendToCharacter("&RYou have no ion cannons to fire.\r\n", ch);
          return;
        }
      if (ship->WeaponSystems.IonCannon.State >= ship->WeaponSystems.IonCannon.Count )
        {
          SendToCharacter("&RThe ion cannons are still recharging.\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Target == NULL )
        {
          SendToCharacter("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->WeaponSystems.Target;
      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange(ship, target) )
        {
          SendToCharacter("&RYour target seems to have left.\r\n",ch);
          ship->WeaponSystems.Target = NULL;
          return;
        }
      if (ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 1000 )
            {
              SendToCharacter("&RThat ship is out of ion range.\r\n",ch);
              return;
            }
        }
      if ( ship->Class < CAPITAL_SHIP && !IsShipFacingShip( ship, target ) )
        {
          SendToCharacter("&RThe main ion cannon can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
        }
      ship->WeaponSystems.IonCannon.State++;

      the_chance += target->Class - ship->Class;
      the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
      the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
      the_chance -= GetShipDistanceToShip(ship, target) / (10*(target->Class+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = urange( 1 , the_chance , 99 );

      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( GetRandomPercent() > the_chance )
        {
          sprintf( buf , "Ion cannons fire from %s at you, but the blue plasma narrowly misses." , ship->Name);
          EchoToCockpit( AT_ORANGE , target , buf );
          sprintf( buf , "The ships ion cannons fire at %s but the blue plasma narrowly misses." , target->Name);
          EchoToCockpit( AT_ORANGE , ship , buf );
          LearnFromFailure( ch, gsn_spacecombat );
	  LearnFromFailure( ch, gsn_spacecombat2 );
          LearnFromFailure( ch, gsn_spacecombat3 );
          sprintf( buf, "Blue ion plasma from %s narrowly misses %s." , ship->Name , target->Name );
          if(ship->Class > SHIP_PLATFORM)
            EchoToRoom(AT_ORANGE, ship->InRoom, buf);
          else
            EchoToNearbyShips( AT_ORANGE , ship , buf , target );
          return;
        }
      sprintf( buf, "Blue plasma from %s engulfs %s." , ship->Name, target->Name );
      if(ship->Class > SHIP_PLATFORM)
        EchoToRoom(AT_ORANGE, ship->InRoom, buf);
      else
        EchoToNearbyShips( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are engulfed by ion energy from %s!" , ship->Name);
      EchoToCockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Blue plasma from your ship engulf %s!." , target->Name);
      EchoToCockpit( AT_YELLOW , ship , buf );
      LearnFromSuccess( ch, gsn_spacecombat );
      LearnFromSuccess( ch, gsn_spacecombat2 );
      LearnFromSuccess( ch, gsn_spacecombat3 );
      if (ship->Class > SHIP_PLATFORM )
        LearnFromSuccess( ch, gsn_speedercombat );

      EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
      if( ship->Class == SHIP_PLATFORM )
        DamageShip( target, -200, -50, ch, NULL );
      else if( ship->Class == CAPITAL_SHIP && target->Class <= MIDSIZE_SHIP )
        DamageShip( target, -200, -50, ch, NULL );
      else
        DamageShip( target, -75 , -10, ch, NULL );

      if ( IsShipAutoflying(target) && target->WeaponSystems.Target != ship && ship->Spaceobject)
        {
          target->WeaponSystems.Target = ship;
          sprintf( buf , "You are being targetted by %s." , target->Name);
          EchoToCockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "missile") )
    {
      if (ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
	{
          SendToCharacter("&RThe ships missile launchers are dammaged.\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Tube.Missiles.Current <= 0)
        {
          SendToCharacter("&RYou have no missiles to fire!\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Tube.State != MISSILE_READY )
        {
          SendToCharacter("&RThe missiles are still reloading.\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Target == NULL )
        {
          SendToCharacter("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      
      target = ship->WeaponSystems.Target;

      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target) )
        {
          SendToCharacter("&RYour target seems to have left.\r\n",ch);
          ship->WeaponSystems.Target = NULL;
          return;
        }
      if(ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 1000 )
            {
              SendToCharacter("&RThat ship is out of missile range.\r\n",ch);
              return;
            }
        }
      if ( ship->Class < CAPITAL_SHIP
           && !IsShipFacingShip( ship, target ) )
        {
          SendToCharacter("&RMissiles can only fire in a forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      the_chance += target->Class - ship->Class;
      the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
      the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
      the_chance -= GetShipDistanceToShip(ship, target)/(10*(target->Class+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = urange( 20 , the_chance , 99 );

      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( GetRandomPercent() > the_chance )
        {
          SendToCharacter( "&RYou fail to lock onto your target!", ch );
          ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
          return;
        }

      if(ship->Class <= SHIP_PLATFORM)
        NewMissile( ship , target , ch , CONCUSSION_MISSILE );
      else
        DamageShip(target, 75, 200, ch, NULL );

      ship->WeaponSystems.Tube.Missiles.Current-- ;
      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      EchoToCockpit( AT_YELLOW , ship , "Missiles launched.");
      sprintf( buf , "Incoming missile from %s." , ship->Name);
      if(ship->Class > SHIP_PLATFORM)
        EchoToShip( AT_RED , target , "A large explosion vibrates through the ship." );

      EchoToCockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a missile towards %s." , ship->Name, target->Name );
      if(ship->Class > SHIP_PLATFORM)
        EchoToRoom(AT_ORANGE, ship->InRoom, buf);
      else
        EchoToNearbyShips( AT_ORANGE , ship , buf , target );
      LearnFromSuccess( ch, gsn_weaponsystems );
      if ( ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM )
        ship->WeaponSystems.Tube.State = MISSILE_RELOAD;
      else
        ship->WeaponSystems.Tube.State = MISSILE_FIRED;

      if ( IsShipAutoflying(target) && target->WeaponSystems.Target != ship && ship->Spaceobject)
        {
          target->WeaponSystems.Target = ship;
          sprintf( buf , "You are being targetted by %s." , target->Name);
          EchoToCockpit( AT_BLOOD , ship , buf );
	}

      return;
    }
  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "torpedo") )
    {
      if (ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
        {
          SendToCharacter("&RThe ship's missile launchers are damaged.\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Tube.Torpedoes.Current <= 0)
        {
          SendToCharacter("&RYou have no torpedos to fire!\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Tube.State != MISSILE_READY )
        {
          SendToCharacter("&RThe torpedos are still reloading.\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Target == NULL )
        {
          SendToCharacter("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->WeaponSystems.Target;
      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target) )
        {
          SendToCharacter("&RYour target seems to have left.\r\n",ch);
          ship->WeaponSystems.Target = NULL;
          return;
        }
      if(ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 1000 )
            {
              SendToCharacter("&RThat ship is out of torpedo range.\r\n",ch);
              return;
            }
        }
      if ( ship->Class < CAPITAL_SHIP
           && !IsShipFacingShip( ship, target ) )
        {
          SendToCharacter("&RTorpedos can only fire in a forward direction. You'll need to turn your ship!\r\n",ch);
	  return;
        }

      the_chance += target->Class - ship->Class;
      the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
      the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
      the_chance -= GetShipDistanceToShip( ship, target ) / (10*(target->Class+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = urange( 20 , the_chance , 99 );

      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( GetRandomPercent() > the_chance )
        {
          SendToCharacter( "&RYou fail to lock onto your target!", ch );
          ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
          return;
        }
      if( ship->Class <= SHIP_PLATFORM)
        NewMissile( ship , target , ch , PROTON_TORPEDO );
      else
        DamageShip( target, 200, 300, ch, NULL);
      ship->WeaponSystems.Tube.Torpedoes.Current-- ;
      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      EchoToCockpit( AT_YELLOW , ship , "Missiles launched.");
      sprintf( buf , "Incoming torpedo from %s." , ship->Name);
      EchoToCockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a torpedo towards %s." , ship->Name, target->Name );
      if(ship->Class > SHIP_PLATFORM)
        {
          EchoToRoom(AT_ORANGE, ship->InRoom, buf);
          EchoToShip( AT_RED , target , "A large explosion vibrates through the ship." );
        }
      else
        EchoToNearbyShips( AT_ORANGE , ship , buf , target );
      LearnFromSuccess( ch, gsn_weaponsystems );
      if ( ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM )
        ship->WeaponSystems.Tube.State = MISSILE_RELOAD;
      else
	ship->WeaponSystems.Tube.State = MISSILE_FIRED;

      if ( IsShipAutoflying(target) && target->WeaponSystems.Target != ship && ship->Spaceobject)
        {
          target->WeaponSystems.Target = ship;
          sprintf( buf , "You are being targetted by %s." , target->Name);
          EchoToCockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "rocket") )
    {
      if (ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
        {
          SendToCharacter("&RThe ships missile launchers are damaged.\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Tube.Rockets.Current <= 0)
        {
          SendToCharacter("&RYou have no rockets to fire!\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Tube.State != MISSILE_READY )
        {
          SendToCharacter("&RThe missiles are still reloading.\r\n",ch);
          return;
        }
      if (ship->WeaponSystems.Target == NULL )
        {
          SendToCharacter("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->WeaponSystems.Target;
      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target) )
        {
          SendToCharacter("&RYour target seems to have left.\r\n",ch);
          ship->WeaponSystems.Target = NULL;
          return;
        }
      if (ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 800 )
            {
	      SendToCharacter("&RThat ship is out of rocket range.\r\n",ch);
              return;
            }
        }
      if ( ship->Class < CAPITAL_SHIP
           && !IsShipFacingShip( ship, target ) )
        {
          SendToCharacter("&RRockets can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      the_chance += target->Class - ship->Class;
      the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
      the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
      the_chance -= GetShipDistanceToShip(ship, target) / (10*(target->Class+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = urange( 20 , the_chance , 99 );

      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( GetRandomPercent() > the_chance )
        {
          SendToCharacter( "&RYou fail to lock onto your target!", ch );
          ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
          return;
        }
      if( ship->Class <= SHIP_PLATFORM)
        NewMissile( ship , target , ch , HEAVY_ROCKET );
      else
        DamageShip( target, 450, 550, ch, NULL );

      ship->WeaponSystems.Tube.Rockets.Current-- ;
      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      EchoToCockpit( AT_YELLOW , ship , "Rocket launched.");
      sprintf( buf , "Incoming rocket from %s." , ship->Name);
      EchoToCockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a heavy rocket towards %s." , ship->Name, target->Name );
      if(ship->Class > SHIP_PLATFORM)
        {
	  EchoToRoom(AT_ORANGE, ship->InRoom, buf);
          EchoToShip( AT_RED , target , "A large explosion vibrates through the ship." );
        }
      else
        EchoToNearbyShips( AT_ORANGE , ship , buf , target );
      LearnFromSuccess( ch, gsn_weaponsystems );
      if ( ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM )
        ship->WeaponSystems.Tube.State = MISSILE_RELOAD;
      else
        ship->WeaponSystems.Tube.State = MISSILE_FIRED;

      if ( IsShipAutoflying(target) && target->WeaponSystems.Target != ship && ship->Spaceobject)
        {
          target->WeaponSystems.Target = ship;
          sprintf( buf , "You are being targetted by %s." , target->Name);
          EchoToCockpit( AT_BLOOD , ship , buf );
        }

      return;
    }


  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      Turret *turret = ship->WeaponSystems.Turret[turret_num];

      if ( ch->InRoom->Vnum == GetTurretRoom( turret ) && !StringPrefix( argument , "lasers") )
	{
	  if ( IsTurretDamaged( turret ) )
	    {
	      SendToCharacter("&RThe ships turret is damaged.\r\n",ch);
	      return;
	    }

	  if ( IsTurretRecharging( turret ) )
	    {
	      SendToCharacter("&RThe turbolaser is recharging.\r\n",ch);
	      return;
	    }

	  if ( !TurretHasTarget( turret ) )
	    {
	      SendToCharacter("&RYou need to choose a target first.\r\n",ch);
	      return;
	    }

	  target = GetTurretTarget( turret );

	  if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target) )
	    {
	      SendToCharacter("&RYour target seems to have left.\r\n",ch);
	      ClearTurretTarget( turret );
	      return;
	    }

	  if (ship->Class <= SHIP_PLATFORM)
	    {
	      if( GetShipDistanceToShip( ship, target ) > 1000 )
		{
		  SendToCharacter("&RThat ship is out of laser range.\r\n",ch);
		  return;
		}
	    }

	  /* At this point this function just increases turret's weapon_state,
	   * but as we refactor further it will handle the actual firing as well.
	   */
	  FireTurret( turret );

	  the_chance += target->Class - CAPITAL_SHIP+1;
	  the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
	  the_chance += 100 - target->Thrusters.Maneuver;
	  the_chance -= GetShipDistanceToShip( ship, target ) / (10*(target->Class+1));
	  the_chance -= origthe_chance;
	  the_chance /= 2;
	  the_chance += origthe_chance;
	  the_chance = urange( 1 , the_chance , 99 );

	  Act( AT_PLAIN, "$n presses the fire button.", ch,
	       NULL, argument , TO_ROOM );

	  if ( GetRandomPercent() > the_chance )
	    {
	      sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->Name);
	      EchoToCockpit( AT_ORANGE , target , buf );
	      sprintf( buf , "Turbolasers fire from the ships turret at %s but miss." , target->Name);
	      EchoToCockpit( AT_ORANGE , ship , buf );
	      sprintf( buf, "%s fires at %s but misses." , ship->Name, target->Name );

	      if(ship->Class > SHIP_PLATFORM)
		EchoToRoom(AT_ORANGE, ship->InRoom, buf);
	      else
		EchoToNearbyShips( AT_ORANGE , ship , buf , target );

	      LearnFromFailure( ch, gsn_spacecombat );
	      LearnFromFailure( ch, gsn_spacecombat2 );
	      LearnFromFailure( ch, gsn_spacecombat3 );
	      return;
	    }

	  sprintf( buf, "Turboasers fire from %s, hitting %s." , ship->Name, target->Name );

	  if(ship->Class > SHIP_PLATFORM)
	    EchoToRoom(AT_ORANGE, ship->InRoom, buf);
	  else
	    EchoToNearbyShips( AT_ORANGE, ship, buf, target );

	  sprintf( buf , "You are hit by turbolasers from %s!" , ship->Name);
	  EchoToCockpit( AT_BLOOD , target , buf );
	  sprintf( buf , "Turbolasers fire from the turret, hitting %s!" , target->Name);
	  EchoToCockpit( AT_YELLOW , ship , buf );
	  LearnFromSuccess( ch, gsn_spacecombat );
	  LearnFromSuccess( ch, gsn_spacecombat2 );
	  LearnFromSuccess( ch, gsn_spacecombat3 );
	  EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );

	  if( ship->Class == SHIP_PLATFORM && target->Class <= MIDSIZE_SHIP )
	    DamageShip( target, 100, 250, ch, NULL);
	  else if ( target->Class <= MIDSIZE_SHIP )
	    DamageShip( target, 50, 200, ch, NULL );
	  else
	    DamageShip( target, 10 , 50, ch, NULL );

	  if ( IsShipAutoflying(target) && target->WeaponSystems.Target != ship && ship->Spaceobject)
	    {
	      target->WeaponSystems.Target = ship;
	      sprintf( buf , "You are being targetted by %s.", target->Name);
	      EchoToCockpit( AT_BLOOD , ship , buf );
	    }

	  return;
	}
    }

  SendToCharacter( "&RYou can't fire that!\r\n" , ch);
}
