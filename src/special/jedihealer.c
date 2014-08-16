#include "character.h"
#include "mud.h"

bool spec_jedi_healer( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !IsAwake(ch) )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( victim != ch && CanSeeCharacter( ch, victim ) && number_bits( 1 ) == 0 )
        break;
    }

  if ( !victim )
    return false;

  switch ( number_bits( 12 ) )
    {
    case 0:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "armor" ), ch->top_level, ch, victim );
      return true;

    case 1:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "good fortune" ), ch->top_level, ch, victim );
      return true;

    case 2:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_blindness( skill_lookup( "cure blindness" ),
                            ch->top_level, ch, victim );
      return true;

    case 3:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "cure light" ),
                   ch->top_level, ch, victim );
      return true;

    case 4:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_poison( skill_lookup( "cure poison" ),
                         ch->top_level, ch, victim );
      return true;

    case 5:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "refresh" ), ch->top_level, ch, victim );
      return true;

    }

  return false;
}
