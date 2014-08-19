#include "character.h"
#include "mud.h"
#include "ships.h"
#include "turret.h"

void do_showship( Character *ch, char *argument )
{
  Ship *ship = NULL;
  size_t turret_num = 0;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
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
  ChPrintf( ch, "%s %s : %s (%s)\r\nFilename: %s\r\n",
             ship->type == SHIP_REBEL ? "Rebel Alliance" :
             (ship->type == SHIP_IMPERIAL ? "Imperial" :
              (ship->type == SHIP_CIVILIAN ? "Civilian" : "Mob" ) ),
             ship->sclass == FIGHTER_SHIP ? "Starfighter" :
             (ship->sclass == MIDSIZE_SHIP ? "Midship" :
              (ship->sclass == CAPITAL_SHIP ? "Capital Ship" :
               (ship->sclass == SHIP_PLATFORM ? "Platform" :
                (ship->sclass == CLOUD_CAR ? "Cloudcar" :
                 (ship->sclass == OCEAN_SHIP ? "Boat" :
                  (ship->sclass == LAND_SPEEDER ? "Speeder" :
                   (ship->sclass == WHEELED ? "Wheeled Transport" :
                    (ship->sclass == LAND_CRAWLER ? "Crawler" :
                     (ship->sclass == WALKER ? "Walker" : "Unknown" ) ) ) ) ) ) ) ) ),
             ship->name,
             ship->personalname,
             ship->filename);
  ChPrintf( ch, "Home: %s   Description: %s\r\nOwner: %s   Pilot: %s   Copilot: %s\r\n",
             ship->home,  ship->description,
             ship->owner, ship->pilot,  ship->copilot );
  ChPrintf( ch, "Current Jump Destination: %s  Jump Point: %s\r\n", (ship->currjump ? ship->currjump->name : "(null)"), (ship->lastsystem ? ship->lastsystem->name : "(null)" ));
  ChPrintf( ch, "Firstroom: %d   Lastroom: %d",
             ship->room.first,
             ship->room.last);
  ChPrintf( ch, "Cockpit: %d   Entrance: %d   Hanger: %d   Engineroom: %d\r\n",
             ship->room.cockpit,
             ship->room.entrance,
             ship->room.hanger,
             ship->room.engine);
  ChPrintf( ch, "Pilotseat: %d   Coseat: %d   Navseat: %d  Gunseat: %d\r\n",
             ship->room.pilotseat,
             ship->room.coseat,
             ship->room.navseat,
             ship->room.gunseat);
  ChPrintf( ch, "Location: %d   Lastdoc: %d   Shipyard: %d\r\n",
             ship->location,
             ship->lastdoc,
             ship->shipyard);
  ChPrintf( ch, "Tractor Beam: %d   Comm: %d   Sensor: %d   Astro Array: %d\r\n",
             ship->tractorbeam,
             ship->comm,
             ship->sensor,
             ship->astro_array);
  ChPrintf( ch, "Lasers: %d  Ions: %d   Laser Condition: %s\r\n",
             ship->lasers, ship->ions,
             ship->statet0 == LASER_DAMAGED ? "Damaged" : "Good");

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      static const char * const literal_number[MAX_NUMBER_OF_TURRETS_IN_SHIP] =
	{ "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" };
      const Turret *turret = ship->turret[turret_num];

      if ( IsTurretInstalled( turret ) )
	{
	  ChPrintf( ch, "Turret %s: %d  Condition: %s\r\n",
		     literal_number[turret_num],
		     GetTurretRoom( turret ),
		     IsTurretDamaged( turret ) ? "Damaged" : "Good");
	}
    }

  ChPrintf( ch, "Missiles: %d  Torpedos: %d  Rockets: %d  Condition: %s\r\n",
             ship->missiles,
             ship->torpedos,
             ship->rockets,
             ship->missilestate == MISSILE_DAMAGED ? "Damaged" : "Good");
  ChPrintf( ch, "Hull: %d/%d  Ship Condition: %s\r\n",
             ship->hull,
             ship->maxhull,
             IsShipDisabled( ship ) ? "Disabled" : "Running");

  ChPrintf( ch, "Shields: %d/%d   Energy(fuel): %d/%d   Chaff: %d \r\n",
             ship->shield,
             ship->maxshield,
             ship->energy,
             ship->maxenergy,
             ship->chaff );
  ChPrintf( ch, "Current Coordinates: %.0f %.0f %.0f\r\n",
             ship->pos.x, ship->pos.y, ship->pos.z );
  ChPrintf( ch, "Current Heading: %.0f %.0f %.0f\r\n",
             ship->head.x, ship->head.y, ship->head.z );
  ChPrintf( ch, "Speed: %d/%d   Hyperspeed: %d   Manueverability: %d\r\n",
             ship->currspeed, ship->realspeed, ship->hyperspeed , ship->manuever );
  ChPrintf( ch, "Docked: ");

  if ((ship->docked) != NULL)
    {
      ChPrintf( ch, "with %s",ship->docked->name);
    }
  else
    {
      ChPrintf( ch, "NO");
    }

  ChPrintf(ch, "  Docking Ports: %d", ship->dockingports );
  ChPrintf(ch, "  Alarm: %d   ",ship->alarm);
}
