#include "character.h"
#include "mud.h"

bool spec_clan_guard( Character *ch )
{
  Character *victim;
  Character *v_next;
  CLAN_DATA *clan;
  bool found = false;

  if ( !is_awake(ch) || ch->fighting )
    return false;

  clan = get_clan(ch->name);

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( !can_see( ch, victim ) )
        continue;
      if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;
      if ( !IsNpc( victim ) && victim->pcdata && victim->pcdata->clan && clan && is_awake(victim)
           && (clan != victim->pcdata->clan )
           && ( !victim->pcdata->clan->mainclan || clan != victim->pcdata->clan->mainclan )
           && ( !clan->mainclan || clan->mainclan != victim->pcdata->clan ) )
        {
          if(found)
            continue;

          do_yell( ch, "Hey you're not allowed in here!" );
          multi_hit( ch, victim, TYPE_UNDEFINED );
          return true;
        }
    }

  return false;
}
