#include "ships.h"
#include "mud.h"
#include "character.h"

void do_shiptrack( Character *ch, char *argument)
{
  SHIP_DATA *ship;
  SPACE_DATA *spaceobject;
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = one_argument( argument , arg);
  argument = one_argument( argument , arg1);
  argument = one_argument( argument , arg2);
  argument = one_argument( argument , arg3);

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou can only do that in space!\r\n",ch);
      return;
    }

  if( !str_cmp( arg, "dist" ) )
    {
      ship->tcount = atoi(arg1);
      send_to_char("&RJump distance set!\r\n",ch);
      return;
    }

  if( !str_cmp( arg, "set" ) )
    {
      Vector3 head;

      if ( ship_is_in_hyperspace( ship ) )
        {
          send_to_char("&RYou can only do that in realspace!\r\n",ch);
          return;
        }

      if( !is_number(arg1) || !is_number(arg2) || !is_number(arg3) )
        {
          send_to_char( "Syntax: shiptrack set <X Heading> <Y Heading> <Z Heading>.\r\n", ch);
          return;
        }

      vector_set( &head, atoi(arg1), atoi(arg2), atoi(arg3) );
      sprintf( buf, "%.0f %.0f %.0f", ship->pos.x + head.x,
               ship->pos.y + head.y, ship->pos.z + head.z );

      if( head.x < 1000 )
        head.x *= 10000;

      if( head.y < 1000 )
        head.y *= 10000;

      if( head.z < 1000 )
        head.z *= 10000;

      ship->trackvector.x = head.x;
      ship->trackvector.y = head.y;
      ship->trackvector.z = head.z;

      ship->tracking = TRUE;
      ship->ch = ch;
      do_trajectory( ch, buf);

      vector_set( &ship->jump, ship->pos.x + head.x,
                  ship->pos.y + head.y, ship->pos.z + head.z );

      for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
        if( space_in_range( ship, spaceobject ) )
          {
            ship->currjump = spaceobject;
	    break;
          }
      if( !spaceobject )
        ship->currjump = ship->spaceobject;

      if( ship->jump.x > MAX_COORD || ship->jump.y > MAX_COORD || ship->jump.z > MAX_COORD
          || ship->jump.x < -MAX_COORD || ship->jump.y < -MAX_COORD || ship->jump.z < -MAX_COORD
          || ship->pos.x > MAX_COORD || ship->pos.y > MAX_COORD || ship->pos.z > MAX_COORD
          || ship->pos.x < -MAX_COORD || ship->pos.y < -MAX_COORD || ship->pos.z < -MAX_COORD
          || ship->head.x > MAX_COORD || ship->head.y > MAX_COORD || ship->head.z > MAX_COORD
          || ship->head.x < -MAX_COORD || ship->head.y < -MAX_COORD || ship->head.z < -MAX_COORD )
        {
          echo_to_cockpit( AT_RED, ship, "WARNING... Jump coordinates outside of the known galaxy.");
          echo_to_cockpit( AT_RED, ship, "WARNING... Hyperjump NOT set.");
          ship->currjump = NULL;
          ship->tracking = FALSE;
          return;
        }

      ship->hyperdistance = vector_distance( &ship->pos, &ship->jump ) / 50;
      ship->orighyperdistance = ship->hyperdistance;

      send_to_char( "Course laid in. Beginning tracking program.\r\n", ch);
      return;
    }

  if( !str_cmp( arg, "stop" ) || !str_cmp( arg, "halt" ))
    {
      ship->tracking = FALSE;
      send_to_char( "Tracking program cancelled.\r\n", ch);

      if( ship_is_in_hyperspace( ship ) )
        do_hyperspace( ch, "off" );
    }
}
