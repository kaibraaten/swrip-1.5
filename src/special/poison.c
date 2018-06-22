#include "character.h"
#include "mud.h"
#include "skill.h"

bool spec_poison( Character *ch )
{
  Character *victim;

  if ( ch->Position != POS_FIGHTING
       || ( victim = GetFightingOpponent( ch ) ) == NULL
       ||   GetRandomPercent() > 2 * ch->TopLevel )
    return false;

  Act( AT_HIT, "You bite $N!",  ch, NULL, victim, TO_CHAR    );
  Act( AT_ACTION, "$n bites $N!",  ch, NULL, victim, TO_NOTVICT );
  Act( AT_POISON, "$n bites you!", ch, NULL, victim, TO_VICT    );
  spell_poison( gsn_poison, ch->TopLevel, ch, victim );

  return true;
}
