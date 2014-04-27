#include <string.h>
#include "ships.h"
#include "mud.h"
#include "character.h"

void do_drive( CHAR_DATA *ch, char *argument )
{
  int dir;
  SHIP_DATA *ship, *target;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);


  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the drivers seat of a land vehicle to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass < LAND_SPEEDER )
    {
      send_to_char("&RThis isn't a land vehicle!\r\n",ch);
      return;
    }


  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe drive is disabled.\r\n",ch);
      return;
    }

  if ( ship->energy <1 )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( !str_cmp( arg, "in" ))
    {
      target = ship_in_room( ship->in_room , arg2 );

      if ( !target )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }

      if (!target->room.hanger)
        {
          send_to_char("That ship does not have any room.\r\n", ch);
          return;
        }

      if (!target->bayopen)
        {
          send_to_char("The ship's bay doors must be open.\r\n", ch);
          return;
        }

      if ( IS_SET( target->in_room->room_flags, ROOM_INDOORS )
           || target->in_room->sector_type == SECT_INSIDE )
        {
          send_to_char( "You can't drive indoors!\r\n", ch );
          return;
        }

      send_to_char("You drive the vehicle into the bay.\r\n", ch);
      sprintf( buf, "%s drives into %s.", ship->name, target->name);
      echo_to_room( AT_GREY,  ship->in_room, buf);

      transship(ship, target->room.hanger);

      sprintf( buf, "%s drives into the bay", ship->name);
      echo_to_room( AT_GREY, ship->in_room, buf);
      learn_from_success( ch, gsn_speeders );
      return;
    }

  if ( !str_cmp( arg, "out" ))
    {
      target = ship_from_hanger(ship->in_room->vnum);

      if (!target)
	{
          send_to_char("You have to be in a ship's hanger to drive out of one.\r\n", ch);
          return;
        }

      if ( target->spaceobject != NULL )
        {
          send_to_char("The ship must be landed before you drive out of its hanger!\r\n", ch);
          return;
        }

      if (!target->bayopen)
        {
          send_to_char("The ship's bay doors must be open.\r\n", ch);
          return;
        }

      if ( IS_SET( target->in_room->room_flags, ROOM_INDOORS )
           || target->in_room->sector_type == SECT_INSIDE )
        {
          send_to_char( "You can't drive indoors!\r\n", ch );
          return;
        }

      send_to_char("You drive the vehicle out of the bay.\r\n", ch);
      sprintf( buf, "%s drives out of the ship.", ship->name);
      echo_to_room( AT_GREY,  ship->in_room, buf);

      transship(ship, target->in_room->vnum);

      sprintf( buf, "%s drives out of %s", ship->name, target->name);
      echo_to_room( AT_GREY, ship->in_room, buf);
      learn_from_success( ch, gsn_speeders );
      return;
    }



  if ( ( dir = get_dir( arg ) ) == -1 )
    {
      send_to_char( "Usage: drive <direction>\r\n", ch );
      return;
    }

  drive_ship( ch, ship, get_exit(get_room_index(ship->location), dir), 0 );
}
