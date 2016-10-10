#include "character.h"
#include "mud.h"

bool spec_thief( Character *ch )
{
  Character *victim;
  Character *v_next;
  int gold, maxgold;

  if ( ch->position != POS_STANDING )
    return false;

  for ( victim = ch->in_room->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( GetTrustLevel(victim) >= LEVEL_IMMORTAL
           ||   NumberBits( 2 ) != 0
           ||   !CanSeeCharacter( ch, victim ) )        /* Thx Glop */
        continue;

      if ( IsAwake(victim) && GetRandomNumberFromRange( 0, ch->top_level ) == 0 )
        {
          Act( AT_ACTION, "You discover $n's hands in your wallet!",
               ch, NULL, victim, TO_VICT );
          Act( AT_ACTION, "$N discovers $n's hands in $S wallet!",
               ch, NULL, victim, TO_NOTVICT );
          return true;
        }
      else
        {
          maxgold = 1000;
	  gold = victim->gold * GetRandomNumberFromRange( 1, urange(2, ch->top_level/4, 10) ) / 100;
	  ch->gold     += 9 * gold / 10;
	  victim->gold -= gold;
	  if ( ch->gold > maxgold )
	    {
	      BoostEconomy( ch->in_room->Area, ch->gold - maxgold/2 );
	      ch->gold = maxgold/2;
	    }
	  return true;
        }
    }

  return false;
}
