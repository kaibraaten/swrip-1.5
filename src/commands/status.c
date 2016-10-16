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

  if( GetShipDistanceToShip( ship, target ) > 500+ship->sensor*2 )
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
             target->pos.x, target->pos.y, target->pos.z );
  Echo( ch, "&OCurrent Heading:&Y %.0f %.0f %.0f\r\n",
             target->head.x, target->head.y, target->head.z );
  Echo( ch, "&OCurrent Speed:&Y %d&O/%d\r\n",
             target->currspeed , target->realspeed );
  Echo( ch, "&OHull:&Y %d&O/%d  Ship Condition:&Y %s\r\n",
             target->hull,
             target->maxhull,
             IsShipDisabled( target ) ? "Disabled" : "Running");
  Echo( ch, "&OShields:&Y %d&O/%d   Energy(fuel):&Y %d&O/%d\r\n",
             target->shield,
             target->maxshield,
             target->energy,
             target->maxenergy);
  Echo( ch, "&OLaser Condition:&Y %s  &OCurrent Target:&Y %s\r\n",
             target->statet0 == LASER_DAMAGED ? "Damaged" : "Good" , target->target0 ? target->target0->Name : "none");

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      static const char * const literal_number[MAX_NUMBER_OF_TURRETS_IN_SHIP] =
	{ "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" };
      const Turret *turret = target->turret[turret_num];
      const Ship *turret_target = TurretHasTarget( turret ) ? GetTurretTarget( turret ) : NULL;
      const char *turret_target_name = turret_target ? turret_target->Name : "none";
      const char *turret_status = IsTurretDamaged( turret ) ? "Damaged" : "Good";

      if( IsTurretInstalled( turret ) )
	{
	  Echo( ch, "&OTurret %s:  &Y %s  &OCurrent Target:&Y %s\r\n",
		     literal_number[turret_num], turret_status, turret_target_name );
	}
    }

  Echo( ch, "&OSensors:    &Y%d   &OTractor Beam:   &Y%d\r\n", target->sensor, target->tractorbeam);
  Echo( ch, "&OAstroArray: &Y%d   &OComm:           &Y%d\r\n", target->astro_array, target->comm);
  Echo( ch, "\r\n&OMissiles:&Y %d&O  Torpedos: &Y%d&O\r\nRockets:  &Y%d&O  Chaff:    &Y%d&O  \r\n Condition:&Y %s&w\r\n",
             target->missiles,
             target->torpedos,
             target->rockets,
             target->chaff,
             target->missilestate == MISSILE_DAMAGED ? "Damaged" : "Good");

  LearnFromSuccess( ch, gsn_shipsystems );
}
