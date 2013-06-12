#include "mud.h"
#include "character.h"

bool spec_guardian( Character *ch )
{
  CerisListIterator *iter = NULL;
  Character *ech = NULL;
  int max_evil = 300;
  
  if ( !is_awake(ch) || ch->fighting )
    return FALSE;

  iter = CreateListIterator( ch->in_room->People, ForwardsIterator );

  for( ; !ListIterator_IsDone( iter ); ListIterator_Next( iter ) )
    {
      Character *victim = (Character*) ListIterator_GetData( iter );

      if ( victim->fighting
           && who_fighting( victim ) != ch
           && victim->alignment < max_evil )
        {
          max_evil = victim->alignment;
          ech      = victim;
        }
    }

  DestroyListIterator( iter );

  if ( ech )
    {
      act( AT_YELL, "$n screams 'PROTECT THE INNOCENT!!",
           ch, NULL, NULL, TO_ROOM );
      multi_hit( ch, ech, TYPE_UNDEFINED );
      return TRUE;
    }

  return FALSE;
}
