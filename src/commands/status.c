#include "character.h"
#include "vector3_aux.h"
#include "mud.h"
#include "ships.h"
#include "turret.h"

void do_status(CHAR_DATA *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  size_t turret_num = 0;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n",ch);
      return;
    }

  if (argument[0] == '\0')
    target = ship;
  else
    target = get_ship_here( argument , ship );

  if ( target == NULL )
    {
      send_to_char("&RI don't see that here.\r\nTry the radar, or type status by itself for your ships status.\r\n",ch);
      return;
    }

  if( ship_distance_to_ship( ship, target ) > 500+ship->sensor*2 )
    {
      send_to_char("&RThat ship is to far away to scan.\r\n",ch);
      return;
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou cant figure out what the readout means.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n checks various gages and displays on the control panel.", ch,
       NULL, argument , TO_ROOM );

  ch_printf( ch, "&W%s:\r\n",target->name);
  ch_printf( ch, "&OCurrent Coordinates:&Y %.0f %.0f %.0f\r\n",
             target->pos.x, target->pos.y, target->pos.z );
  ch_printf( ch, "&OCurrent Heading:&Y %.0f %.0f %.0f\r\n",
             target->head.x, target->head.y, target->head.z );
  ch_printf( ch, "&OCurrent Speed:&Y %d&O/%d\r\n",
             target->currspeed , target->realspeed );
  ch_printf( ch, "&OHull:&Y %d&O/%d  Ship Condition:&Y %s\r\n",
             target->hull,
             target->maxhull,
             ship_is_disabled( target ) ? "Disabled" : "Running");
  ch_printf( ch, "&OShields:&Y %d&O/%d   Energy(fuel):&Y %d&O/%d\r\n",
             target->shield,
             target->maxshield,
             target->energy,
             target->maxenergy);
  ch_printf( ch, "&OLaser Condition:&Y %s  &OCurrent Target:&Y %s\r\n",
             target->statet0 == LASER_DAMAGED ? "Damaged" : "Good" , target->target0 ? target->target0->name : "none");

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      static const char * const literal_number[MAX_NUMBER_OF_TURRETS_IN_SHIP] =
	{ "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" };
      const TURRET_DATA *turret = target->turret[turret_num];
      const SHIP_DATA *turret_target = turret_has_target( turret ) ? get_turret_target( turret ) : NULL;
      const char *turret_target_name = turret_target ? turret_target->name : "none";
      const char *turret_status = is_turret_damaged( turret ) ? "Damaged" : "Good";

      if( is_turret_installed( turret ) )
	{
	  ch_printf( ch, "&OTurret %s:  &Y %s  &OCurrent Target:&Y %s\r\n",
		     literal_number[turret_num], turret_status, turret_target_name );
	}
    }

  ch_printf( ch, "&OSensors:    &Y%d   &OTractor Beam:   &Y%d\r\n", target->sensor, target->tractorbeam);
  ch_printf( ch, "&OAstroArray: &Y%d   &OComm:           &Y%d\r\n", target->astro_array, target->comm);
  ch_printf( ch, "\r\n&OMissiles:&Y %d&O  Torpedos: &Y%d&O\r\nRockets:  &Y%d&O  Chaff:    &Y%d&O  \r\n Condition:&Y %s&w\r\n",
             target->missiles,
             target->torpedos,
             target->rockets,
             target->chaff,
             target->missilestate == MISSILE_DAMAGED ? "Damaged" : "Good");

  learn_from_success( ch, gsn_shipsystems );
}
