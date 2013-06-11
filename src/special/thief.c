#include "character.h"
#include "mud.h"

bool spec_thief( Character *ch )
{
  Character *victim;
  Character *v_next;
  int gold, maxgold;

  if ( ch->position != POS_STANDING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( GetTrustedLevel(victim) >= LEVEL_IMMORTAL
           ||   number_bits( 2 ) != 0
           ||   !can_see( ch, victim ) )        /* Thx Glop */
        continue;

      if ( is_awake(victim) && number_range( 0, ch->top_level ) == 0 )
        {
          act( AT_ACTION, "You discover $n's hands in your wallet!",
               ch, NULL, victim, TO_VICT );
          act( AT_ACTION, "$N discovers $n's hands in $S wallet!",
               ch, NULL, victim, TO_NOTVICT );
          return TRUE;
        }
      else
        {
          maxgold = 1000;
	  gold = victim->gold * number_range( 1, URANGE(2, ch->top_level/4, 10) ) / 100;
	  ch->gold     += 9 * gold / 10;
	  victim->gold -= gold;
	  if ( ch->gold > maxgold )
	    {
	      boost_economy( ch->in_room->area, ch->gold - maxgold/2 );
	      ch->gold = maxgold/2;
	    }
	  return TRUE;
        }
    }

  return FALSE;
}
