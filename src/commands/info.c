#include "character.h"
#include "vector3_aux.h"
#include "mud.h"
#include "ships.h"

void do_info(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  SHIP_DATA *target;
  bool fromafar = TRUE;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      if ( argument[0] == '\0' )
        {
          act( AT_PLAIN, "Which ship do you want info on?.", ch, NULL, NULL, TO_CHAR );
          return;
        }

      ship = ship_in_room( ch->in_room , argument );
      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
      target = ship;
    }
  else if ( ship->room.hanger == ch->in_room->vnum )
    {
      if ( argument[0] == '\0' )
        {
          act( AT_PLAIN, "Which ship do you want info on?.", ch, NULL, NULL, TO_CHAR );
          return;
        }

      ship = ship_in_room( ch->in_room , argument );
      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }

      target = ship;
    }
  else if (argument[0] == '\0')
    {
      target = ship;
      fromafar = FALSE;
    }
  else
    target = get_ship_here( argument , ship );

  if ( target == NULL )
    {
      send_to_char("&RI don't see that here.\r\nTry the radar, or type info by itself for info on this ship.\r\n",ch);
      return;
    }

  if ( check_pilot( ch , target ) )
    fromafar = FALSE;

  if( ship_distance_to_ship( ship, target ) > 500 + ship->sensor * 2 )
    {
      send_to_char("&RThat ship is to far away to scan.\r\n",ch);
      return;
    }

  ch_printf( ch, "&Y%s %s : %s (%s)\r\n&B",
             target->type == SHIP_REBEL ? "Rebel" :
             (target->type == SHIP_IMPERIAL ? "Imperial" : "Civilian" ),
             target->sclass == FIGHTER_SHIP ? "Starfighter" :
             (target->sclass == MIDSIZE_SHIP ? "Midtarget" :
              (target->sclass == CAPITAL_SHIP ? "Capital Ship" :
               (ship->sclass == SHIP_PLATFORM ? "Platform" :
                (ship->sclass == CLOUD_CAR ? "Cloudcar" :
                 (ship->sclass == OCEAN_SHIP ? "Boat" :
                  (ship->sclass == LAND_SPEEDER ? "Speeder" :
                   (ship->sclass == WHEELED ? "Wheeled Transport" :
                    (ship->sclass == LAND_CRAWLER ? "Crawler" :
                     (ship->sclass == WALKER ? "Walker" : "Unknown" ) ) ) ) ) ) ) ) ),
             target->name,
             target->personalname,
             target->filename);
  ch_printf( ch, "Description: %s\r\nOwner: %s",
             target->description,
             target->owner );
  if( fromafar == FALSE )
    ch_printf( ch, "   Pilot: %s   Copilot: %s", target->pilot,  target->copilot );
  ch_printf( ch, "\r\nLaser cannons: %d  Ion cannons: %d\r\n",
             target->lasers, target->ions);
  ch_printf( ch, "Max Hull: %d  ", target->maxhull);
  ch_printf( ch, "Max Shields: %d   Max Energy(fuel): %d\r\n",
             target->maxshield, target->maxenergy);
  ch_printf( ch, "Maximum Speed: %d   Hyperspeed: %d  Value: %d\r\n",
             target->realspeed, target->hyperspeed, get_ship_value( target ));

  act( AT_PLAIN, "$n checks various gages and displays on the control panel.",
       ch, NULL, argument , TO_ROOM );
}
