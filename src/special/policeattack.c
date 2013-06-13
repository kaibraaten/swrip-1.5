#include "mud.h"
#include "character.h"

bool spec_police_attack( Character *ch )
{
  CerisList *peopleInRoom =  NULL;
  CerisListIterator *peopleIterator = NULL;

  if ( !is_awake(ch) || ch->fighting )
    return FALSE;

  peopleInRoom = List_Copy( ch->in_room->People );
  peopleIterator = CreateListIterator( peopleInRoom, ForwardsIterator );

  for( ; !ListIterator_IsDone( peopleIterator ); ListIterator_Next( peopleIterator ) )
    {
      int vip = 0;
      Character *victim = (Character*) ListIterator_GetData( peopleIterator );

      if ( IsNpc(victim) )
        continue;

      if ( !can_see( ch, victim ) )
        continue;

      if ( number_bits ( 1 ) == 0 )
        continue;

      for ( vip = 0 ; vip < 32 ; vip++ )
	{
	  if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
	    {
	      char buf[MAX_STRING_LENGTH];
	      sprintf( buf , "Hey you're wanted on %s!", planet_flags[vip] );
	      do_say( ch , buf );
	      REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
	      multi_hit( ch, victim, TYPE_UNDEFINED );

	      DestroyListIterator( peopleIterator );
	      DestroyList( peopleInRoom );
	      return TRUE;
	    }
	}
    }

  DestroyListIterator( peopleIterator );
  DestroyList( peopleInRoom );
  return FALSE;
}
