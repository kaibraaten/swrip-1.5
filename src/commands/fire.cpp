#include <utility/random.hpp>
#include "turret.hpp"
#include "character.hpp"
#include "ship.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "missile.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_fire(Character *ch, std::string argument )
{
  int the_chance = 0, origthe_chance = 0;
  Ship *ship = NULL;
  Ship *target = NULL;
  char buf[MAX_STRING_LENGTH];
  bool is_turret = false;

  if ( (ship = GetShipFromTurret(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the gunners chair or turret of a ship to do that!\r\n");
      return;
    }

  if ( ship->Rooms.Gunseat != ch->InRoom->Vnum )
    is_turret = true;

  if ( IsShipInHyperspace( ship ) && ship->Class <= SHIP_PLATFORM )
    {
      ch->Echo("&RYou can only do that in realspace!\r\n");
      return;
    }

  if (ship->Spaceobject == NULL && ship->Class <= SHIP_PLATFORM)
    {
      ch->Echo("&RYou can't do that until after you've finished launching!\r\n");
      return;
    }

  if ( ship->Thrusters.Energy.Current < 5 )
    {
      ch->Echo("&RThere's not enough energy left to fire!\r\n");
      return;
    }

  if ( IsShipAutoflying(ship) && !is_turret )
    {
      ch->Echo("&RYou'll have to turn off the ship's autopilot first.\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int) ( ch->PermStats.Dex*2 + ch->PCData->Learned[gsn_spacecombat]/3
              + ch->PCData->Learned[gsn_spacecombat2]/3 + ch->PCData->Learned[gsn_spacecombat3]/3 );
  origthe_chance = the_chance;

  if ( ship->Class > SHIP_PLATFORM && !IsNpc(ch))
    ((ch->PCData->Learned[gsn_speeders] == 100) ? (the_chance -= 100 - ch->PCData->Learned[gsn_speedercombat]) : (the_chance = 0) );

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "lasers"))
    {

      if (ship->WeaponSystems.Laser.State == LASER_DAMAGED)
        {
          ch->Echo("&RThe ship's main laser is damaged.\r\n");
          return;
        }
      
      if (ship->WeaponSystems.Laser.State >= ship->WeaponSystems.Laser.Count )
        {
          ch->Echo("&RThe lasers are still recharging.\r\n");
          return;
        }

      if (ship->WeaponSystems.Target == NULL )
        {
          ch->Echo("&RYou need to choose a target first.\r\n");
          return;
        }

      target = ship->WeaponSystems.Target;

      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target ) )
        {
          ch->Echo("&RYour target seems to have left.\r\n");
          ship->WeaponSystems.Target = NULL;
          return;
        }

      if (ship->Class > SHIP_PLATFORM && ship->WeaponSystems.Target->InRoom != ship->InRoom)
        {
          ch->Echo("&RYour target seems to have left.\r\n");
          ship->WeaponSystems.Target = NULL;
          return;
        }

      if(ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 1000 )
            {
              ch->Echo("&RThat ship is out of laser range.\r\n");
              return;
	    }
        }

      if ( ship->Class < CAPITAL_SHIP
           && !IsShipFacingShip( ship, target ) )
        {
          ch->Echo("&RThe main laser can only fire forward. You'll need to turn your ship!\r\n");
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
           NULL, argument.c_str(), TO_ROOM );

      if ( GetRandomPercent() > the_chance )
        {
          sprintf( buf , "Lasers fire from %s at you but miss." , ship->Name.c_str());
          EchoToCockpit( AT_ORANGE , target , buf );
          sprintf( buf , "The ship's lasers fire at %s but miss." , target->Name.c_str());
          EchoToCockpit( AT_ORANGE , ship , buf );
          LearnFromFailure( ch, gsn_spacecombat );
          LearnFromFailure( ch, gsn_spacecombat2 );
          LearnFromFailure( ch, gsn_spacecombat3 );
          sprintf( buf, "Laserfire from %s barely misses %s.",
                   ship->Name.c_str(), target->Name.c_str() );

          if(ship->Class > SHIP_PLATFORM)
            EchoToRoom(AT_ORANGE, ship->InRoom, buf);
          else
            EchoToNearbyShips( AT_ORANGE , ship , buf , target );

          return;
        }
      
      sprintf( buf, "Laserfire from %s hits %s.", ship->Name.c_str(), target->Name.c_str() );

      if(ship->Class > SHIP_PLATFORM)
        EchoToRoom(AT_ORANGE, ship->InRoom, buf);
      else
        EchoToNearbyShips( AT_ORANGE, ship, buf, target );

      sprintf( buf , "You are hit by lasers from %s!", ship->Name.c_str());
      EchoToCockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Your ship's lasers hit %s!.", target->Name.c_str());
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
          sprintf( buf , "You are being targetted by %s." , target->Name.c_str());
          EchoToCockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "ions") )
    {

      if (ship->WeaponSystems.Laser.State == LASER_DAMAGED)
        {
          ch->Echo("&RThe ship's main weapons are damaged.\r\n");
          return;
        }

      if (ship->WeaponSystems.IonCannon.Count <= 0)
        {
          ch->Echo("&RYou have no ion cannons to fire.\r\n");
          return;
        }

      if (ship->WeaponSystems.IonCannon.State >= ship->WeaponSystems.IonCannon.Count )
        {
          ch->Echo("&RThe ion cannons are still recharging.\r\n");
          return;
        }

      if (ship->WeaponSystems.Target == NULL )
        {
          ch->Echo("&RYou need to choose a target first.\r\n");
          return;
        }

      target = ship->WeaponSystems.Target;

      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange(ship, target) )
        {
          ch->Echo("&RYour target seems to have left.\r\n");
          ship->WeaponSystems.Target = NULL;
          return;
        }

      if (ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 1000 )
            {
              ch->Echo("&RThat ship is out of ion range.\r\n");
              return;
            }
        }

      if ( ship->Class < CAPITAL_SHIP && !IsShipFacingShip( ship, target ) )
        {
          ch->Echo("&RThe main ion cannon can only fire forward. You'll need to turn your ship!\r\n");
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
           NULL, argument.c_str(), TO_ROOM );

      if ( GetRandomPercent() > the_chance )
        {
          sprintf( buf, "Ion cannons fire from %s at you, but the blue plasma narrowly misses.",
                   ship->Name.c_str());
          EchoToCockpit( AT_ORANGE , target , buf );
          sprintf( buf, "The ship's ion cannons fire at %s, but the blue plasma narrowly misses.",
                   target->Name.c_str());
          EchoToCockpit( AT_ORANGE , ship , buf );
          LearnFromFailure( ch, gsn_spacecombat );
	  LearnFromFailure( ch, gsn_spacecombat2 );
          LearnFromFailure( ch, gsn_spacecombat3 );
          sprintf( buf, "Blue ion plasma from %s narrowly misses %s.",
                   ship->Name.c_str(), target->Name.c_str() );

          if(ship->Class > SHIP_PLATFORM)
            EchoToRoom(AT_ORANGE, ship->InRoom, buf);
          else
            EchoToNearbyShips( AT_ORANGE , ship , buf , target );

          return;
        }
      
      sprintf( buf, "Blue plasma from %s engulfs %s.",
               ship->Name.c_str(), target->Name.c_str() );

      if(ship->Class > SHIP_PLATFORM)
        EchoToRoom(AT_ORANGE, ship->InRoom, buf);
      else
        EchoToNearbyShips( AT_ORANGE , ship , buf , target );

      sprintf( buf, "You are engulfed by ion energy from %s!",
               ship->Name.c_str());
      EchoToCockpit( AT_BLOOD, target, buf );
      sprintf( buf, "Blue plasma from your ship engulf %s!",
               target->Name.c_str());
      EchoToCockpit( AT_YELLOW , ship , buf );
      LearnFromSuccess( ch, gsn_spacecombat );
      LearnFromSuccess( ch, gsn_spacecombat2 );
      LearnFromSuccess( ch, gsn_spacecombat3 );

      if (ship->Class > SHIP_PLATFORM )
        LearnFromSuccess( ch, gsn_speedercombat );

      EchoToShip( AT_RED, target, "A small explosion vibrates through the ship." );

      if( ship->Class == SHIP_PLATFORM )
        DamageShip( target, -200, -50, ch, NULL );
      else if( ship->Class == CAPITAL_SHIP && target->Class <= MIDSIZE_SHIP )
        DamageShip( target, -200, -50, ch, NULL );
      else
        DamageShip( target, -75 , -10, ch, NULL );

      if ( IsShipAutoflying(target) && target->WeaponSystems.Target != ship && ship->Spaceobject)
        {
          target->WeaponSystems.Target = ship;
          sprintf( buf, "You are being targetted by %s.",
                   target->Name.c_str());
          EchoToCockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "missile") )
    {
      if (ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
	{
          ch->Echo("&RThe ship's missile launchers are damaged.\r\n");
          return;
        }

      if (ship->WeaponSystems.Tube.Missiles.Current <= 0)
        {
          ch->Echo("&RYou have no missiles to fire!\r\n");
          return;
        }

      if (ship->WeaponSystems.Tube.State != MISSILE_READY )
        {
          ch->Echo("&RThe missiles are still reloading.\r\n");
          return;
        }

      if (ship->WeaponSystems.Target == NULL )
        {
          ch->Echo("&RYou need to choose a target first.\r\n");
          return;
        }
      
      target = ship->WeaponSystems.Target;

      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target) )
        {
          ch->Echo("&RYour target seems to have left.\r\n");
          ship->WeaponSystems.Target = NULL;
          return;
        }

      if(ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 1000 )
            {
              ch->Echo("&RThat ship is out of missile range.\r\n");
              return;
            }
        }

      if ( ship->Class < CAPITAL_SHIP
           && !IsShipFacingShip( ship, target ) )
        {
          ch->Echo("&RMissiles can only fire in a forward direction. You'll need to turn your ship!\r\n");
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
           NULL, argument.c_str(), TO_ROOM );

      if ( GetRandomPercent() > the_chance )
        {
          ch->Echo( "&RYou fail to lock onto your target!" );
          ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
          return;
        }

      if(ship->Class <= SHIP_PLATFORM)
        NewMissile( ship , target , ch , CONCUSSION_MISSILE );
      else
        DamageShip(target, 75, 200, ch, NULL );

      ship->WeaponSystems.Tube.Missiles.Current-- ;
      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument.c_str(), TO_ROOM );
      EchoToCockpit( AT_YELLOW, ship, "Missiles launched.");
      sprintf( buf , "Incoming missile from %s.", ship->Name.c_str());

      if(ship->Class > SHIP_PLATFORM)
        EchoToShip( AT_RED , target , "A large explosion vibrates through the ship." );

      EchoToCockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a missile towards %s.",
               ship->Name.c_str(), target->Name.c_str() );

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
          sprintf( buf , "You are being targetted by %s." , target->Name.c_str());
          EchoToCockpit( AT_BLOOD , ship , buf );
	}

      return;
    }

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "torpedo") )
    {
      if (ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
        {
          ch->Echo("&RThe ship's missile launchers are damaged.\r\n");
          return;
        }

      if (ship->WeaponSystems.Tube.Torpedoes.Current <= 0)
        {
          ch->Echo("&RYou have no torpedoes to fire!\r\n");
          return;
        }

      if (ship->WeaponSystems.Tube.State != MISSILE_READY )
        {
          ch->Echo("&RThe torpedoes are still reloading.\r\n");
          return;
        }

      if (ship->WeaponSystems.Target == NULL )
        {
          ch->Echo("&RYou need to choose a target first.\r\n");
          return;
        }

      target = ship->WeaponSystems.Target;

      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target) )
        {
          ch->Echo("&RYour target seems to have left.\r\n");
          ship->WeaponSystems.Target = NULL;
          return;
        }

      if(ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 1000 )
            {
              ch->Echo("&RThat ship is out of torpedo range.\r\n");
              return;
            }
        }

      if ( ship->Class < CAPITAL_SHIP
           && !IsShipFacingShip( ship, target ) )
        {
          ch->Echo("&RTorpedoes can only fire in a forward direction. You'll need to turn your ship!\r\n");
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
           NULL, argument.c_str(), TO_ROOM );

      if ( GetRandomPercent() > the_chance )
        {
          ch->Echo( "&RYou fail to lock onto your target!" );
          ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
          return;
        }

      if( ship->Class <= SHIP_PLATFORM)
        NewMissile( ship, target, ch, PROTON_TORPEDO );
      else
        DamageShip( target, 200, 300, ch, NULL);

      ship->WeaponSystems.Tube.Torpedoes.Current-- ;
      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument.c_str(), TO_ROOM );
      EchoToCockpit( AT_YELLOW , ship , "Torpedoes launched.");
      sprintf( buf , "Incoming torpedo from %s." , ship->Name.c_str());
      EchoToCockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a torpedo towards %s.",
               ship->Name.c_str(), target->Name.c_str() );
      
      if(ship->Class > SHIP_PLATFORM)
        {
          EchoToRoom(AT_ORANGE, ship->InRoom, buf);
          EchoToShip( AT_RED , target , "A large explosion vibrates through the ship." );
        }
      else
        {
          EchoToNearbyShips( AT_ORANGE , ship , buf , target );
        }
      
      LearnFromSuccess( ch, gsn_weaponsystems );

      if ( ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM )
        ship->WeaponSystems.Tube.State = MISSILE_RELOAD;
      else
	ship->WeaponSystems.Tube.State = MISSILE_FIRED;

      if ( IsShipAutoflying(target)
           && target->WeaponSystems.Target != ship
           && ship->Spaceobject)
        {
          target->WeaponSystems.Target = ship;
          sprintf( buf , "You are being targetted by %s." , target->Name.c_str());
          EchoToCockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat && !StringPrefix( argument , "rocket") )
    {
      if (ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
        {
          ch->Echo("&RThe ship's missile launchers are damaged.\r\n");
          return;
        }

      if (ship->WeaponSystems.Tube.Rockets.Current <= 0)
        {
          ch->Echo("&RYou have no rockets to fire!\r\n");
          return;
        }

      if (ship->WeaponSystems.Tube.State != MISSILE_READY )
        {
          ch->Echo("&RThe missiles are still reloading.\r\n");
          return;
        }

      if (ship->WeaponSystems.Target == NULL )
        {
          ch->Echo("&RYou need to choose a target first.\r\n");
          return;
        }

      target = ship->WeaponSystems.Target;

      if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target) )
        {
          ch->Echo("&RYour target seems to have left.\r\n");
          ship->WeaponSystems.Target = NULL;
          return;
        }

      if (ship->Class <= SHIP_PLATFORM)
        {
          if( GetShipDistanceToShip( ship, target ) > 800 )
            {
	      ch->Echo("&RThat ship is out of rocket range.\r\n");
              return;
            }
        }

      if ( ship->Class < CAPITAL_SHIP
           && !IsShipFacingShip( ship, target ) )
        {
          ch->Echo("&RRockets can only fire forward. You'll need to turn your ship!\r\n");
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
           NULL, argument.c_str(), TO_ROOM );

      if ( GetRandomPercent() > the_chance )
        {
          ch->Echo( "&RYou fail to lock onto your target!" );
          ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
          return;
        }
      
      if( ship->Class <= SHIP_PLATFORM)
        NewMissile( ship , target , ch , HEAVY_ROCKET );
      else
        DamageShip( target, 450, 550, ch, NULL );

      ship->WeaponSystems.Tube.Rockets.Current-- ;
      Act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument.c_str(), TO_ROOM );
      EchoToCockpit( AT_YELLOW , ship , "Rocket launched.");
      sprintf( buf , "Incoming rocket from %s.", ship->Name.c_str());
      EchoToCockpit( AT_BLOOD, target, buf );
      sprintf( buf, "%s fires a heavy rocket towards %s.",
               ship->Name.c_str(), target->Name.c_str() );

      if(ship->Class > SHIP_PLATFORM)
        {
	  EchoToRoom(AT_ORANGE, ship->InRoom, buf);
          EchoToShip( AT_RED , target , "A large explosion vibrates through the ship." );
        }
      else
        {
          EchoToNearbyShips( AT_ORANGE , ship , buf , target );
        }
      
      LearnFromSuccess( ch, gsn_weaponsystems );

      if ( ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM )
        ship->WeaponSystems.Tube.State = MISSILE_RELOAD;
      else
        ship->WeaponSystems.Tube.State = MISSILE_FIRED;

      if ( IsShipAutoflying(target) && target->WeaponSystems.Target != ship && ship->Spaceobject)
        {
          target->WeaponSystems.Target = ship;
          sprintf( buf , "You are being targetted by %s." , target->Name.c_str());
          EchoToCockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  for(Turret *turret : ship->WeaponSystems.Turrets)
    {
      if ( ch->InRoom->Vnum == GetTurretRoom( turret ) && !StringPrefix( argument , "lasers") )
	{
	  if ( IsTurretDamaged( turret ) )
	    {
	      ch->Echo("&RThe ship's turret is damaged.\r\n");
	      return;
	    }

	  if ( IsTurretRecharging( turret ) )
	    {
	      ch->Echo("&RThe turbolaser is recharging.\r\n");
	      return;
	    }

	  if ( !TurretHasTarget( turret ) )
	    {
	      ch->Echo("&RYou need to choose a target first.\r\n");
	      return;
	    }

	  target = GetTurretTarget( turret );

	  if (ship->Class <= SHIP_PLATFORM && !IsShipInCombatRange( ship, target) )
	    {
	      ch->Echo("&RYour target seems to have left.\r\n");
	      ClearTurretTarget( turret );
	      return;
	    }

	  if (ship->Class <= SHIP_PLATFORM)
	    {
	      if( GetShipDistanceToShip( ship, target ) > 1000 )
		{
		  ch->Echo("&RThat ship is out of laser range.\r\n");
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
	       NULL, argument.c_str(), TO_ROOM );

	  if ( GetRandomPercent() > the_chance )
	    {
	      sprintf( buf, "Turbolasers fire from %s at you but miss.",
                       ship->Name.c_str());
	      EchoToCockpit( AT_ORANGE , target , buf );
	      sprintf( buf, "Turbolasers fire from the ship's turret at %s but miss.",
                       target->Name.c_str());
	      EchoToCockpit( AT_ORANGE , ship , buf );
	      sprintf( buf, "%s fires at %s but misses.",
                       ship->Name.c_str(), target->Name.c_str() );

	      if(ship->Class > SHIP_PLATFORM)
		EchoToRoom(AT_ORANGE, ship->InRoom, buf);
	      else
		EchoToNearbyShips( AT_ORANGE , ship , buf , target );

	      LearnFromFailure( ch, gsn_spacecombat );
	      LearnFromFailure( ch, gsn_spacecombat2 );
	      LearnFromFailure( ch, gsn_spacecombat3 );
	      return;
	    }

	  sprintf( buf, "Turbolasers fire from %s, hitting %s.",
                   ship->Name.c_str(), target->Name.c_str() );

	  if(ship->Class > SHIP_PLATFORM)
	    EchoToRoom(AT_ORANGE, ship->InRoom, buf);
	  else
	    EchoToNearbyShips( AT_ORANGE, ship, buf, target );

	  sprintf( buf , "You are hit by turbolasers from %s!",
                   ship->Name.c_str());
	  EchoToCockpit( AT_BLOOD , target , buf );
	  sprintf( buf , "Turbolasers fire from the turret, hitting %s!",
                   target->Name.c_str());
	  EchoToCockpit( AT_YELLOW, ship, buf );
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
	      sprintf( buf , "You are being targetted by %s.", target->Name.c_str());
	      EchoToCockpit( AT_BLOOD , ship , buf );
	    }

	  return;
	}
    }

  ch->Echo( "&RYou can't fire that!\r\n" );
}
