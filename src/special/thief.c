#include "character.hpp"
#include "mud.h"

bool spec_thief( Character *ch )
{
  Character *victim;
  Character *v_next;
  int gold, maxgold;

  if ( ch->Position != POS_STANDING )
    return false;

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->NextInRoom;

      if ( GetTrustLevel(victim) >= LEVEL_IMMORTAL
           ||   NumberBits( 2 ) != 0
           ||   !CanSeeCharacter( ch, victim ) )        /* Thx Glop */
        continue;

      if ( IsAwake(victim) && GetRandomNumberFromRange( 0, ch->TopLevel ) == 0 )
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
	  gold = victim->Gold * GetRandomNumberFromRange( 1, urange(2, ch->TopLevel/4, 10) ) / 100;
	  ch->Gold     += 9 * gold / 10;
	  victim->Gold -= gold;
	  if ( ch->Gold > maxgold )
	    {
	      BoostEconomy( ch->InRoom->Area, ch->Gold - maxgold/2 );
	      ch->Gold = maxgold/2;
	    }
	  return true;
        }
    }

  return false;
}
