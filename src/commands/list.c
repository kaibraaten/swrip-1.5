#include "character.h"
#include "shops.h"
#include "mud.h"

static bool IsPet( void *element, void *userData )
{
  const Character *pet = (Character*) element;

  return IS_SET( pet->act, ACT_PET ) && IsNpc( pet );
}

static void ShowPetForSale( void *element, void *userData )
{
  if( IsPet( element, userData ) )
    {
      Character *pet = (Character*) element;
      Character *buyer = (Character*) userData;

      ch_printf( buyer, "[%2d] %8d - %s\r\n",
		 pet->top_level,
		 10 * pet->top_level * pet->top_level,
		 pet->short_descr );
    }
}

void do_list( Character *ch, char *argument )
{
  if ( IS_SET(ch->in_room->room_flags, ROOM_PET_SHOP) )
    {
      ROOM_INDEX_DATA *petRoom = get_room_index( ch->in_room->vnum + 1 );
      int numberOfPetsInShop = 0;

      if ( !petRoom )
        {
          bug( "%s: bad pet shop at vnum %d.", __FUNCTION__, ch->in_room->vnum );
          send_to_char( "You can't do that here.\r\n", ch );
          return;
        }

      numberOfPetsInShop = List_CountIf( petRoom->People, IsPet, NULL );

      if( numberOfPetsInShop > 0 )
	{
	  CerisList *listOfPets = List_CopyIf( petRoom->People, IsPet, NULL );
	  ch_printf( ch, "Pets for sale:\r\n" );

	  List_ForEach( listOfPets, ShowPetForSale, ch );
	  DestroyList( listOfPets );
	}
      else
	{
	  send_to_char( "Sorry, we're out of pets right now.\r\n", ch );
	}

      return;
    }
  else
    {
      char arg[MAX_INPUT_LENGTH];
      Character *keeper = find_keeper( ch );
      OBJ_DATA *obj = NULL;
      int cost = 0;
      int oref = 0;
      bool found = FALSE;

      one_argument( argument, arg );

      if ( !keeper )
	{
	  return;
	}

      for ( obj = keeper->last_carrying; obj; obj = obj->prev_content )
        {
          if ( obj->wear_loc == WEAR_NONE
               && can_see_obj( ch, obj ) )
            {
              oref++;
	      cost = get_cost( ch, keeper, obj, TRUE );

              if ( cost > 0
                   && ( arg[0] == '\0' || nifty_is_name( arg, obj->name ) ) )
                {
                  if (keeper->home != NULL)
		    {
		      cost = obj->cost;
		    }

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
	    {
	      send_to_char( "You can't buy anything here.\r\n", ch );
	    }
          else
	    {
	      send_to_char( "You can't buy that here.\r\n", ch );
	    }
        }

      return;
    }
}
