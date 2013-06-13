#include "character.h"
#include "mud.h"
#include "clan.h"

static bool IsRebel( void *element, void *userData )
{
  const Character *rebel = (Character*) element;
  const Character *stormtrooper = (Character*) userData;

  if( !can_see( stormtrooper, rebel ) )
    {
      return FALSE;
    }

  if( get_timer( rebel, TIMER_RECENTFIGHT ) > 0 )
    {
      return FALSE;
    }

  if( IsNpc( rebel ) && nifty_is_name( "rebel", rebel->name )
      && rebel->fighting && who_fighting( rebel ) != stormtrooper )
    {
      return TRUE;
    }

  if( !IsNpc( rebel ) && is_clanned( rebel ) && is_awake( rebel )
      && nifty_is_name( "rebel", rebel->pcdata->clan->name ) )
    {
      return TRUE;
    }

  return FALSE;
}

static Character *GetRebelInRoom( Character *stormtrooper )
{
  CerisList *rebels = List_CopyIf( stormtrooper->in_room->People, IsRebel, stormtrooper );
  Character *rebel = NULL;

  if( List_Count( rebels ) > 0 )
    {
      CerisListIterator *iter = CreateListIterator( rebels, ForwardsIterator );

      rebel = (Character*) ListIterator_GetData( iter );

      DestroyListIterator( iter );
    }

  DestroyList( rebels );
  return rebel;
}

bool spec_stormtrooper( Character *stormtrooper )
{
  Character *rebel = NULL;

  if ( !is_awake(stormtrooper) || stormtrooper->fighting )
    return FALSE;

  rebel = GetRebelInRoom( stormtrooper );

  if( rebel )
    {
      do_yell( stormtrooper, "Die Rebel Scum!" );
      multi_hit( stormtrooper, rebel, TYPE_UNDEFINED );
      return TRUE;
    }

  return FALSE;
}
