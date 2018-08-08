#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "turret.hpp"
#include "spaceobject.hpp"

void do_showship( Character *ch, char *argument )
{
  Ship *ship = NULL;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: showship <ship>\r\n");
      return;
    }

  ship = GetShipAnywhere( argument );

  if ( !ship )
    {
      ch->Echo("No such ship.\r\n");
      return;
    }

  SetCharacterColor( AT_YELLOW, ch );
  ch->Echo("%s %s : %s (%s)\r\n",
	ShipTypes[ship->Type], ShipClasses[ship->Class],
	ship->Name,
	ship->PersonalName );
  ch->Echo("Home: %s   Description: %s\r\nOwner: %s   Pilot: %s   Copilot: %s\r\n",
             ship->Home,  ship->Description,
             ship->Owner, ship->Pilot,  ship->CoPilot );
  ch->Echo("Current Jump Destination: %s  Jump Point: %s\r\n", (ship->CurrentJump ? ship->CurrentJump->Name : "(null)"), (ship->LastSystem ? ship->LastSystem->Name : "(null)" ));
  ch->Echo("Firstroom: %d   Lastroom: %d",
             ship->Rooms.First,
             ship->Rooms.Last);
  ch->Echo("Cockpit: %d   Entrance: %d   Hangar: %d   Engineroom: %d\r\n",
             ship->Rooms.Cockpit,
             ship->Rooms.Entrance,
             ship->Rooms.Hangar,
             ship->Rooms.Engine);
  ch->Echo("Pilotseat: %d   Coseat: %d   Navseat: %d  Gunseat: %d\r\n",
             ship->Rooms.Pilotseat,
             ship->Rooms.Coseat,
             ship->Rooms.Navseat,
             ship->Rooms.Gunseat);
  ch->Echo("Location: %d   Lastdoc: %d   Shipyard: %d\r\n",
             ship->Location,
             ship->LastDock,
             ship->Shipyard);
  ch->Echo("Tractor Beam: %d   Comm: %d   Sensor: %d   Astro Array: %d\r\n",
             ship->WeaponSystems.TractorBeam.Strength,
             ship->Instruments.Comm,
             ship->Instruments.Sensor,
             ship->Instruments.AstroArray);
  ch->Echo("Lasers: %d  Ions: %d   Laser Condition: %s\r\n",
	ship->WeaponSystems.Laser.Count, ship->WeaponSystems.IonCannon.Count,
	ship->WeaponSystems.Laser.State == LASER_DAMAGED ? "Damaged" : "Good");

  for( size_t turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      static const char * const literal_number[MAX_NUMBER_OF_TURRETS_IN_SHIP] =
	{ "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" };
      const Turret *turret = ship->WeaponSystems.Turrets[turret_num];

      if ( IsTurretInstalled( turret ) )
	{
   ch->Echo("Turret %s: %d  Condition: %s\r\n",
		     literal_number[turret_num],
		     GetTurretRoom( turret ),
		     IsTurretDamaged( turret ) ? "Damaged" : "Good");
	}
    }

  ch->Echo("Missiles: %d/%d  Torpedos: %d/%d  Rockets: %d/%d  Condition: %s\r\n",
	ship->WeaponSystems.Tube.Missiles.Current,
	ship->WeaponSystems.Tube.Missiles.Max,
	ship->WeaponSystems.Tube.Torpedoes.Current,
	ship->WeaponSystems.Tube.Torpedoes.Max,
	ship->WeaponSystems.Tube.Rockets.Current,
	ship->WeaponSystems.Tube.Rockets.Max,
	ship->WeaponSystems.Tube.State == MISSILE_DAMAGED ? "Damaged" : "Good");
  ch->Echo("Hull: %d/%d  Ship Condition: %s\r\n",
             ship->Defenses.Hull.Current,
             ship->Defenses.Hull.Max,
             IsShipDisabled( ship ) ? "Disabled" : "Running");

  ch->Echo("Shields: %d/%d   Energy(fuel): %d/%d   Chaff: %d/%d\r\n",
	ship->Defenses.Shield.Current,
	ship->Defenses.Shield.Max,
	ship->Thrusters.Energy.Current,
	ship->Thrusters.Energy.Max,
	ship->Defenses.Chaff.Current, ship->Defenses.Chaff.Max );
  ch->Echo("Current Coordinates: %.0f %.0f %.0f\r\n",
             ship->Position.x, ship->Position.y, ship->Position.z );
  ch->Echo("Current Heading: %.0f %.0f %.0f\r\n",
             ship->Heading.x, ship->Heading.y, ship->Heading.z );
  ch->Echo("Speed: %d/%d   Hyperspeed: %d   Manueverability: %d\r\n",
	ship->Thrusters.Speed.Current, ship->Thrusters.Speed.Max,
	ship->Hyperdrive.Speed, ship->Thrusters.Maneuver );
  ch->Echo("Docked: ");

  if ((ship->Docked) != NULL)
    {
      ch->Echo("with %s",ship->Docked->Name);
    }
  else
    {
      ch->Echo("NO");
    }

  ch->Echo("  Docking Ports: %d", ship->DockingPorts );
  ch->Echo("  Alarm: %s   ", ship->Alarm ? "Yes" : "No" );
}

