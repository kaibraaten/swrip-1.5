#include "character.h"
#include "mud.h"

void do_mine( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  bool shovel;
  short move;

  if ( ch->pcdata->learned[gsn_mine] <= 0 )
    {
      ch_printf( ch, "You have no idea how to do that.\r\n" );
      return;
    }

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "And what will you mine the room with?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  shovel = false;
  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    if ( obj->item_type == ITEM_SHOVEL )
      {
        shovel = true;
        break;
      }

  obj = get_obj_list_rev( ch, arg, ch->in_room->last_content );
  if ( !obj )
    {
      send_to_char( "You don't see on here.\r\n", ch );
      return;
    }

  separate_obj(obj);
  if ( obj->item_type != ITEM_LANDMINE )
    {
      act( AT_PLAIN, "That's not a landmine!", ch, obj, 0, TO_CHAR );
      return;
    }

  if ( !CAN_WEAR(obj, ITEM_TAKE) )
    {
      act( AT_PLAIN, "You cannot bury $p.", ch, obj, 0, TO_CHAR );
      return;
    }

  switch( ch->in_room->sector_type )
    {
    case SECT_CITY:
    case SECT_INSIDE:
      send_to_char( "The floor is too hard to dig through.\r\n", ch );
      return;
    case SECT_WATER_SWIM:
    case SECT_WATER_NOSWIM:
    case SECT_UNDERWATER:
      send_to_char( "You cannot bury a mine in the water.\r\n", ch );
      return;
    case SECT_AIR:
      send_to_char( "What?  Bury a mine in the air?!\r\n", ch );
      return;
    }

  if ( obj->weight > (UMAX(5, (can_carry_w(ch) / 10)))
       &&  !shovel )
    {
      send_to_char( "You'd need a shovel to bury something that big.\r\n", ch );
      return;
    }

  move = (obj->weight * 50 * (shovel ? 1 : 5)) / UMAX(1, can_carry_w(ch));
  move = URANGE( 2, move, 1000 );
  if ( move > ch->move )
    {
      send_to_char( "You don't have the energy to bury something of that size.\r\n", ch );
      return;
    }
  ch->move -= move;

  SET_BIT( obj->extra_flags, ITEM_BURRIED );
  set_wait_state( ch, URANGE( 10, move / 2, 100 ) );

  STRFREE ( obj->armed_by );
  obj->armed_by = STRALLOC ( ch->name );

  ch_printf( ch, "You arm and bury %s.\r\n", obj->short_descr );
  act( AT_PLAIN, "$n arms and buries $p.", ch, obj, NULL, TO_ROOM );

  learn_from_success( ch, gsn_mine );
}
