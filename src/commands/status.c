#include "character.h"
#include "vector3_aux.h"
#include "mud.h"
#include "ship.h"
#include "turret.h"
#include "skill.h"

void do_status(Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;
  Ship *target;
  size_t turret_num = 0;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n",ch);
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    target = ship;
  else
    target = GetShipInRange( argument , ship );

  if ( target == NULL )
    {
      SendToCharacter("&RI don't see that here.\r\nTry the radar, or type status by itself for your ships status.\r\n",ch);
      return;
    }

  if( GetShipDistanceToShip( ship, target ) > 500+ship->Instruments.Sensor * 2 )
    {
      SendToCharacter("&RThat ship is to far away to scan.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_shipsystems]) ;
  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou cant figure out what the readout means.\r\n",ch);
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  Act( AT_PLAIN, "$n checks various gages and displays on the control panel.", ch,
       NULL, argument , TO_ROOM );

  Echo( ch, "&W%s:\r\n",target->Name);
  Echo( ch, "&OCurrent Coordinates:&Y %.0f %.0f %.0f\r\n",
             target->Position.x, target->Position.y, target->Position.z );
  Echo( ch, "&OCurrent Heading:&Y %.0f %.0f %.0f\r\n",
             target->Heading.x, target->Heading.y, target->Heading.z );
  Echo( ch, "&OCurrent Speed:&Y %d&O/%d\r\n",
	target->Thrusters.Speed.Current, target->Thrusters.Speed.Max );
  Echo( ch, "&OHull:&Y %d&O/%d  Ship Condition:&Y %s\r\n",
             target->Defenses.Hull.Current,
             target->Defenses.Hull.Max,
             IsShipDisabled( target ) ? "Disabled" : "Running");
  Echo( ch, "&OShields:&Y %d&O/%d   Energy(fuel):&Y %d&O/%d\r\n",
	target->Defenses.Shield.Current,
	target->Defenses.Shield.Max,
	target->Thrusters.Energy.Current,
	target->Thrusters.Energy.Max );
  Echo( ch, "&OLaser Condition:&Y %s  &OCurrent Target:&Y %s\r\n",
	target->WeaponSystems.Laser.State == LASER_DAMAGED ? "Damaged" : "Good",
	target->WeaponSystems.Target ? target->WeaponSystems.Target->Name : "none");

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      static const char * const literal_number[MAX_NUMBER_OF_TURRETS_IN_SHIP] =
	{ "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" };
      const Turret *turret = target->WeaponSystems.Turret[turret_num];
      const Ship *turret_target = TurretHasTarget( turret ) ? GetTurretTarget( turret ) : NULL;
      const char *turret_target_name = turret_target ? turret_target->Name : "none";
      const char *turret_status = IsTurretDamaged( turret ) ? "Damaged" : "Good";

      if( IsTurretInstalled( turret ) )
	{
	  Echo( ch, "&OTurret %s:  &Y %s  &OCurrent Target:&Y %s\r\n",
		     literal_number[turret_num], turret_status, turret_target_name );
	}
    }

  Echo( ch, "&OSensors:    &Y%d   &OTractor Beam:   &Y%d\r\n",
	target->Instruments.Sensor, target->WeaponSystems.TractorBeam.Strength );
  Echo( ch, "&OAstroArray: &Y%d   &OComm:           &Y%d\r\n",
	target->Instruments.AstroArray, target->Instruments.Comm);
  Echo( ch, "\r\n&OMissiles:&Y %d/%d&O  Torpedos: &Y%d/%d&O\r\nRockets:  &Y%d/%d&O  Chaff:    &Y%d/%d&O  \r\nMissile Tube Condition:&Y %s&w\r\n",
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
