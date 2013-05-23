#include "character.h"
#include "mud.h"
#include "ships.h"

void do_showship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = NULL;

  if ( is_npc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Usage: showship <ship>\r\n", ch );
      return;
    }

  ship = get_ship( argument );

  if ( !ship )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  set_char_color( AT_YELLOW, ch );
  ch_printf( ch, "%s %s : %s (%s)\r\nFilename: %s\r\n",
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
  ch_printf( ch, "Home: %s   Description: %s\r\nOwner: %s   Pilot: %s   Copilot: %s\r\n",
             ship->home,  ship->description,
             ship->owner, ship->pilot,  ship->copilot );
  ch_printf( ch, "Current Jump Destination: %s  Jump Point: %s\r\n", (ship->currjump ? ship->currjump->name : "(null)"), (ship->lastsystem ? ship->lastsystem->name : "(null)" ));
  ch_printf( ch, "Firstroom: %d   Lastroom: %d",
             ship->firstroom,
             ship->lastroom);
  ch_printf( ch, "Cockpit: %d   Entrance: %d   Hanger: %d   Engineroom: %d\r\n",
             ship->cockpit,
             ship->entrance,
             ship->hanger,
             ship->engineroom);
  ch_printf( ch, "Pilotseat: %d   Coseat: %d   Navseat: %d  Gunseat: %d\r\n",
             ship->pilotseat,
             ship->coseat,
             ship->navseat,
             ship->gunseat);
  ch_printf( ch, "Location: %d   Lastdoc: %d   Shipyard: %d\r\n",
             ship->location,
             ship->lastdoc,
             ship->shipyard);
  ch_printf( ch, "Tractor Beam: %d   Comm: %d   Sensor: %d   Astro Array: %d\r\n",
             ship->tractorbeam,
             ship->comm,
             ship->sensor,
             ship->astro_array);
  ch_printf( ch, "Lasers: %d  Ions: %d   Laser Condition: %s\r\n",
             ship->lasers, ship->ions,
             ship->statet0 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret1 )
    ch_printf( ch, "Turret One: %d  Condition: %s\r\n",
               ship->turret1,
               ship->statet1 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret2 )
    ch_printf( ch, "Turret Two: %d  Condition: %s\r\n",
               ship->turret2,
               ship->statet2 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret3 )
    ch_printf( ch, "Turret Three: %d  Condition: %s\r\n",
               ship->turret3,
               ship->statet3 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret4 )
    ch_printf( ch, "Turret Four: %d  Condition: %s\r\n",
               ship->turret4,

               ship->statet4 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret5 )
    ch_printf( ch, "Turret Five: %d  Condition: %s\r\n",
               ship->turret5,
               ship->statet5 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret6 )
    ch_printf( ch, "Turret Six: %d  Condition: %s\r\n",
               ship->turret6,
               ship->statet6 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret7 )
    ch_printf( ch, "Turret Seven: %d  Condition: %s\r\n",
               ship->turret7,
               ship->statet7 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret8 )
    ch_printf( ch, "Turret Eight: %d  Condition: %s\r\n",
               ship->turret8,
               ship->statet8 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret9 )
    ch_printf( ch, "Turret Nine: %d  Condition: %s\r\n",
               ship->turret9,
               ship->statet9 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret0 )
    ch_printf( ch, "Turret Ten: %d  Condition: %s\r\n",
               ship->turret0,
               ship->statet10 == LASER_DAMAGED ? "Damaged" : "Good");

  ch_printf( ch, "Missiles: %d  Torpedos: %d  Rockets: %d  Condition: %s\r\n",
             ship->missiles,
             ship->torpedos,
             ship->rockets,
             ship->missilestate == MISSILE_DAMAGED ? "Damaged" : "Good");
  ch_printf( ch, "Hull: %d/%d  Ship Condition: %s\r\n",
             ship->hull,
             ship->maxhull,
             ship_is_disabled( ship ) ? "Disabled" : "Running");

  ch_printf( ch, "Shields: %d/%d   Energy(fuel): %d/%d   Chaff: %d \r\n",
             ship->shield,
             ship->maxshield,
             ship->energy,
             ship->maxenergy,
             ship->chaff );
  ch_printf( ch, "Current Coordinates: %.0f %.0f %.0f\r\n",
             ship->pos.x, ship->pos.y, ship->pos.z );
  ch_printf( ch, "Current Heading: %.0f %.0f %.0f\r\n",
             ship->head.x, ship->head.y, ship->head.z );
  ch_printf( ch, "Speed: %d/%d   Hyperspeed: %d   Manueverability: %d\r\n",
             ship->currspeed, ship->realspeed, ship->hyperspeed , ship->manuever );
  ch_printf( ch, "Docked: ");

  if ((ship->docked) != NULL)
    {
      ch_printf( ch, "with %s",ship->docked->name);
    }
  else
    {
      ch_printf( ch, "NO");
    }

  ch_printf(ch, "  Docking Ports: %d", ship->dockingports );
  ch_printf(ch, "  Alarm: %d   ",ship->alarm);
}
