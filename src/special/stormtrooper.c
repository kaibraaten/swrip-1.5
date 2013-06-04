#include "character.h"
#include "mud.h"
#include "clan.h"

bool spec_stormtrooper( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !is_awake(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( !can_see( ch, victim ) )
        continue;

      if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;

      if ( ( is_npc( victim ) && nifty_is_name( "rebel" , victim->name )
             && victim->fighting && who_fighting( victim ) != ch ) ||
           ( !is_npc( victim ) && is_clanned( victim ) && is_awake(victim)
             && nifty_is_name( "rebel" , victim->pcdata->clan->name ) ) )
        {
          do_yell( ch, "Die Rebel Scum!" );
          multi_hit( ch, victim, TYPE_UNDEFINED );
          return TRUE;
        }

    }

  return FALSE;
}
