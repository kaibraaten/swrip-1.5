#include <string.h>
#include "mud.h"
#include "vector3_aux.h"
#include "ships.h"
#include "character.h"

void do_hail( Character *ch , char *argument )
{
  int vnum;
  long gold = 1;
  bool steal = false;
  ROOM_INDEX_DATA *room;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  SHIP_DATA *ship;
  SHIP_DATA *target = NULL;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( arg[0] != '\0' )
    {
      if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )

        {
          send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
          return;
        }

      if ( arg2[0] == '\0' )
        {
          send_to_char( "&RUsage: hail <ship> <message>\r\n&w", ch);
          return;
        }

      if ( !ship->spaceobject )
        {
          send_to_char( "&RYou need to launch first!\r\n&w", ch);
          return;
        }

      target = get_ship_here( arg,ship );


      if (  target == NULL )

        {
          send_to_char("&RThat ship isn't here!\r\n",ch);
          return;
        }
      if (  target == ship )
        {
          send_to_char("&RWhy don't you just say it?\r\n",ch);
          return;
        }

      if ( ship_distance_to_ship( target, ship ) > 100*(ship->sensor+10)*((target->sclass)+1 )
           && ship_distance_to_ship( target, ship ) > 100*((ship->comm)+(target->comm)+20 ) )
        {
          send_to_char("&RThat ship is out of the range of your comm system.\r\n&w", ch);
          return;
        }

      strcpy( buf , "You hail the " );
      strcat( buf , target->name );
      strcat( buf , ": &C" );
      strcat( buf , arg2 );
      strcat( buf , "&w\r\n" );

      echo_to_ship( AT_WHITE , ship , buf);

      strcpy( buf , ship->name );
      strcat( buf , " hails you: &C" );
      strcat( buf , arg2 );
      strcat( buf , "&w\r\n" );

      echo_to_ship( AT_WHITE , target , buf);

      return;
    }


  if ( !ch->in_room )
    return;

  if ( ch->position < POS_FIGHTING )
    {
      send_to_char( "You might want to stop fighting first!\r\n", ch );
      return;
    }

  if ( ch->position < POS_STANDING )
    {
      send_to_char( "You might want to stand up first!\r\n", ch );
      return;
    }

  if ( IS_SET( ch->in_room->room_flags , ROOM_INDOORS ) )
    {
      send_to_char( "You'll have to go outside to do that!\r\n", ch );
      return;
    }

  if ( ch->in_room->sector_type != SECT_CITY )
    {
      send_to_char( "There does not seem to be any speeders out here.\r\n", ch );
      return;
    }


  if ( IS_SET( ch->in_room->room_flags , ROOM_SPACECRAFT ) )
    {
      send_to_char( "You can't do that on spacecraft!\r\n", ch );
      return;
    }

  if( ch->top_level < 6 )
    gold = 0;

  if ( gold )
    gold = 500*ch->top_level/50;

  if ( ch->gold < gold )
    {
      send_to_char( "You don't have enough credits!\r\n", ch );
      return;
    }

  if ( gold && number_range( 1, 10 ) == 1 )
    steal = true;

  vnum = ch->in_room->vnum;

  for ( vnum = ch->in_room->area->low_r_vnum  ;  vnum <= ch->in_room->area->hi_r_vnum  ;  vnum++ )
    {
      room = get_room_index ( vnum );

      if ( room != NULL )
        {
          if ( IS_SET(room->room_flags , ROOM_HOTEL ) )
            break;
          else
            room = NULL;
        }
    }

  if ( room == NULL )
    {
      send_to_char( "There doesn't seem to be any taxis nearby!\r\n", ch );
      return;
    }

  ch->gold -= umax( gold, 0);
  if( ch->in_room && ch->in_room->area )
    boost_economy( ch->in_room->area, gold );

  act( AT_ACTION, "$n hails a speederbike, and drives off to seek shelter.", ch, NULL, NULL,  TO_ROOM );

  char_from_room( ch );
  char_to_room( ch, room );

  ch_printf( ch, "A speederbike picks you up and drives you to a safe location.\r\nYou pay the driver %d credits.\r\n", gold );

  act( AT_ACTION, "$n $T", ch, NULL, "arrives on a speederbike, gets off and pays the driver before it leaves.",  TO_ROOM );

  if( steal )
    {
      send_to_char( "You realize after the taxi drives off that you are missing a good amount of your credits! Thief!\r\n", ch );
      gold = ch->gold/10;
      ch->gold -= gold;
      if( ch->in_room && ch->in_room->area )
        boost_economy( ch->in_room->area, gold );
      return;
    }


  do_look( ch, "auto" );
}
