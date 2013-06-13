#include "character.h"
#include "mud.h"
#include "clan.h"

static bool IsImperial( void *element, void *userData )
{
  const Character *imperial = (Character*) element;
  const Character *rebel = (Character*) userData;

  if( !can_see( rebel, imperial ) )
    {
      return FALSE;
    }

  if( get_timer( imperial, TIMER_RECENTFIGHT ) > 0 )
    {
      return FALSE;
    }

  if( IsNpc( imperial ) && nifty_is_name( "imperial", imperial->name )
      && imperial->fighting && who_fighting( imperial ) != rebel )
    {
      return TRUE;
    }

  if( !IsNpc( imperial ) && is_clanned( imperial ) && is_awake( imperial )
      && nifty_is_name( "empire", imperial->pcdata->clan->name ) )
    {
      return TRUE;
    }

  return FALSE;
}

static Character *GetImperialInRoom( Character *rebel )
{
  CerisList *imperials = List_CopyIf( rebel->in_room->People, IsImperial, rebel );
  Character *imperial = NULL;

  if( List_Count( imperials ) > 0 )
    {
      CerisListIterator *iter = CreateListIterator( imperials, ForwardsIterator );

      imperial = (Character*) ListIterator_GetData( iter );

      DestroyListIterator( iter );
    }

  DestroyList( imperials );
  return imperial;
}

bool spec_rebel_trooper( Character *rebel )
{
  Character *imperial = NULL;

  if ( !is_awake(rebel) || rebel->fighting )
    return FALSE;

  imperial = GetImperialInRoom( rebel );

  if( imperial )
    {
      do_yell( rebel, "Long live the Rebel Alliance!" );
      multi_hit( rebel, imperial, TYPE_UNDEFINED );
      return TRUE;
    }

  return FALSE;
}
