#include "character.h"
#include "mud.h"

bool spec_stormtrooper( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( !can_see( ch, victim ) )
        continue;
      if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;
      if ( ( IS_NPC( victim ) && nifty_is_name( "rebel" , victim->name )
             && victim->fighting && who_fighting( victim ) != ch ) ||
           ( !IS_NPC( victim ) && victim->pcdata && victim->pcdata->clan && IS_AWAKE(victim)
             && nifty_is_name( "rebel" , victim->pcdata->clan->name ) ) )
        {
          do_yell( ch, "Die Rebel Scum!" );
          multi_hit( ch, victim, TYPE_UNDEFINED );
          return TRUE;
        }

    }

  return FALSE;
}
