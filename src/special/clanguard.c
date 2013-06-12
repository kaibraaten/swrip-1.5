#include "character.h"
#include "mud.h"
#include "clan.h"

bool spec_clan_guard( Character *ch )
{
  Clan *clan = NULL;
  bool result = FALSE;
  CerisList *peopleInRoom = NULL;
  CerisListIterator *peopleIterator = NULL;

  if ( !is_awake(ch) || ch->fighting )
    return FALSE;

  clan = GetClan(ch->name);

  peopleInRoom = List_Copy( ch->in_room->People );
  peopleIterator = CreateListIterator( peopleInRoom, ForwardsIterator );

  for( ; !ListIterator_IsDone( peopleIterator ); ListIterator_Next( peopleIterator ) )
    {
      Character *victim = (Character*) ListIterator_GetData( peopleIterator );

      if ( !can_see( ch, victim ) )
        continue;

      if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;

      if ( !IsNpc( victim )
	   && is_clanned( victim )
	   && clan
	   && is_awake(victim)
           && clan != victim->pcdata->clan
           && ( !victim->pcdata->clan->mainclan || clan != victim->pcdata->clan->mainclan )
           && ( !clan->mainclan || clan->mainclan != victim->pcdata->clan ) )
        {
          do_yell( ch, "Hey you're not allowed in here!" );
          multi_hit( ch, victim, TYPE_UNDEFINED );
	  result = TRUE;
	  break;
        }
    }

  DestroyListIterator( peopleIterator );
  DestroyList( peopleInRoom );

  return result;
}
