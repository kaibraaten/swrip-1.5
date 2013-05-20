#include "mud.h"

bool spec_poison( CHAR_DATA *ch )
{
  CHAR_DATA *victim;

  if ( ch->position != POS_FIGHTING
       || ( victim = who_fighting( ch ) ) == NULL
       ||   number_percent( ) > 2 * ch->top_level )
    return FALSE;

  act( AT_HIT, "You bite $N!",  ch, NULL, victim, TO_CHAR    );
  act( AT_ACTION, "$n bites $N!",  ch, NULL, victim, TO_NOTVICT );
  act( AT_POISON, "$n bites you!", ch, NULL, victim, TO_VICT    );
  spell_poison( gsn_poison, ch->top_level, ch, victim );

  return TRUE;
}
