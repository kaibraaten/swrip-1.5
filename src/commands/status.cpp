#include "character.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "turret.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_status(Character *ch, char *argument )
{
  int the_chance = 0;
  Ship *ship = NULL;
  Ship *target = NULL;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    target = ship;
  else
    target = GetShipInRange( argument , ship );

  if ( target == NULL )
    {
      ch->Echo("&RI don't see that here.\r\nTry the radar, or type status by itself for your ships status.\r\n");
      return;
    }

  if( GetShipDistanceToShip( ship, target ) > 500+ship->Instruments.Sensor * 2 )
    {
      ch->Echo("&RThat ship is to far away to scan.\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_shipsystems]) ;
  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("&RYou cant figure out what the readout means.\r\n");
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  Act( AT_PLAIN, "$n checks various gages and displays on the control panel.", ch,
       NULL, argument , TO_ROOM );

  ch->Echo("&W%s:\r\n",target->Name);
  ch->Echo("&OCurrent Coordinates:&Y %.0f %.0f %.0f\r\n",
             target->Position.x, target->Position.y, target->Position.z );
  ch->Echo("&OCurrent Heading:&Y %.0f %.0f %.0f\r\n",
             target->Heading.x, target->Heading.y, target->Heading.z );
  ch->Echo("&OCurrent Speed:&Y %d&O/%d\r\n",
	target->Thrusters.Speed.Current, target->Thrusters.Speed.Max );
  ch->Echo("&OHull:&Y %d&O/%d  Ship Condition:&Y %s\r\n",
             target->Defenses.Hull.Current,
             target->Defenses.Hull.Max,
             IsShipDisabled( target ) ? "Disabled" : "Running");
  ch->Echo("&OShields:&Y %d&O/%d   Energy(fuel):&Y %d&O/%d\r\n",
	target->Defenses.Shield.Current,
	target->Defenses.Shield.Max,
	target->Thrusters.Energy.Current,
	target->Thrusters.Energy.Max );
  ch->Echo("&OLaser Condition:&Y %s  &OCurrent Target:&Y %s\r\n",
	target->WeaponSystems.Laser.State == LASER_DAMAGED ? "Damaged" : "Good",
	target->WeaponSystems.Target ? target->WeaponSystems.Target->Name : "none");

  for( size_t turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      static const char * const literal_number[MAX_NUMBER_OF_TURRETS_IN_SHIP] =
	{ "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" };
      const Turret *turret = target->WeaponSystems.Turrets[turret_num];
      const Ship *turret_target = TurretHasTarget( turret ) ? GetTurretTarget( turret ) : NULL;
      const char *turret_target_name = turret_target ? turret_target->Name : "none";
      const char *turret_status = IsTurretDamaged( turret ) ? "Damaged" : "Good";

      if( IsTurretInstalled( turret ) )
	{
   ch->Echo("&OTurret %s:  &Y %s  &OCurrent Target:&Y %s\r\n",
		     literal_number[turret_num], turret_status, turret_target_name );
	}
    }

  ch->Echo("&OSensors:    &Y%d   &OTractor Beam:   &Y%d\r\n",
	target->Instruments.Sensor, target->WeaponSystems.TractorBeam.Strength );
  ch->Echo("&OAstroArray: &Y%d   &OComm:           &Y%d\r\n",
	target->Instruments.AstroArray, target->Instruments.Comm);
  ch->Echo("\r\n&OMissiles:&Y %d/%d&O  Torpedos: &Y%d/%d&O\r\nRockets:  &Y%d/%d&O  Chaff:    &Y%d/%d&O  \r\nMissile Tube Condition:&Y %s&w\r\n",
	target->WeaponSystems.Tube.Missiles.Current,
	target->WeaponSystems.Tube.Missiles.Max,
	target->WeaponSystems.Tube.Torpedoes.Current,
	target->WeaponSystems.Tube.Torpedoes.Max,
	target->WeaponSystems.Tube.Rockets.Current,
	target->WeaponSystems.Tube.Rockets.Max,
	target->Defenses.Chaff.Current,
	target->Defenses.Chaff.Max,
	target->WeaponSystems.Tube.State == MISSILE_DAMAGED ? "Damaged" : "Good");

  LearnFromSuccess( ch, gsn_shipsystems );
}

