#include <vector>
#include <algorithm>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

bool spec_thief( Character *ch )
{
  if ( ch->Position != POS_STANDING )
    return false;

  std::vector<Character*> victims(std::begin(ch->InRoom->Characters()),
                                  std::end(ch->InRoom->Characters()));
  random_shuffle(std::begin(victims), std::end(victims));

  for(Character *victim : victims)
    {
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
          long maxgold = 1000;
	  long gold = victim->Gold * GetRandomNumberFromRange( 1, urange(2, ch->TopLevel/4, 10) ) / 100;
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
