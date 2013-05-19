#include "shops.h"
#include "mud.h"

void do_list( CHAR_DATA *ch, char *argument )
{
  if ( IS_SET(ch->in_room->room_flags, ROOM_PET_SHOP) )
    {
      ROOM_INDEX_DATA *pRoomIndexNext;
      CHAR_DATA *pet;
      bool found;

      pRoomIndexNext = get_room_index( ch->in_room->vnum + 1 );
      if ( !pRoomIndexNext )
        {
          bug( "Do_list: bad pet shop at vnum %d.", ch->in_room->vnum );
          send_to_char( "You can't do that here.\r\n", ch );
          return;
        }

      found = FALSE;
      for ( pet = pRoomIndexNext->first_person; pet; pet = pet->next_in_room )
        {
          if ( IS_SET(pet->act, ACT_PET) && IS_NPC(pet) )
            {
              if ( !found )
                {
                  found = TRUE;
                  send_to_char( "Pets for sale:\r\n", ch );
                }
	      ch_printf( ch, "[%2d] %8d - %s\r\n",
                         pet->top_level,
                         10 * pet->top_level * pet->top_level,
                         pet->short_descr );
            }
        }
      if ( !found )
        send_to_char( "Sorry, we're out of pets right now.\r\n", ch );
      return;
    }
  else
    {
      char arg[MAX_INPUT_LENGTH];
      CHAR_DATA *keeper;
      OBJ_DATA *obj;
      int cost;
      int oref = 0;
      bool found;

      one_argument( argument, arg );

      if ( ( keeper = find_keeper( ch ) ) == NULL )
        return;

      found = FALSE;
      for ( obj = keeper->last_carrying; obj; obj = obj->prev_content )
        {
          if ( obj->wear_loc == WEAR_NONE
               &&   can_see_obj( ch, obj ) )
            {
              oref++;
              if ( ( cost = get_cost( ch, keeper, obj, TRUE ) ) > 0
                   && ( arg[0] == '\0' || nifty_is_name( arg, obj->name ) ) )
                {
                  if (keeper->home != NULL)
                    cost = obj->cost;
                  if ( !found )
                    {
                      found = TRUE;
                      send_to_char( "[Price] {ref} Item\r\n", ch );
                    }
                  ch_printf( ch, "[%5d] {%3d} %s%s.\r\n",
                             cost, oref, capitalize( obj->short_descr ),
                             IS_SET(obj->extra_flags, ITEM_HUTT_SIZE) ? " (hutt size)" :
                             ( IS_SET(obj->extra_flags, ITEM_LARGE_SIZE) ? " (large)" :
			       ( IS_SET(obj->extra_flags, ITEM_HUMAN_SIZE) ? " (medium)" :
                                 ( IS_SET(obj->extra_flags, ITEM_SMALL_SIZE) ? " (small)" :
                                   "" ) ) ) );
                }
            }
        }

      if ( !found )
        {
          if ( arg[0] == '\0' )
            send_to_char( "You can't buy anything here.\r\n", ch );
          else
            send_to_char( "You can't buy that here.\r\n", ch );
        }
      return;
    }
}
