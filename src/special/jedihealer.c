#include "character.h"
#include "mud.h"
#include "skill.h"

bool spec_jedi_healer( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !IsAwake(ch) )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( victim != ch && CanSeeCharacter( ch, victim ) && NumberBits( 1 ) == 0 )
        break;
    }

  if ( !victim )
    return false;

  switch ( NumberBits( 12 ) )
    {
    case 0:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( LookupSkill( "armor" ), ch->top_level, ch, victim );
      return true;

    case 1:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( LookupSkill( "good fortune" ), ch->top_level, ch, victim );
      return true;

    case 2:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_blindness( LookupSkill( "cure blindness" ),
                            ch->top_level, ch, victim );
      return true;

    case 3:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( LookupSkill( "cure light" ),
                   ch->top_level, ch, victim );
      return true;

    case 4:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_poison( LookupSkill( "cure poison" ),
                         ch->top_level, ch, victim );
      return true;

    case 5:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( LookupSkill( "refresh" ), ch->top_level, ch, victim );
      return true;

    }

  return false;
}
