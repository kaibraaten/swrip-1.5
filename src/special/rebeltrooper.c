#include "character.h"
#include "mud.h"

bool spec_rebel_trooper( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !is_awake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( !can_see( ch, victim ) )
        continue;
      if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;
      if ( ( is_npc( victim ) && nifty_is_name( "imperial" , victim->name )
             && victim->fighting && who_fighting( victim ) != ch ) ||
           ( !is_npc( victim ) && victim->pcdata && victim->pcdata->clan && is_awake(victim)
             && nifty_is_name( "empire" , victim->pcdata->clan->name ) ) )
        {
          do_yell( ch, "Long live the Rebel Alliance!" );
          multi_hit( ch, victim, TYPE_UNDEFINED );
          return true;
        }

    }

  return false;
}
