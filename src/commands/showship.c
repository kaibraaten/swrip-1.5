#include "character.h"
#include "mud.h"
#include "ship.h"
#include "turret.h"
#include "spaceobject.h"

void do_showship( Character *ch, char *argument )
{
  Ship *ship = NULL;
  size_t turret_num = 0;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: showship <ship>\r\n", ch );
      return;
    }

  ship = GetShipAnywhere( argument );

  if ( !ship )
    {
      SendToCharacter( "No such ship.\r\n", ch );
      return;
    }

  SetCharacterColor( AT_YELLOW, ch );
  Echo( ch, "%s %s : %s (%s)\r\nFilename: %s\r\n",
             ship->Type == SHIP_REBEL ? "Rebel Alliance" :
             (ship->Type == SHIP_IMPERIAL ? "Imperial" :
              (ship->Type == SHIP_CIVILIAN ? "Civilian" : "Mob" ) ),
             ship->Class == FIGHTER_SHIP ? "Starfighter" :
             (ship->Class == MIDSIZE_SHIP ? "Midship" :
              (ship->Class == CAPITAL_SHIP ? "Capital Ship" :
               (ship->Class == SHIP_PLATFORM ? "Platform" :
                (ship->Class == CLOUD_CAR ? "Cloudcar" :
                 (ship->Class == OCEAN_SHIP ? "Boat" :
                  (ship->Class == LAND_SPEEDER ? "Speeder" :
                   (ship->Class == WHEELED ? "Wheeled Transport" :
                    (ship->Class == LAND_CRAWLER ? "Crawler" :
                     (ship->Class == WALKER ? "Walker" : "Unknown" ) ) ) ) ) ) ) ) ),
             ship->Name,
             ship->PersonalName,
             ship->Filename);
  Echo( ch, "Home: %s   Description: %s\r\nOwner: %s   Pilot: %s   Copilot: %s\r\n",
             ship->Home,  ship->Description,
             ship->Owner, ship->Pilot,  ship->CoPilot );
  Echo( ch, "Current Jump Destination: %s  Jump Point: %s\r\n", (ship->CurrentJump ? ship->CurrentJump->Name : "(null)"), (ship->LastSystem ? ship->LastSystem->Name : "(null)" ));
  Echo( ch, "Firstroom: %d   Lastroom: %d",
             ship->Room.First,
             ship->Room.Last);
  Echo( ch, "Cockpit: %d   Entrance: %d   Hanger: %d   Engineroom: %d\r\n",
             ship->Room.Cockpit,
             ship->Room.Entrance,
             ship->Room.Hanger,
             ship->Room.Engine);
  Echo( ch, "Pilotseat: %d   Coseat: %d   Navseat: %d  Gunseat: %d\r\n",
             ship->Room.Pilotseat,
             ship->Room.Coseat,
             ship->Room.Navseat,
             ship->Room.Gunseat);
  Echo( ch, "Location: %d   Lastdoc: %d   Shipyard: %d\r\n",
             ship->Location,
             ship->LastDock,
             ship->Shipyard);
  Echo( ch, "Tractor Beam: %d   Comm: %d   Sensor: %d   Astro Array: %d\r\n",
             ship->WeaponSystems.TractorBeam.Strength,
             ship->Instruments.Comm,
             ship->Instruments.Sensor,
             ship->Instruments.AstroArray);
  Echo( ch, "Lasers: %d  Ions: %d   Laser Condition: %s\r\n",
	ship->WeaponSystems.Laser.Count, ship->WeaponSystems.IonCannon.Count,
	ship->WeaponSystems.Laser.State == LASER_DAMAGED ? "Damaged" : "Good");

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      static const char * const literal_number[MAX_NUMBER_OF_TURRETS_IN_SHIP] =
	{ "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" };
      const Turret *turret = ship->WeaponSystems.Turret[turret_num];

      if ( IsTurretInstalled( turret ) )
	{
	  Echo( ch, "Turret %s: %d  Condition: %s\r\n",
		     literal_number[turret_num],
		     GetTurretRoom( turret ),
		     IsTurretDamaged( turret ) ? "Damaged" : "Good");
	}
    }

  Echo( ch, "Missiles: %d/%d  Torpedos: %d/%d  Rockets: %d/%d  Condition: %s\r\n",
	ship->WeaponSystems.Tube.Missiles.Current,
	ship->WeaponSystems.Tube.Missiles.Max,
	ship->WeaponSystems.Tube.Torpedoes.Current,
	ship->WeaponSystems.Tube.Torpedoes.Max,
	ship->WeaponSystems.Tube.Rockets.Current,
	ship->WeaponSystems.Tube.Rockets.Max,
	ship->WeaponSystems.Tube.State == MISSILE_DAMAGED ? "Damaged" : "Good");
  Echo( ch, "Hull: %d/%d  Ship Condition: %s\r\n",
             ship->Defenses.Hull.Current,
             ship->Defenses.Hull.Max,
             IsShipDisabled( ship ) ? "Disabled" : "Running");

  Echo( ch, "Shields: %d/%d   Energy(fuel): %d/%d   Chaff: %d/%d\r\n",
	ship->Defenses.Shield.Current,
	ship->Defenses.Shield.Max,
	ship->Thrusters.Energy.Current,
	ship->Thrusters.Energy.Max,
	ship->Defenses.Chaff.Current, ship->Defenses.Chaff.Max );
  Echo( ch, "Current Coordinates: %.0f %.0f %.0f\r\n",
             ship->Position.x, ship->Position.y, ship->Position.z );
  Echo( ch, "Current Heading: %.0f %.0f %.0f\r\n",
             ship->Heading.x, ship->Heading.y, ship->Heading.z );
  Echo( ch, "Speed: %d/%d   Hyperspeed: %d   Manueverability: %d\r\n",
	ship->Thrusters.Speed.Current, ship->Thrusters.Speed.Max, ship->Hyperdrive.Speed , ship->Maneuver );
  Echo( ch, "Docked: ");

  if ((ship->Docked) != NULL)
    {
      Echo( ch, "with %s",ship->Docked->Name);
    }
  else
    {
      Echo( ch, "NO");
    }

  Echo(ch, "  Docking Ports: %d", ship->DockingPorts );
  Echo(ch, "  Alarm: %d   ",ship->Alarm);
}
