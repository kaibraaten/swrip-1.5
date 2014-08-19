#include "character.h"
#include "mud.h"

void do_buyhome( Character *ch, char *argument )
{
  Room *room;
  Area *pArea;

  if ( !ch->in_room )
    return;

  if ( IsNpc(ch) || !ch->pcdata )
    return;

  if ( ch->plr_home != NULL )
    {
      SendToCharacter( "&RYou already have a home!\r\n&w", ch);
      return;
    }

  room = ch->in_room;

  for ( pArea = first_bsort; pArea; pArea = pArea->next_sort )
    {
      if ( room->area == pArea )
        {
          SendToCharacter( "&RThis area isn't installed yet!\r\n&w", ch);
	  return;
        }
    }

  if ( !IsBitSet( room->room_flags , ROOM_EMPTY_HOME ) )
    {
      SendToCharacter( "&RThis room isn't for sale!\r\n&w", ch);
      return;
    }

  if ( ch->gold < 100000 )
    {
      SendToCharacter( "&RThis room costs 100000 credits you don't have enough!\r\n&w", ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Set the room name.  A very brief single line room description.\r\n", ch );
      SendToCharacter( "Usage: Buyhome <Room Name>\r\n", ch );
      return;
    }

  FreeMemory( room->name );
  room->name = CopyString( argument );

  ch->gold -= 100000;

  RemoveBit( room->room_flags , ROOM_EMPTY_HOME );
  SetBit( room->room_flags , ROOM_PLR_HOME );

  FoldArea( room->area, room->area->filename, false );

  ch->plr_home = room;
  do_save( ch , "" );
}
