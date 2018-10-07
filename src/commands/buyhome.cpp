#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"

void do_buyhome( Character *ch, std::string argument )
{
  const int houseCost = 100000;
  
  if ( IsNpc(ch) || !ch->PCData )
    return;

  if ( ch->PlayerHome != NULL )
    {
      ch->Echo( "&RYou already have a home!\r\n&w" );
      return;
    }

  Room *room = ch->InRoom;

  for ( const Area *pArea = FirstBSort; pArea; pArea = pArea->NextSort )
    {
      if ( room->Area == pArea )
        {
          ch->Echo( "&RThis area isn't installed yet!\r\n&d" );
	  return;
        }
    }

  if ( !room->Flags.test( Flag::Room::EmptyHome ) )
    {
      ch->Echo( "&RThis room isn't for sale!\r\n&d" );
      return;
    }

  if ( ch->Gold < houseCost )
    {
      ch->Echo( "&RThis room costs %d credits you don't have enough!\r\n&d" );
      return;
    }

  if ( argument.empty() )
    {
      ch->Echo( "Set the room name. A very brief single line room description.\r\n" );
      ch->Echo( "Usage: Buyhome <Room Name>\r\n" );
      return;
    }

  room->Name = argument;

  ch->Gold -= houseCost;

  room->Flags.reset( Flag::Room::EmptyHome );
  room->Flags.set( Flag::Room::PlayerHome );

  FoldArea( room->Area, room->Area->Filename, false );

  ch->PlayerHome = room;
  do_save( ch , "" );
}

