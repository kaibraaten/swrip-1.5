#include "character.h"
#include "mud.h"

void do_buyhome( Character *ch, char *argument )
{
  ROOM_INDEX_DATA *room;
  Area *pArea;

  if ( !ch->in_room )
    return;

  if ( is_npc(ch) || !ch->pcdata )
    return;

  if ( ch->plr_home != NULL )
    {
      send_to_char( "&RYou already have a home!\r\n&w", ch);
      return;
    }

  room = ch->in_room;

  for ( pArea = first_bsort; pArea; pArea = pArea->next_sort )
    {
      if ( room->area == pArea )
        {
          send_to_char( "&RThis area isn't installed yet!\r\n&w", ch);
	  return;
        }
    }

  if ( !IS_SET( room->room_flags , ROOM_EMPTY_HOME ) )
    {
      send_to_char( "&RThis room isn't for sale!\r\n&w", ch);
      return;
    }

  if ( ch->gold < 100000 )
    {
      send_to_char( "&RThis room costs 100000 credits you don't have enough!\r\n&w", ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Set the room name.  A very brief single line room description.\r\n", ch );
      send_to_char( "Usage: Buyhome <Room Name>\r\n", ch );
      return;
    }

  STRFREE( room->name );
  room->name = STRALLOC( argument );

  ch->gold -= 100000;

  REMOVE_BIT( room->room_flags , ROOM_EMPTY_HOME );
  SET_BIT( room->room_flags , ROOM_PLR_HOME );

  fold_area( room->area, room->area->filename, false );

  ch->plr_home = room;
  do_save( ch , "" );
}
