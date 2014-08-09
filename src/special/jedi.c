#include "character.h"
#include "mud.h"

bool spec_jedi( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !is_awake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( victim != ch && can_see( ch, victim ) && number_bits( 1 ) == 0 )
        break;
    }

  if ( !victim )
    return false;

  switch ( number_bits( 3 ) )
    {
    case 0:
      spell_smaug( skill_lookup( "armor" ), ch->top_level, ch, victim );
      return true;

    case 1:
      spell_smaug( skill_lookup( "alertness" ), ch->top_level, ch, victim );
      return true;

    case 2:
      spell_cure_blindness( skill_lookup( "cure blindness" ),
                            ch->top_level, ch, victim );
      return true;

    case 3:
      spell_smaug( skill_lookup( "cure light" ),
                   ch->top_level, ch, victim );
      return true;

    case 4:
      spell_cure_poison( skill_lookup( "cure poison" ),
                         ch->top_level, ch, victim );
      return true;

    case 5:
      spell_smaug( skill_lookup( "refresh" ), ch->top_level, ch, victim );
      return true;

    case 6:
      spell_smaug( skill_lookup( "cure serious" ), ch->top_level, ch, victim );
      return true;

    case 7:
      spell_smaug( skill_lookup( "beauty" ), ch->top_level, ch, victim );
      return true;
    }

  return false;
}
