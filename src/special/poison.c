#include "character.h"
#include "mud.h"

bool spec_poison( Character *ch )
{
  Character *victim;

  if ( ch->position != POS_FIGHTING
       || ( victim = GetFightingOpponent( ch ) ) == NULL
       ||   GetRandomPercent( ) > 2 * ch->top_level )
    return false;

  Act( AT_HIT, "You bite $N!",  ch, NULL, victim, TO_CHAR    );
  Act( AT_ACTION, "$n bites $N!",  ch, NULL, victim, TO_NOTVICT );
  Act( AT_POISON, "$n bites you!", ch, NULL, victim, TO_VICT    );
  spell_poison( gsn_poison, ch->top_level, ch, victim );

  return true;
}
