#include "character.h"
#include "mud.h"
#include "area.h"

void do_buyhome( Character *ch, char *argument )
{
  Room *room = NULL;
  Area *pArea = NULL;
  const int houseCost = 100000;
  
  if ( !ch->InRoom )
    return;

  if ( IsNpc(ch) || !ch->PCData )
    return;

  if ( ch->PlayerHome != NULL )
    {
      SendToCharacter( "&RYou already have a home!\r\n&w", ch);
      return;
    }

  room = ch->InRoom;

  for ( pArea = FirstBSort; pArea; pArea = pArea->NextSort )
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

  if ( ch->Gold < houseCost )
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

  ch->Gold -= houseCost;

  RemoveBit( room->Flags , ROOM_EMPTY_HOME );
  SetBit( room->Flags , ROOM_PLR_HOME );

  FoldArea( room->Area, room->Area->Filename, false );

  ch->PlayerHome = room;
  do_save( ch , "" );
}
