#include "room.h"
#include "mud.h"

int NumberOfPeopleInRoom( const ROOM_INDEX_DATA *room )
{
  return List_Count( room->People );
}
