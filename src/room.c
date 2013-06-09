#include "room.h"
#include "mud.h"

int NumberOfPeopleInRoom( const ROOM_INDEX_DATA *room )
{
  return List_Count( room->People );
}

Character *GetFirstPersonInRoom( const ROOM_INDEX_DATA *room )
{
  Character *person = NULL;
  CerisListIterator *iter = CreateListIterator( room->People, ForwardsIterator );

  if( !ListIterator_IsDone( iter ) )
    {
      person = (Character*) ListIterator_GetData( iter );
    }

  DestroyListIterator( iter );
  return person;
}
