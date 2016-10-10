#include "character.h"
#include "mud.h"

void do_buyhome( Character *ch, char *argument )
{
  Room *room = NULL;
  Area *pArea = NULL;
  const int houseCost = 100000;
  
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
      if ( room->Area == pArea )
        {
          SendToCharacter( "&RThis area isn't installed yet!\r\n&w", ch);
	  return;
        }
    }

  if ( !IsBitSet( room->Flags , ROOM_EMPTY_HOME ) )
    {
      SendToCharacter( "&RThis room isn't for sale!\r\n&w", ch);
      return;
    }

  if ( ch->gold < houseCost )
    {
      Echo( ch, "&RThis room costs %d credits you don't have enough!\r\n&w", houseCost);
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Set the room name. A very brief single line room description.\r\n", ch );
      SendToCharacter( "Usage: Buyhome <Room Name>\r\n", ch );
      return;
    }

  FreeMemory( room->Name );
  room->Name = CopyString( argument );

  ch->gold -= houseCost;

  RemoveBit( room->Flags , ROOM_EMPTY_HOME );
  SetBit( room->Flags , ROOM_PLR_HOME );

  FoldArea( room->Area, room->Area->filename, false );

  ch->plr_home = room;
  do_save( ch , "" );
}
