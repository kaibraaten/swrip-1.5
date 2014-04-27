#include "vector3_aux.h"
#include "mud.h"
#include "ships.h"
#include "character.h"

static bool ship_was_in_range( SHIP_DATA *ship, SHIP_DATA *target );

void do_jumpvector( CHAR_DATA *ch, char *argument )
{
  int the_chance, num;
  float randnum;
  Vector3 projected;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];

  num = number_range( 1, 16 );
  randnum = 1.0/(float) num;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou have to be in realspace to do that!\r\n", ch);
      return;
    }

  target = get_ship( argument );

  if ( !target )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  if ( target == ship )
    {
      send_to_char( "You can figure out where you are going on your own.\r\n", ch );
      return;
    }

  if (!ship_was_in_range( ship, target ))
    {
      send_to_char( "No log for that ship.\r\n", ch);
      return;
    }
  if (target->shipstate == SHIP_LANDED)
    {
      send_to_char( "No log for that ship.\r\n", ch);
      return;
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_jumpvector]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou cant figure out the course vectors correctly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  if( ship_is_in_hyperspace( ship ) )
    {
      projected.x = (target->pos.x - target->originpos.x)*randnum;
      projected.y = (target->pos.y - target->originpos.y)*randnum;
      projected.z = (target->pos.z - target->originpos.z)*randnum;

      send_to_char("After some deliberation, you figure out its projected course.\r\n", ch);
      sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
              target->name, projected.x, projected.y, projected.z );
      echo_to_cockpit( AT_BLOOD, ship , buf );
      learn_from_success( ch, gsn_jumpvector );
      return;
    }

  projected.x = (target->hyperpos.x - target->originpos.x)*randnum;
  projected.y = (target->hyperpos.y - target->originpos.y)*randnum;
  projected.z = (target->hyperpos.z - target->originpos.z)*randnum;

  send_to_char("After some deliberation, you figure out its projected course.\r\n", ch);
  sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
          target->name, projected.x, projected.y, projected.z  );
  echo_to_cockpit( AT_BLOOD, ship , buf );
  learn_from_success( ch, gsn_jumpvector );
}

static bool ship_was_in_range( SHIP_DATA *ship, SHIP_DATA *target )
{
  return target && ship && target != ship
    && ship_distance_to_ship( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3);
}
